using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace CiS.Account
{
    public partial class ManagePassword : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    changePasswordHolder.Visible = true;
                }
                else
                {
                    setPassword.Visible = true;
                    changePasswordHolder.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");
                }
            }

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

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
                if (result.Succeeded)
                {
                    var user = manager.FindById(User.Identity.GetUserId());
                    signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                    Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        protected void SetPassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Create the local login info and link the local account to the user
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                IdentityResult result = manager.AddPassword(User.Identity.GetUserId(), password.Text);
                if (result.Succeeded)
                {
                    Response.Redirect("~/Account/Manage?m=SetPwdSuccess");
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }
    }
}