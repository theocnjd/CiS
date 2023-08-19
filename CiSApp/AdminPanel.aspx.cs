using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                MethodCollections mthd = new MethodCollections();
                string uid = Context.User.Identity.Name;

                Int32 roleid = mthd.GetCurrentUserRole(uid.ToString(), 0);
                if(roleid == 1)
                {
                    gvAdminPanel.Visible = true;
                }
            }


            // Hide dasboard on the master page.
            Control crtlDashboard = Master.FindControl("DashboardWrapper");
            if (crtlDashboard != null)
            {
                crtlDashboard.Visible = false;
            }

            // Hide interface on the master page.
            Control crtlInterface = Master.FindControl("dvinterface");
            if (crtlInterface != null)
            {
                crtlInterface.Visible = false;
            }

            // Hide sidebar Toggle
            //Control dvsidebarToggle = Master.FindControl("dvsidebarToggle");
            //if (dvsidebarToggle != null)
            //{
            //    dvsidebarToggle.Visible = false;
            //}
        }
    }
}