using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class MemberDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orgid;
            MethodCollections mthd = new MethodCollections();
            if (Request.QueryString.HasKeys())
            {
                orgid = Request.QueryString["orgkey"];
                DS_Member.SelectParameters[0].DefaultValue = orgid;
                GdvwMember.DataBind();
            }

            if (!IsPostBack)
            {
                Application["orgkey"] = mthd.GetLogonOrgKey(Context.User.Identity.Name);
                DS_Member.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                GdvwMember.DataBind();
  
            }
            else
            {
                DS_Member.SelectParameters[0].DefaultValue = Application["orgkey"].ToString();
                GdvwMember.DataBind();
            }

        }

        protected void GDvwMember_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DS_Member.InsertParameters[13].DefaultValue = Application["orgkey"].ToString();
        }
    }
}