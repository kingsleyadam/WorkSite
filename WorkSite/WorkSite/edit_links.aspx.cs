using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkSite
{
    public partial class edit_links : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet linkTypes = LinkTypes();
                repDropDownItems.DataSource = linkTypes;
                repDropDownItems.DataBind();

                ddLinkType.Items.Add(new ListItem("Please Select...", "-1"));
                foreach (DataRow dr in linkTypes.Tables[0].Rows)
                {
                    ddLinkType.Items.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
        }

        protected void lbtnLinkType_Click(object sender, EventArgs e)
        {
            LinkButton lbtnLinkType = (LinkButton)sender;
            int typeID = Convert.ToInt32(lbtnLinkType.CommandArgument);
            repDownDownLinks.DataSource = LinksByType(typeID);
            repDownDownLinks.DataBind();

            lbtnDropDownLink.Text = "Link... <span class='caret'></span>";
            lbtnDropDown.Text = "Link Group: " + lbtnLinkType.Text + " <span class='caret'></span>";
            pnlDropDownLinks.Visible = true;
            pnlUpdateLink.Visible = false;
        }

        protected void lbtnLink_Click(object sender, EventArgs e)
        {
            LinkButton lbtnLink = (LinkButton)sender;
            RepeaterItem ri = (RepeaterItem)lbtnLink.Parent;
            HiddenField hdnURL = (HiddenField)ri.FindControl("hdnURL"), hdnType = (HiddenField)ri.FindControl("hdnType"), hdnLinkIDRepeater = (HiddenField)ri.FindControl("hdnLinkIDRepeater");
            ListItem ddi = ddLinkType.Items.FindByValue(hdnType.Value);

            ddLinkType.SelectedIndex = ddLinkType.Items.IndexOf(ddi);
            txtName.Text = lbtnLink.Text;
            txtAddress.Text = hdnURL.Value;

            lbtnUpdateLink.CommandName = "Update";
            lbtnUpdateLink.Text = "Update Link";

            hdnLinkID.Value = hdnLinkIDRepeater.Value;

            lbtnDropDownLink.Text = "Link: " + lbtnLink.Text + " <span class='caret'></span>";
            pnlUpdateLink.Visible = true;
        }

        private DataSet LinkTypes()
        {
            DataSet ds = new DataSet();

            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("akLinks_GetLinkTypes", sqlCon);
                SqlDataAdapter ad = new SqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCon.Open();
                try
                {
                    ad.Fill(ds);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return ds;
        }

        private DataSet LinksByType(int typeID)
        {
            DataSet ds = new DataSet();

            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("akLinks_GetLinksByType", sqlCon);
                SqlDataAdapter ad = new SqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@Type", typeID);

                sqlCon.Open();
                try
                {
                    ad.Fill(ds);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return ds;
        }

        protected void lbtnAddNew_Click(object sender, EventArgs e)
        {
            ddLinkType.SelectedIndex = 0;
            txtName.Text = "";
            txtAddress.Text = "";

            lbtnDropDownLink.Text = "Link... <span class='caret'></span>";
            lbtnUpdateLink.Text = "Add Link";
            lbtnUpdateLink.CommandName = "Add";

            hdnLinkID.Value = "-1";

            pnlUpdateLink.Visible = true;
        }

        private void AddUpdateLink(ref int linkID, string name, string address, int type, Guid userID)
        {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("akLinks_AddUpdateLink", sqlCon);
                SqlDataAdapter ad = new SqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramID = new SqlParameter("@LinkID", SqlDbType.Int);
                if (linkID == -1)
                {
                    paramID.Direction = ParameterDirection.Output;
                }
                else
                {
                    paramID.Value = linkID;
                }

                sqlCmd.Parameters.Add(paramID);
                sqlCmd.Parameters.AddWithValue("@Name", name);
                sqlCmd.Parameters.AddWithValue("@Address", address);
                sqlCmd.Parameters.AddWithValue("@Type", type);
                sqlCmd.Parameters.AddWithValue("@UserID", userID);

                sqlCon.Open();
                try
                {
                    sqlCmd.ExecuteNonQuery();

                    if (linkID == -1)
                        linkID = (int)paramID.Value;

                    pnlStatus.CssClass = "alert alert-success";
                    pnlStatus.Visible = true;
                    lblStatusMessage.Text = "Success!";
                }
                catch (Exception ex)
                {
                    pnlStatus.CssClass = "alert alert-danger";
                    pnlStatus.Visible = true;
                    lblStatusMessage.Text = "Error, something went wrong. More Info: " + ex.Message;
                }
            }
        }

        private void DeleteLink(int linkID)
        {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("akLinks_DeleteLink", sqlCon);
                SqlDataAdapter ad = new SqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramID = new SqlParameter("@LinkID", SqlDbType.Int);
                paramID.Value = linkID;

                sqlCmd.Parameters.Add(paramID);
                sqlCon.Open();
                try
                {
                    sqlCmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void lbtnUpdateLink_Click(object sender, EventArgs e)
        {
            int linkID = Convert.ToInt32(hdnLinkID.Value);
            string name = txtName.Text, address = txtAddress.Text;
            int type = Convert.ToInt32(ddLinkType.SelectedValue);
            Guid userID = new Guid(Membership.GetUser().ProviderUserKey.ToString());

            if (lbtnUpdateLink.CommandName == "Update")
            {
                AddUpdateLink(ref linkID, name, address, type, userID);
            }
            else if (lbtnUpdateLink.CommandName == "Add")
            {
                AddUpdateLink(ref linkID, name, address, type, userID);
                lbtnDropDownLink.Text = "Link: " + name + " <span class='caret'></span>";
                lbtnDropDown.Text = "Link Group: " + ddLinkType.SelectedItem.ToString() + " <span class='caret'></span>";

                hdnLinkID.Value = linkID.ToString();
                lbtnUpdateLink.CommandName = "Update";
                lbtnUpdateLink.Text = "Update Link";
                
                repDownDownLinks.DataSource = LinksByType(type);
                repDownDownLinks.DataBind();

                pnlDropDownLinks.Visible = true;
            }
        }

        protected void lbtnDeleteLink_Click(object sender, EventArgs e)
        {
            int linkID = Convert.ToInt32(hdnLinkID.Value);
            int type = Convert.ToInt32(ddLinkType.SelectedValue);

            DeleteLink(linkID);
            
            repDownDownLinks.DataSource = LinksByType(type);
            repDownDownLinks.DataBind();

            lbtnDropDownLink.Text = "Link... <span class='caret'></span>";

            pnlUpdateLink.Visible = false;
        }
    }
}