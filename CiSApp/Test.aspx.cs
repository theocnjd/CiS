using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class Test : System.Web.UI.Page
    {
        string orgid;
        protected void Page_Load(object sender, EventArgs e)
        {
            string orgid;
            if (Request.QueryString.HasKeys())
            {
                orgid = Request.QueryString["orgid"];
                SqlDataSource1.SelectParameters[0].DefaultValue = orgid;
            }
            else
            {
                Guid org = new Guid("34DB231B-DC83-40FF-B455-7BA7BF25B725");
                SqlDataSource1.SelectParameters[0].DefaultValue = "34DB231B-DC83-40FF-B455-7BA7BF25B725";
                //ystem.Guid.NewGuid().ToString();
            }
        }
    }
}