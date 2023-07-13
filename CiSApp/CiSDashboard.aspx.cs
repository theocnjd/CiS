using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CiS
{
    public partial class CiSDashboard : System.Web.UI.Page
    {
        readonly MethodCollections mthcln = new MethodCollections();
        string identid;
        protected void Page_Load(object sender, EventArgs e)
        {
            identid = mthcln.GetLogOnIdentity(User.Identity.Name);

            ViewState["logOnid"] = Convert.ToInt32(mthcln.GetLogOnIdentity(User.Identity.Name));

            lblMemberCnt.Text = mthcln.GetActMembers(Convert.ToInt32(identid));
            lblAnonymousDonor.Text = mthcln.GetAnonymousDonor(1, DateTime.Now.ToShortDateString());
            lblDonMonthTotal.Text = mthcln.GetTotalDonationByMonth(1, DateTime.Now.ToShortDateString());
        }

        protected void ViewRptDashboardBtn_Click(object sender, EventArgs e)
        {

            identid = mthcln.GetLogOnIdentity(User.Identity.Name);
            lblMemberCnt.Text = mthcln.GetActMembers(Convert.ToInt32(identid));
            lblAnonymousDonor.Text = mthcln.GetAnonymousDonor(1, DE_Date.Text);

        }

    }
}