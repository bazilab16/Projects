using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IbuCollection.BLL.Helpers
{
    public class ExcelToSqlExporter
    {
        private readonly string SqlConnectionString = "";

        public void ExportExcelToSql()
        {

            //try
            //{
            //    var excel = new ExcelPackage(Upload.FileContent);
            //    var dt = excel.ToDataTable();
            //    var table = "Contacts";
            //    using (var conn = new SqlConnection("Server=.;Database=Test;Integrated Security=SSPI"))
            //    {
            //        var bulkCopy = new SqlBulkCopy(conn);
            //        bulkCopy.DestinationTableName = table;
            //        conn.Open();
            //        var schema = conn.GetSchema("Columns", new[] { null, null, table, null });
            //        foreach (DataColumn sourceColumn in dt.Columns)
            //        {
            //            foreach (DataRow row in schema.Rows)
            //            {
            //                if (string.Equals(sourceColumn.ColumnName, (string)row["COLUMN_NAME"], StringComparison.OrdinalIgnoreCase))
            //                {
            //                    bulkCopy.ColumnMappings.Add(sourceColumn.ColumnName, (string)row["COLUMN_NAME"]);
            //                    break;
            //                }
            //            }
            //        }
            //        bulkCopy.WriteToServer(dt);
            //    }
            //}
            //catch (Exception ex)
            //{

            //    throw ex;
            //}
        }
    }
}