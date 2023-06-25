using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CiS.Startup))]
namespace CiS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
