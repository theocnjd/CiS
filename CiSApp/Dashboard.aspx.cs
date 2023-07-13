using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class Dashboard : System.Web.UI.Page
    {
        readonly MethodCollections mtdCol = new MethodCollections();
        protected void Page_Load(object sender, EventArgs e)
        {
            RunReport(); 
        }

        protected void ViewRptdashboardBtn_Click(object sender, EventArgs e)
        {
            RunReport();
        }
        private void RunReport()
        {
            string _date = DE_Date.Text.ToString();
            Int32 orgIdentity = 1;
            DateTime dDate = DateTime.Now;

            //Response.Write(dateCreated + validation + provider + methodofdelivery);

            //Reset
            RV_Dashboard.Reset();

            //DataSource
            DataTable dt = mtdCol.GetDonationByPaymentType(orgIdentity, _date);
            DataTable dt2 = mtdCol.GetDonationCategoryByYear(orgIdentity, _date);
            DataTable dt3 = mtdCol.GetAnonymousDonorByDate(orgIdentity, _date);
            DataTable dt4 = mtdCol.GetActiveMembers(orgIdentity);

            ReportDataSource rds = new ReportDataSource("Dst_DonByPayment", dt);

            ReportDataSource[] rptDtSrc = new ReportDataSource[]
            {
                new ReportDataSource("Dst_DonByPayment", dt),
                new ReportDataSource("Dst_DonationDetails", dt2),
                new ReportDataSource("Dst_Anonymous", dt3),
                new ReportDataSource("Dst_Member", dt4)
            };


            RV_Dashboard.LocalReport.DataSources.Add(rds);

            //Path
            RV_Dashboard.LocalReport.ReportPath = @"Reports\RPTDashboard.rdlc";

            //Parameters
            ReportParameter[] rptParams = new ReportParameter[]{

                new ReportParameter("transDate",dDate.ToShortDateString()),
                new ReportParameter("OrgIdentity", orgIdentity.ToString())
            };
            RV_Dashboard.LocalReport.SetParameters(rptParams);

            // Refresh
            RV_Dashboard.LocalReport.Refresh();
        }
    }
}