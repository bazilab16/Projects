using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IbuCollection.Controllers
{
    public class HomeController : Controller
    {
        private readonly IbuCollection.Data.IbuCollectionDbContext ibuCollectionDbContext = new Data.IbuCollectionDbContext();

        public ActionResult Index()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase postedFile)
        {
            string filePath = string.Empty;
            if (postedFile != null)
            {
                string path = Server.MapPath(@"~\Content\sheets");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                filePath = path + Path.GetFileName(postedFile.FileName);
                string extension = Path.GetExtension(postedFile.FileName);
                postedFile.SaveAs(filePath);

                string conString = string.Empty;
                //switch (extension)
                //{
                //    case ".xls": //Excel 97-03.
                //        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                //        break;
                //    case ".xlsx": //Excel 07 and above.
                //        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                //        break;
                //}

                FileInfo excel = new FileInfo(filePath);
                using (var package = new ExcelPackage(excel))
                {
                    var workbook = package.Workbook;

                    //*** Sheet 1
                    var worksheet = workbook.Worksheets.First();

                    string strConnString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=IbuCollection;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    var objConn = new SqlConnection(strConnString);
                    objConn.Open();

                    //*** Loop to Insert
                    int totalRows = worksheet.Dimension.End.Row;
                    for (int i = 2; i <= totalRows; i++)
                    {
                        string strSQL = "INSERT INTO [dbo].[User] (Id,UserName,Email,Password,MobileNumber) "
                            + " VALUES  ("
                            + " '" + worksheet.Cells[i, 1].Text.ToString() + "', "
                            + " '" + worksheet.Cells[i, 2].Text.ToString() + "', "
                            + " '" + worksheet.Cells[i, 3].Text.ToString() + "', "
                            + " '" + worksheet.Cells[i, 4].Text.ToString() + "', "
                            + " '" + worksheet.Cells[i, 5].Text.ToString() + "' "
                            + ")";
                        var objCmd = new SqlCommand(strSQL, objConn);
                        objCmd.ExecuteNonQuery();
                    }

                    objConn.Close();
                }
            }


            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            //D:\Projects\Git\Templates\AspNet\MVC\IbuCollection\IbuCollection\Content\sheets\ExcelUserData.xlsx
            FileInfo excel = new FileInfo(Server.MapPath(@"~\Content\sheets\ExcelUserData.xlsx"));
            using (var package = new ExcelPackage(excel))
            {
                var workbook = package.Workbook;

                //*** Sheet 1
                var worksheet = workbook.Worksheets.First();

                string strConnString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=IbuCollection;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                var objConn = new SqlConnection(strConnString);
                objConn.Open();

                //*** Loop to Insert
                int totalRows = worksheet.Dimension.End.Row;
                for (int i = 2; i <= totalRows; i++)
                {
                    string strSQL = "INSERT INTO [dbo].[User] (Id,UserName,Email,Password,MobileNumber) "
                        + " VALUES  ("
                        + " '" + worksheet.Cells[i, 1].Text.ToString() + "', "
                        + " '" + worksheet.Cells[i, 2].Text.ToString() + "', "
                        + " '" + worksheet.Cells[i, 3].Text.ToString() + "', "
                        + " '" + worksheet.Cells[i, 4].Text.ToString() + "', "
                        + " '" + worksheet.Cells[i, 5].Text.ToString() + "' "
                        + ")";
                    var objCmd = new SqlCommand(strSQL, objConn);
                    objCmd.ExecuteNonQuery();
                }

                objConn.Close();
            }
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}