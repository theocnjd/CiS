using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class ConfirmEmailAlert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide sidebar on the master page.
            Control orgControl = Master.FindControl("sidebarVisibility");
            if (orgControl != null)
            {
                orgControl.Visible = false;
            }

            // Hide dasjboard on the master page.
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
            Control dvsidebarToggle = Master.FindControl("dvsidebarToggle");
            if (dvsidebarToggle != null)
            {
                dvsidebarToggle.Visible = false;
            }

            // Hide Login panel
            Control mastertopnavbar = Master.FindControl("masterTopNavBar");
            if (mastertopnavbar != null)
            {
                mastertopnavbar.Visible = false;
            }

            // Hide entire sidebar
            Control accordionSidebar = Master.FindControl("accordionSidebar");
            if (accordionSidebar != null)
            {
                accordionSidebar.Visible = false;
            }
        }
    }
}