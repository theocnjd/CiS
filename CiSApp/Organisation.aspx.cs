using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class Organisation : System.Web.UI.Page
    {
        string orgid;
        protected void Page_Load(object sender, EventArgs e)
        {
            string orgid;
            if (Request.QueryString.HasKeys())
            {
                orgid = Request.QueryString["orgid"];
                DS_Org.SelectParameters[0].DefaultValue = orgid;
            }
            //else
            //{
            //    Guid org = new Guid("34DB231B-DC83-40FF-B455-7BA7BF25B725");
            //    DS_Org.SelectParameters[0].DefaultValue = "34DB231B-DC83-40FF-B455-7BA7BF25B725";
            //    //ystem.Guid.NewGuid().ToString();
            //}

           
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            DS_Org.UpdateParameters[0].DefaultValue = txbxOrgName.Text;
            DS_Org.UpdateParameters[1].DefaultValue = txbxUniqueNo.Text;
            DS_Org.UpdateParameters[2].DefaultValue = txbxEmail.Text;
            DS_Org.UpdateParameters[3].DefaultValue = txbxTel.Text;
            DS_Org.UpdateParameters[4].DefaultValue = txbxMobile.Text;
            DS_Org.UpdateParameters[5].DefaultValue = txbxFName.Text;
            DS_Org.UpdateParameters[6].DefaultValue = txbxLName.Text;
            DS_Org.UpdateParameters[7].DefaultValue = cmbxUserType.SelectedIndex.ToString();
            DS_Org.UpdateParameters[10].DefaultValue = txbxAdLn1.Text;
            DS_Org.UpdateParameters[11].DefaultValue = txbxAdLn2.Text;
            DS_Org.UpdateParameters[12].DefaultValue = txbxCity.Text;
            DS_Org.UpdateParameters[13].DefaultValue = txbxPostCode.Text;
            DS_Org.UpdateParameters[14].DefaultValue = orgid; // txbxOrgid.Text ;

            DS_Org.Update();
            EnabledControl(false);
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            EnabledControl(false);
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            EnabledControl(true);
        }

        private void EnabledControl(bool _option)
        {
            txbxOrgName.Enabled = _option;
            txbxUniqueNo.Enabled = _option;
            txbxEmail.Enabled = _option;
            txbxTel.Enabled = _option;
            txbxMobile.Enabled = _option;
            txbxFName.Enabled = _option;
            txbxLName.Enabled = _option;
            cmbxUserType.Enabled = _option;
            txbxAdLn1.Enabled = _option;
            txbxAdLn2.Enabled = _option;
            txbxCity.Enabled = _option;
            txbxPostCode.Enabled = _option;
            BtnCancel.Enabled = _option;
            BtnSave.Enabled = _option;
            autocomplete.Enabled = _option;
        }
    }
}