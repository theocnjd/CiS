using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiS
{
    public partial class UploadFiles : System.Web.UI.Page
    {
        readonly MethodCollections mthd = new MethodCollections();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnFileUpload_Click(object sender, EventArgs e)
        {
            if (UploadFile.HasFile)
            {

                Guid _key = new Guid(Application["orgkey"].ToString());
                if (Path.GetExtension(UploadFile.FileName).Equals(".xlsx"))
                {

                    var excel = new ExcelPackage(UploadFile.FileContent);
                    var dt = excel.ToDataTable();
                    var targettable = string.Empty;
                    switch (CmbBoxFileType.SelectedIndex)
                    {
                        case 1:
                            targettable = "tblBulkUploadManualDonations";
                            break;
                        case 2:
                            targettable = "tblBulkUploadDonors";
                            break;
                        default:
                            targettable = "tblUploadedBankStatements";
                            break;
                    }

                    // Delete old record before loading the new records.
                    mthd.DeleteUploadStagingTable(_key, targettable);

                    Configuration config = new Configuration();
                    using (var conn = new SqlConnection(config.GetCiSCS()))
                    {
                        var bulkCopy = new SqlBulkCopy(conn)
                        {
                            DestinationTableName = targettable,
                            BulkCopyTimeout = 1800
                        };

                        conn.Open();
                        try
                        {
                            var schema = conn.GetSchema("Columns", new[] { null, null, targettable, null });
                            foreach (DataColumn sourceColumn in dt.Columns)
                            {
                                foreach (DataRow row in schema.Rows)
                                {
                                    if (string.Equals(sourceColumn.ColumnName, (string)row["COLUMN_NAME"], StringComparison.OrdinalIgnoreCase))
                                    {
                                        bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, (string)row["COLUMN_NAME"]);
                                        break;
                                    }
                                }
                            }
                            bulkCopy.WriteToServer(dt);

                            //Add logon orgid key to the new loaded data.
                            mthd.UpdateUploadStagingTable(_key, targettable);

                            if (CmbBoxFileType.SelectedIndex == 0)
                            {
                                //Add logon orgid key to the new loaded data.
                                mthd.ProcessUploadedBankStatement(_key);
                            }
                        }
                        catch (Exception ex)
                        {

                            Response.Write(ex.Message);
                        }
                       
                    }
                }
            }
        }

        protected void GenInhouseTemplateBtn_Click(object sender, EventArgs e)
        {
            ExpInHseTemplate.WriteXlsxToResponse();
        }

        protected void GenStatementTemplateBtn_Click(object sender, EventArgs e)
        {
            ExpStmntTemplate.WriteXlsxToResponse();
        }
        protected void GenDonorListBtn_Click(object sender, EventArgs e)
        {
            ExpDnrList.WriteXlsxToResponse();
        }
    }
}