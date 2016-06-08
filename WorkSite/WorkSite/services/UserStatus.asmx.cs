using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WorkSite.services
{
    /// <summary>
    /// Summary description for UserStatus
    /// </summary>
    [WebService(Namespace = "https://surveys.kenexa.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class UserStatus : System.Web.Services.WebService
    {
        [WebMethod]
        public bool LoggedIn()
        {
            return (User.Identity.IsAuthenticated);
        }
    }
}
