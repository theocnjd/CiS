using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class _Default : Page
    {
        string orgid;
        MethodCollections mthd = new MethodCollections();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.HasKeys())
            {
                orgid = Request.QueryString["orgid"];
                DS_Org.SelectParameters[0].DefaultValue = orgid;
                DS_User.SelectParameters[0].DefaultValue = orgid;
                FLOrg.DataBind();
                GdvwUser.DataBind();
            }

            if (!IsPostBack)
            {
                Application["orgkey"] = mthd.GetLogonOrgKey(Context.User.Identity.Name);
                //Guid org = new Guid("34DB231B-DC83-40FF-B455-7BA7BF25B725");
                DS_Org.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                DS_User.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                FLOrg.DataBind();
                GdvwUser.DataBind();
            }
            else
            {
                //string _orgid = Application["orgkey"].ToString();
                DS_Org.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                DS_User.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                FLOrg.DataBind();
                GdvwUser.DataBind();
            }

            //lblTest.Text =  Application["orgkey"].ToString();

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            Response.Write(txbxLName.Text);

            byte usertypeid = (byte)(cmbxUserType.SelectedIndex);

            DS_Org.UpdateParameters[0].DefaultValue = txbxOrgName.Text;
            DS_Org.UpdateParameters[1].DefaultValue = txbxUniqueNo.Text;
            DS_Org.UpdateParameters[2].DefaultValue = txbxEmail.Text;
            DS_Org.UpdateParameters[3].DefaultValue = txbxTel.Text;
            DS_Org.UpdateParameters[4].DefaultValue = txbxMobile.Text;
            DS_Org.UpdateParameters[5].DefaultValue = txbxFName.Text;
            DS_Org.UpdateParameters[6].DefaultValue = txbxLName.Text;
            DS_Org.UpdateParameters[7].DefaultValue = usertypeid.ToString();
            DS_Org.UpdateParameters[8].DefaultValue = Convert.ToInt32(seUser.Value) > 0 ? seUser.Value.ToString() : "0";
            DS_Org.UpdateParameters[9].DefaultValue = Convert.ToInt32(seAddid.Value) > 0 ? seAddid.Value.ToString() : "0";

            DS_Org.UpdateParameters[10].DefaultValue = txbxAdLn1.Text;
            DS_Org.UpdateParameters[11].DefaultValue = txbxAdLn2.Text;
            DS_Org.UpdateParameters[12].DefaultValue = txbxCity.Text;
            DS_Org.UpdateParameters[13].DefaultValue = txbxPostCode.Text;
            DS_Org.UpdateParameters["Orgid"].DefaultValue = txbxOrgid.Text;

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
            //txbxEmail.Enabled = _option;
            txbxTel.Enabled = _option;
            txbxMobile.Enabled = _option;
            txbxFName.Enabled = _option;
            txbxLName.Enabled = _option;
            cmbxUserType.Enabled = _option;
            txbxAdLn1.Enabled = _option;
            txbxAdLn2.Enabled = _option;
            txbxCity.Enabled = _option;
            txbxPostCode.Enabled = _option;
            txbxAddsearch.Enabled = _option;
            BtnCancel.Enabled = _option;
            BtnSave.Enabled = _option;
            BtnCancel.ClientVisible = _option;
            BtnSave.ClientVisible = _option;
            BtnEdit.ClientVisible = !_option;
            txbxAddsearch.Enabled = _option;
        }

        protected void GdvwUser_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DS_User.InsertParameters[1].DefaultValue = Application["orgkey"].ToString();
        }

    
    }
}