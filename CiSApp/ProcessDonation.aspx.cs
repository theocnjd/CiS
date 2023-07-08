using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class ProcessDonation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Context.User.Identity.IsAuthenticated)
            {
                MethodCollections mthd = new MethodCollections();
                Application["orgkey"] = mthd.GetLogonOrgKey(Context.User.Identity.Name);

                // set values for donation details select parameters
                ds_Donation.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                ds_Donation.SelectParameters[2].DefaultValue = DateTime.Now.ToShortDateString();

                // set values for donation head select parameters
                ds_DonHead.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                ds_DonHead.SelectParameters[1].DefaultValue = DateTime.Now.ToShortDateString();

                // set values for lookup datasets parameters
                ds_User.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                ds_xUser.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();

                // Bind the data sources to controls
                GdvwDonDetails.DataBind();
                GdvwDonHead.DataBind();

            }
            else
            {
                ds_Donation.SelectParameters[0].DefaultValue = string.Empty;
                ds_User.SelectParameters[0].DefaultValue = string.Empty;
                ds_xUser.SelectParameters[0].DefaultValue = string.Empty;
                GdvwDonDetails.DataBind();
            }
        }

        protected void BtnDonor_Click(object sender, EventArgs e)
        {
            if (ChkBxDnrList.Text == "Yes")
            {
                ds_Donation.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                ds_Donation.SelectParameters[1].DefaultValue = true.ToString();
                ds_Donation.SelectParameters[2].DefaultValue = DateTime.Now.ToShortDateString();
                ds_Donation.Select(DataSourceSelectArguments.Empty);
                GdvwDonDetails.DataBind();
            }
        }

        protected void GdvwDonDetails_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ds_Donation.UpdateParameters[13].DefaultValue = Application["orgkey"].ToString();
        }

        protected void GdvwDonDetails_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ds_Donation.InsertParameters[13].DefaultValue = Application["orgkey"].ToString();
            ds_Donation.InsertParameters[14].DefaultValue = Convert.ToByte(1).ToString();
        }

        protected void GdvwDonDetails_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            // set values for donation head select parameters
            ds_DonHead.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
            ds_DonHead.SelectParameters[1].DefaultValue = DateTime.Now.ToShortDateString();
            GdvwDonHead.DataBind();
        }
    }
}