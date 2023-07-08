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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && UploadFile.HasFile)
            {
                if (Path.GetExtension(UploadFile.FileName).Equals(".xlsx"))
                {
                    var excel = new ExcelPackage(UploadFile.FileContent);
                    var dt = excel.ToDataTable();
                    var targettable = "tblUploadedStatements";

                    Configuration config = new Configuration();
                    using (var conn = new SqlConnection(config.GetCiSCS()))
                    {
                        var bulkCopy = new SqlBulkCopy(conn)
                        {
                            DestinationTableName = targettable
                        };

                        conn.Open();
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
                    }
                }
            }
        }
    }
}