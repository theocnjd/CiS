using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Configuration;



namespace CiS
{
    public class MethodCollections
    {
        // Get the connection string to the db.
        readonly string cis_connStr = new Configuration().GetCiSCS();
        string sqlcode;
        // update db with user type id of the current user 
        public void UpdateUser(int usertype, string email)
        {
            string updatecode = "UPDATE AspNetUsers SET UserType = " + usertype + " WHERE Email = '" + email + "'";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(updatecode, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        // Retrieve user type id of the current user 
        public Int32 GetUserType(string email)
        {
            Int32 returnValue;
            sqlcode = "SELECT UserType FROM AspNetUsers WHERE Email = '" + email + "'";         
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = Convert.ToInt32(cmd.ExecuteScalar());
                cn.Close();
            }
            return returnValue;
        }

        // Retrieve user type id of the current user 
        public string GetAdminEmail()
        {
            string returnValue;
            sqlcode = "SELECT TOP(1) 'testingapp@nikdamconsulting.co.uk' FROM AspNetUsers";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public string GetLogonEmail(string name)
        {
            string returnValue;
            sqlcode = "SELECT Email FROM AspNetUsers WHERE UserName = '" + name + "'";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public string GetLogonOrgKey(string email)
        {
            string returnValue;
            sqlcode = "SELECT Orgid FROM tcOrganisation WHERE Email = '" + email + "'";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public string GetOrgName(string email)
        {
            string returnValue;
            sqlcode = "SELECT ISNULL(NULLIF(OrgName,' '), 'Ultimate System') as OrgName FROM tcOrganisation WHERE Email = '" + email + "'";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public string GetLogOnIdentity(string email)
        {
            string returnValue;
            sqlcode = "SELECT OrgIdentity FROM tcOrganisation WHERE Email = '" + email + "'";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand(sqlcode, cn);
                cn.Open();
                returnValue = cmd.ExecuteScalar().ToString();
                cn.Close();
            }
            return returnValue;
        }

        public void CreateBaseOrgDetails(string email)
        {
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {

                SqlCommand cmd = new SqlCommand("uspInsertBaseOrganisation", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Email", email);

                cmd.CommandTimeout = 60;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        public void DeleteUploadStagingTable(Guid identifier, string tblname)
        {
            sqlcode = "DELETE " + tblname + " WHERE Orgid = '" + identifier + "' AND CreatedDate < convert(date, getdate())";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {

                SqlCommand cmd = new SqlCommand(sqlcode, cn)
                {
                    CommandTimeout = 120
                };
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        public void UpdateUploadStagingTable(Guid identifier, string tblname)
        {
            sqlcode = "UPDATE " + tblname + " SET Orgid = '" + identifier + "' WHERE Orgid IS NULL";
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {

                SqlCommand cmd = new SqlCommand(sqlcode, cn)
                {
                    CommandTimeout = 60
                };
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }

        public DataTable GetActiveMembers (Int32 orgIdentity)
        {

            DataTable dt = new DataTable();
            
            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetActiveMembers", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
               
                cmd.CommandTimeout = 360;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }

            return dt;
        }
        public string GetActMembers(Int32 orgIdentity)
        {
            string dt = string.Empty;

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetActiveMembers", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);

                cn.Open();
                cmd.CommandTimeout = 360;
                
                dt = cmd.ExecuteScalar().ToString();
                cn.Close();
            }

            return dt;
        }
        public string GetAnonymousDonor(Int32 orgIdentity, string transDate)
        {
            string dt = string.Empty;

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetAnonymousDonorByDate", cn)
                {
                    CommandType = CommandType.StoredProcedure,
                   
                };
               
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
                cmd.Parameters.AddWithValue("@transDate", transDate);

                cn.Open();
                cmd.CommandTimeout = 360;

                dt = cmd.ExecuteScalar().ToString();
                cn.Close();
            }

            return dt;
        }

         public string GetTotalDonationByMonth(Int32 orgIdentity, string transDate)
        {
            string dt = string.Empty;

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetTotalDonationByMonth", cn)
                {
                    CommandType = CommandType.StoredProcedure,
                   
                };
               
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
                cmd.Parameters.AddWithValue("@transDate", transDate);

                cn.Open();
                cmd.CommandTimeout = 360;

                dt = cmd.ExecuteScalar().ToString();
                cn.Close();
            }

            return dt;
        }

        public DataTable GetDonationByPaymentType(Int32 orgIdentity, string transDate)
        {

            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetDonationByPaymentType", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
                cmd.Parameters.AddWithValue("@transDate", transDate);

                cmd.CommandTimeout = 360;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }

            return dt;
        }
        public DataTable GetAnonymousDonorByDate(Int32 orgIdentity, string transDate)
        {

            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetAnonymousDonorByDate", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
                cmd.Parameters.AddWithValue("@transDate", transDate);

                cmd.CommandTimeout = 360;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }

            return dt;
        }
        public DataTable GetDonationCategoryByYear(Int32 orgIdentity, string transDate)
        {

            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(cis_connStr))
            {
                SqlCommand cmd = new SqlCommand("rptGetDonationCategoryByYear", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgIdentity", orgIdentity);
                cmd.Parameters.AddWithValue("@transDate", transDate);

                cmd.CommandTimeout = 360;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }

            return dt;
        }

        //public void CreateClient(string email)
        //{
        //    using (SqlConnection cn = new SqlConnection(cis_connStr))
        //    {

        //        SqlCommand cmd = new SqlCommand("usp_InsertClient", cn)
        //        {
        //            CommandType = CommandType.StoredProcedure
        //        };
        //        //cmd.Parameters.AddWithValue("@ClientTypeid", clienttype);
        //        //cmd.Parameters.AddWithValue("@FirstName", fname);
        //        //cmd.Parameters.AddWithValue("@LastName", lname);
        //        cmd.Parameters.AddWithValue("@Email", email);
        //        cmd.CommandTimeout = 60;
        //        cn.Open();
        //        cmd.ExecuteNonQuery();
        //        cn.Close();
        //    }
        //}


        //public DataTable GetClientByEmail(string email)
        //{
        //    DataTable tblClient = new DataTable();
        //    using (SqlConnection cn = new SqlConnection(cis_connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand("usp_GetClient", cn)
        //        {
        //            CommandType = CommandType.StoredProcedure
        //        };
        //        cmd.Parameters.AddWithValue("@Email", email);
        //        cn.Open();
        //        using (var reader = cmd.ExecuteReader())
        //        {
        //            tblClient.Columns.Add("Clientid");
        //            tblClient.Columns.Add("ClientTypeid");
        //            tblClient.Columns.Add("Title");
        //            tblClient.Columns.Add("FirstName");
        //            tblClient.Columns.Add("LastName");
        //            tblClient.Columns.Add("Gender");
        //            tblClient.Columns.Add("Telephone");
        //            tblClient.Columns.Add("Email");
        //            tblClient.Load(reader);
        //        };

        //        cn.Close();
        //    }    
        //    return tblClient;
        //}

        //public DataTable GetAddress()
        //{
        //    DataTable dataTable = new DataTable();
        //    string getadd = "SELECT Addressid, Postcode FROM [tcAddress] WHERE (NULLIF(Latitude,' ') IS NULL OR NULLIF(Longitude, ' ') IS NULL)";
        //    using (SqlConnection cn = new SqlConnection(cis_connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand(getadd, cn);
        //        cn.Open();
        //        var returnValue = cmd.ExecuteReader();

        //        dataTable.Load(returnValue);
        //        cn.Close();
        //    }
        //    return dataTable;
        //}

        //public void UpdateAddressLatAndLon(string addressid, string lat, string log)
        //{
        //    string editadd = "UPDATE [tcAddress] SET Latitude = '" + lat + "', Longitude = '" + log + "' WHERE Addressid = " + addressid;
        //    using (SqlConnection cn = new SqlConnection(cis_connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand(editadd, cn);
        //        cn.Open();
        //        cmd.ExecuteNonQuery();
        //        cn.Close();

        //    }
        //}

        //public string GetGeoCode(string postcode)
        //{
        //    string uri = "https://geocode.maps.co/search?q=" + postcode; // $"https://geocode.maps.co/search?q={postcode}";
        //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);

        //    using (WebResponse response = (HttpWebResponse)request.GetResponse())

        //    {
        //        using (StreamReader reader = new StreamReader(response.GetResponseStream()))

        //        {
        //            return reader.ReadToEnd();
        //        }
        //    }

        //}

        ////public async Task<IEnumerable<AlertInfo>> GetAlertInfos()
        ////{
        ////    IEnumerable<AlertInfo> listAlertInfos;
        ////    using (SqlConnection cn = new SqlConnection(n2u_connStr))
        ////    {

        ////        cn.Open();
        ////        listAlertInfos = cn.Query<AlertInfo>("usp_GetAlertInfo", commandType: CommandType.StoredProcedure);
        ////    }
        ////    return listAlertInfos;
        ////}

        //// get total alert based on supplied email.
        //public Int32 GetAlertCount(string email)
        //{
        //    Int32 totalcount;
        //    using (SqlConnection cn = new SqlConnection(cis_connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand("usp_GetAlertInfo", cn)
        //        {
        //            CommandType = CommandType.StoredProcedure
        //        };
        //        cmd.Parameters.AddWithValue("@Email", email);
        //        cmd.CommandTimeout = 60;
        //        cn.Open();
        //        totalcount = Convert.ToInt32(cmd.ExecuteScalar());
        //    }
        //    return totalcount;
        //}
    }
}