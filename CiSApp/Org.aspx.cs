﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class Org : System.Web.UI.Page
    {
        string orgid;
        readonly MethodCollections mthd = new MethodCollections();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.HasKeys())
            {
                orgid = Request.QueryString["orgkey"];
                DS_Org.SelectParameters[0].DefaultValue = orgid;
               
                FLOrg.DataBind();
              
            }

            if (!IsPostBack)
            {
                Application["orgkey"] = mthd.GetLogonOrgKey(Context.User.Identity.Name);
                //Guid org = new Guid("34DB231B-DC83-40FF-B455-7BA7BF25B725");
                DS_Org.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
               
                FLOrg.DataBind();
                FLOrg.Visible = true;
            }
            else
            {
                //string _orgid = Application["orgkey"].ToString();
                DS_Org.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
               
                FLOrg.DataBind();
                FLOrg.Visible = true;
            }
        }

        protected void BtnShowEdit_Click(object sender, EventArgs e)
        {
            txbxOrgName.Text = ((Label)FLOrg.FindControl("OrgNameLabel")).Text;
            txbxUniqueNo.Text = ((Label)FLOrg.FindControl("OrgUniqueNoLabel")).Text;
            txbxOrgAbbName.Text = ((Label)FLOrg.FindControl("OrgAbbNameLabel")).Text;
            txbxEmail.Text = ((Label)FLOrg.FindControl("EmailLabel")).Text;
            txbxTel.Text = ((Label)FLOrg.FindControl("TelephoneLabel")).Text;
            txbxMobile.Text = ((Label)FLOrg.FindControl("MobileLabel")).Text;
            txbxFName.Text = ((Label)FLOrg.FindControl("FnameLabel")).Text;
            txbxLName.Text = ((Label)FLOrg.FindControl("LnameLabel")).Text;
            txbxAdLn1.Text = ((Label)FLOrg.FindControl("AddressLine1Label")).Text;
            txbxAdLn2.Text = ((Label)FLOrg.FindControl("AddressLine2Label")).Text;
            txbxCity.Text = ((Label)FLOrg.FindControl("CityLabel")).Text;
            txbxPostCode.Text = ((Label)FLOrg.FindControl("PostCodeLabel")).Text;

            string usertype = ((Label)FLOrg.FindControl("UserTypeidLabel")).Text;

            if (usertype == "1")
            {
                cmbxUserType.SelectedValue = "1";
            }
            if (usertype == "2")
            {
                cmbxUserType.SelectedValue = "2";
            }

            // show edit container.
            dvEdit.Visible = true;
            FLOrg.Visible = false;
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            string orgid = ((Label)FLOrg.FindControl("OrgidLabel")).Text;
            string userid = ((Label)FLOrg.FindControl("useridLabel")).Text;
            string addressid = ((Label)FLOrg.FindControl("AddressidLabel")).Text;

            DS_Org.UpdateParameters[0].DefaultValue = txbxOrgName.Text;
            DS_Org.UpdateParameters[1].DefaultValue = txbxUniqueNo.Text;
            DS_Org.UpdateParameters[2].DefaultValue = txbxEmail.Text;
            DS_Org.UpdateParameters[3].DefaultValue = txbxTel.Text;
            DS_Org.UpdateParameters[4].DefaultValue = txbxMobile.Text;
            DS_Org.UpdateParameters[5].DefaultValue = txbxFName.Text;
            DS_Org.UpdateParameters[6].DefaultValue = txbxLName.Text;
            DS_Org.UpdateParameters[7].DefaultValue = cmbxUserType.SelectedValue.ToString();
            DS_Org.UpdateParameters[8].DefaultValue = userid;
            DS_Org.UpdateParameters[9].DefaultValue = addressid;
            DS_Org.UpdateParameters[10].DefaultValue = txbxAdLn1.Text;
            DS_Org.UpdateParameters[11].DefaultValue = txbxAdLn2.Text;
            DS_Org.UpdateParameters[12].DefaultValue = txbxCity.Text;
            DS_Org.UpdateParameters[13].DefaultValue = txbxPostCode.Text;
            DS_Org.UpdateParameters[14].DefaultValue = txbxOrgAbbName.Text;
            DS_Org.UpdateParameters[15].DefaultValue = orgid;

            // Call update method to update org details in the database
            DS_Org.Update();

            // hide edit container.
            dvEdit.Visible = false;

            // Rebind data to the form
            FLOrg.DataBind();

            // show org profile form.
            FLOrg.Visible = true;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            // hide edit container.
            dvEdit.Visible = false;

            // Rebind data to the form
            FLOrg.DataBind();

            // show org profile form.
            FLOrg.Visible = true;
        }
    }
}