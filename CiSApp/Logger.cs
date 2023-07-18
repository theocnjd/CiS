using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace CiS
{
    public class Logger
    {
        public static void Log(Exception exception, string adminEmail)
        {
            StringBuilder sbExceptionMessage = new StringBuilder();
            do
            {
                sbExceptionMessage.Append("Exception" + Environment.NewLine);
                sbExceptionMessage.Append(exception.GetType().Name);
                sbExceptionMessage.Append(Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Message" + Environment.NewLine);
                sbExceptionMessage.Append(exception.Message + Environment.NewLine + Environment.NewLine);
                sbExceptionMessage.Append("Stark Trace" + Environment.NewLine);
                sbExceptionMessage.Append(exception.StackTrace + Environment.NewLine + Environment.NewLine);

                exception = exception.InnerException;
            }
            while (exception != null);

            if (sbExceptionMessage != null)
            {
                string subject = "New CiS Exception";
                LogErrorToSQLServer(sbExceptionMessage.ToString());
                SendEmail(sbExceptionMessage.ToString(), subject, adminEmail);
            }

        }
        // log error to databse
        public static void LogErrorToSQLServer(string ErrorMsg)
        {
            
            Configuration ncn = new Configuration();
            string _ConnStr = ncn.GetCiSCS();

            using (SqlConnection cn = new SqlConnection(_ConnStr))
            {
                SqlCommand cmd = new SqlCommand("uspInsertErrorDetails", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PackageName", "ASPNET");
                cmd.Parameters.AddWithValue("@ProjectName", "CiS");
                cmd.Parameters.AddWithValue("@ErrorMsg", ErrorMsg);
                cmd.CommandTimeout = 360;

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // send email based on the supplied parameters
        public static void SendEmail(string emailMsg, string mailsubject, string emailto)
        {
            MailMessage mailMsg = new MailMessage("testingapp@nikdamconsulting.co.uk", emailto)
            {
                Subject = mailsubject,
                Body = emailMsg,
                IsBodyHtml = true,

            };

            // use this when smtpclient details have been configured in the config file.
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send(mailMsg);

        }
    }
}