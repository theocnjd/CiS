using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiS
{
    public class Configuration
    {
        public string GetCiSCS()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["CiSDB_CS"].ConnectionString;
            return connStr;
        }
    }
}