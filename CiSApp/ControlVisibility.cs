using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CiS
{
    public class ControlVisibility
    {
        public void ControlSideBar()
        {
            SiteMaster master = new SiteMaster();
            Control orgControl = master.FindControl("masterTopNavBar");
            if (orgControl != null)
            {
                orgControl.Visible = false;
            }
            Control sidebarControl = master.FindControl("accordionSidebar");
            if (sidebarControl != null)
            {
                sidebarControl.Visible = false;
            }
            Control masterfooter = master.FindControl("masterfooter");
            if (masterfooter != null)
            {
                masterfooter.Visible = false;
            }
        }
    }
}