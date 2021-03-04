using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Globalization;
using System.Text.RegularExpressions;

namespace Dispensery
{
    public class HerbInStock
    {

        public int HerbStockID { get; set; }
        public string HerbRefNum { get; set; }
        public string BatchNum { get; set; }
        public decimal BuyPrice { get; set; }
        public decimal SellPrice { get; set; }
        public DateTime ExpiryDate { get; set; }
        public decimal Quantity { get; set; }
        public int SuplierID { get; set; }
        public decimal Ratio { get; set; }
        public DateTime Received { get; set; }
        public DateTime ToDispensery { get; set; }
        public string HerbForm { get; set; }
        public DateTime LastChanged { get; set; }
        public decimal HerbProcentage { get; set; }
        public string HerbName { get; set; }

        public HerbInStock()
        {

        }
        public HerbInStock(int HerbStockID)
        {
            string message;

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetHerbStockIdData", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@herbStockID", HerbStockID);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {
                        HerbRefNum = rdr["HerbRefNum"].ToString();
                        BatchNum = rdr["BatchNum"].ToString();
                        BuyPrice = Convert.ToDecimal(rdr["BuyPrice"].ToString());
                        SellPrice = Convert.ToDecimal(rdr["SellPrice"].ToString());
                        ExpiryDate = Convert.ToDateTime(rdr["ExpiryDate"].ToString());
                        Quantity = Convert.ToDecimal(rdr["Quantity"].ToString());
                        SuplierID = Convert.ToInt32(rdr["SupplierID"].ToString());
                        Ratio = Convert.ToDecimal(rdr["HerbRawToGranulRatio"].ToString());
                        Received = Convert.ToDateTime(rdr["DateReceived"].ToString());
                        ToDispensery = Convert.ToDateTime(rdr["DateToDispensery"].ToString());
                        HerbForm = rdr["HerbForm"].ToString();
                        LastChanged = Convert.ToDateTime(rdr["DateLastChanged"].ToString());

                       
                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }

        }

    }
}