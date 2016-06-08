<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edit_links.aspx.cs" Inherits="WorkSite.edit_links" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <asp:Label ID="lblEdit" runat="server" Text="Edit Links" CssClass="panel-title"></asp:Label>
        </div>
        <div class="panel-body">
            <div class="btn-group">
                <asp:LinkButton ID="lbtnDropDown" runat="server" CssClass="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">Link Group... <span class="caret"></span></asp:LinkButton>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <asp:Repeater ID="repDropDownItems" runat="server">
                        <ItemTemplate>
                            <li role="presentation">
                                <asp:LinkButton ID="lbtnLinkType" runat="server" Text='<%# Eval("Description") %>' CommandArgument='<%# Eval("Type") %>' OnClick="lbtnLinkType_Click" />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <asp:Panel ID="pnlDropDownLinks" runat="server" Visible="false" CssClass="btn-group">
                <asp:LinkButton ID="lbtnDropDownLink" runat="server" CssClass="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">Link... <span class="caret"></span></asp:LinkButton>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <asp:Repeater ID="repDownDownLinks" runat="server">
                        <ItemTemplate>
                            <li role="presentation">
                                <asp:LinkButton ID="lbtnLink" runat="server" Text='<%# Eval("Name") %>' CommandArgument='<%# Eval("LinkID") %>' OnClick="lbtnLink_Click" />
                                <asp:HiddenField ID="hdnURL" runat="server" Value='<%# Eval("Address") %>' Visible="false" />
                                <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("Type") %>' Visible="false" />
                                <asp:HiddenField ID="hdnLinkIDRepeater" runat="server" Value='<%# Eval("LinkID") %>' Visible="false" />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </asp:Panel>
            <div class="btn-group">
                <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="btn btn-default" OnClick="lbtnAddNew_Click"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></asp:LinkButton>
            </div>
            <asp:Panel ID="pnlUpdateLink" runat="server" CssClass="panel panel-default edit-link-panel" Visible="false">
                <div class="panel-body">
                    <asp:HiddenField ID="hdnLinkID" runat="server" Visible="false" />
                    <div class="form-group">
                        <asp:Label ID="lblLinkType" runat="server" Text="Link Group" AssociatedControlID="ddLinkType"></asp:Label>
                        <asp:DropDownList ID="ddLinkType" runat="server" CssClass="form-control" DataValueField="Type" DataTextField="Description"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Link Name" AssociatedControlID="txtName"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblAddress" runat="server" Text="Link URL" AssociatedControlID="txtAddress"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Full Link URL"></asp:TextBox>
                    </div>
                    <asp:Panel ID="pnlStatus" runat="server" CssClass="alert alert-success" role="alert" Visible="false">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label ID="lblStatusMessage" runat="server" Text="Label"></asp:Label>
                    </asp:Panel>
                    <asp:LinkButton ID="lbtnUpdateLink" runat="server" CssClass="btn btn-default" CommandName="Update" OnClick="lbtnUpdateLink_Click">Update Link</asp:LinkButton>
                    <asp:LinkButton ID="lbtnDeleteLink" runat="server" CssClass="btn btn-danger" OnClick="lbtnDeleteLink_Click">Delete Link</asp:LinkButton>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavaScriptPlaceHolder" runat="server">
</asp:Content>
