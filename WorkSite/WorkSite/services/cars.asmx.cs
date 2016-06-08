using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WorkSite.services
{
    /// <summary>
    /// Summary description for cars
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class cars : System.Web.Services.WebService
    {

        [WebMethod]
        public List<string> CarList(List<string> aData)
        {
            List<string> carList = new List<string>();

            carList.Add("BMW");
            carList.Add("Volkswagen");
            carList.Add("Merc");
            carList.Add("Dodge");
            carList.Add("Fiat");

            return carList;
        }
    }
}
