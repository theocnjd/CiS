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
        Int32 _id;
        string _cDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = LogOnIdentity();
            lblMemberCnt.Text = mthcln.GetActMembers(_id);
            _cDate = DateTime.Now.ToShortDateString();

            if (!IsPostBack)
            {
                lblAnonymousDonor.Text = mthcln.GetAnonymousDonor(_id, DateTime.Now.ToShortDateString());
                lblDonMonthTotal.Text = mthcln.GetTotalDonationByMonth(_id, DateTime.Now.ToShortDateString());

                // supply valiues to datasource's parameters
                Dsrc_DonCatByYear.SelectParameters[0].DefaultValue = _id.ToString();
                Dsrc_DonCatByYear.SelectParameters[1].DefaultValue = _cDate;

                Dsrc_DonTypeByDate.SelectParameters[0].DefaultValue = _id.ToString();
                Dsrc_DonTypeByDate.SelectParameters[1].DefaultValue = _cDate;

                Dsrc_DonPymntType.SelectParameters[0].DefaultValue = _id.ToString();
                Dsrc_DonPymntType.SelectParameters[1].DefaultValue = _cDate;
            }
           
            

            
        }

        protected void ViewRptDashboardBtn_Click(object sender, EventArgs e)
        {
            _id = LogOnIdentity();
            lblMemberCnt.Text = mthcln.GetActMembers(_id);
            lblAnonymousDonor.Text = mthcln.GetAnonymousDonor(_id, DE_Date.Text);

            // supply valiues to datasource's parameters
            Dsrc_DonCatByYear.SelectParameters[0].DefaultValue = _id.ToString();
            Dsrc_DonCatByYear.SelectParameters[1].DefaultValue = DE_Date.Text;

            Dsrc_DonTypeByDate.SelectParameters[0].DefaultValue = _id.ToString();
            Dsrc_DonTypeByDate.SelectParameters[1].DefaultValue = DE_Date.Text;

            Dsrc_DonPymntType.SelectParameters[0].DefaultValue = _id.ToString();
            Dsrc_DonPymntType.SelectParameters[1].DefaultValue = DE_Date.Text;

        }

        private Int32 LogOnIdentity()
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                string uid = Context.User.Identity.Name;
                Int32 id = Convert.ToInt32(mthcln.GetLogOnIdentity(uid));
                return id;
            }
            else
            {
                return 0;
            }
        }

    }
}