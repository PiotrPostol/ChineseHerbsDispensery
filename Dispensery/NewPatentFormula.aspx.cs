using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dispensery
{
    public partial class NewPatentFormula : System.Web.UI.Page
    {
        List<string> herbRefNum = new List<string>();
        List<decimal> herbQty = new List<decimal>();
        List<decimal> herbProcentage = new List<decimal>();
       
        List<HerbInStock> listHerbInSock = new List<HerbInStock>();
        protected void Page_Load(object sender, EventArgs e)
        {
            lables.Visible = false;
        }
//---------------------Button Click Add To Temp Table-------------------
        protected void btnCreatePatentFormula_Click(object sender, EventArgs e)
        {
            DateTime today = DateTime.Now;
            string dayOfYear = today.DayOfYear.ToString();
            int yearInt = today.Year % 100;
            string year = yearInt.ToString();
            Label lblMasterStatus = (Label)Master.FindControl("lblPractitionerName");
            string PFname = ddlPatentFormula.SelectedItem.ToString();
            int Bquantity = Convert.ToInt32(tbxQuantity.Text.ToString());

            string PFrefNum = ExtractInitialsFromName(PFname) + dayOfYear + year + DateTime.Now.ToString("HHmmss") + "/" + Bquantity;

            //-----------Get PF all herb ref Num and write to herbRefNum list and herbqty list--------------------
            GetPTherbsRefNum(PFname,Bquantity);

            //----------------- Check each herbRefNum and herbQty if in stock--------------------------
            for(int i=0; i<herbRefNum.Count; i++)
            {
                if(CheckStock(herbRefNum[i], herbQty[i]) == 0)
                {
                    break;
                }
                CheckBatch(herbRefNum[i], herbQty[i], herbProcentage[i]);
            }
            //-------------------insert data to temp table-----------------------------
            foreach( HerbInStock item in listHerbInSock)
            {
                InsertDataToTemp(PFname, PFrefNum, Bquantity, item.HerbRefNum, item.BatchNum, item.Quantity, item.HerbProcentage);
            }
            if(lblPFrefNum.Text !=null || lblBottleQty.Text != null)
            {
                lables.Visible = true;
                lblPFrefNum.Text = PFrefNum.ToString();
                lblBottleQty.Text = Bquantity.ToString();
                GridView1.DataBind();
            }



        }

        protected void CheckBatch(string herbRefNum, decimal totalHerbQuantity, decimal herbProcentage)
        {
            List<int> herbsInStockIDs = new List<int>();
            List<decimal> herbInStockQuantity = new List<decimal>();
            List<string> herbInStockBatchNum = new List<string>();
            
  
           

            string message;

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spAllStocksIDOfHerb", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@herbRefNum", herbRefNum);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {
                        herbsInStockIDs.Add(Convert.ToInt32(rdr["HerbStockID"].ToString()));
                        herbInStockQuantity.Add(Convert.ToDecimal(rdr["Quantity"].ToString()));
                        herbInStockBatchNum.Add(rdr["BatchNum"].ToString());
                      


                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    divAlertWarning.Visible = true;
                    lblAlertWarning.Text = message;
                    message = "";
                }
                finally
                {
                    con.Close();
                }
            }

            HerbInStock resultHerbInStock;

            for (int i = 0; i < herbsInStockIDs.Count; i++)
            {


                if (herbInStockQuantity[i] >= totalHerbQuantity)
                {

                    resultHerbInStock = new HerbInStock();
                    resultHerbInStock.HerbStockID = herbsInStockIDs[i];
                    resultHerbInStock.BatchNum = herbInStockBatchNum[i];
                    resultHerbInStock.Quantity = totalHerbQuantity;
                    resultHerbInStock.HerbRefNum = herbRefNum;
                    resultHerbInStock.HerbProcentage = herbProcentage;

                    listHerbInSock.Add(resultHerbInStock);
                    break;
                }
                else
                {

                    resultHerbInStock = new HerbInStock();
                    resultHerbInStock.HerbStockID = herbsInStockIDs[i];
                    resultHerbInStock.BatchNum = herbInStockBatchNum[i];
                    resultHerbInStock.Quantity = herbInStockQuantity[i];
                    resultHerbInStock.HerbRefNum = herbRefNum;
                    resultHerbInStock.HerbProcentage = herbProcentage;
                    listHerbInSock.Add(resultHerbInStock);
                    totalHerbQuantity -= herbInStockQuantity[i];

                }


            }

        }

        //-----------Get PF all herb ref Num and write to herbRefNum list and herbqty list--------------------
        protected void GetPTherbsRefNum(string PFname, decimal Bquantity)
        {
            string message;

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetDataOfPF", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@PFname", PFname);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {
                        herbRefNum.Add(rdr["HerbRefNum"].ToString());
                        herbQty.Add(Convert.ToDecimal(rdr["DosageGrams"].ToString()));
                        herbProcentage.Add(Convert.ToDecimal(rdr["DosageProcentage"].ToString()));
                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    divAlertWarning.Visible = true;
                    divAlertWarning.Focus();
                    lblAlertWarning.Text = message;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }



        }


        //-----------------Insert Data To Temp Table----------------------
        protected void InsertDataToTemp(string patentFormulaName, string PFrefNum, int bottleQuantity, string herbRefNum, string herbBatchNum, decimal herbQty, decimal herbProcentage )
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spInsertPatentFormulaToTemp", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@patentFormulaName", patentFormulaName);
                command.Parameters.AddWithValue("@PFrefNum", PFrefNum);
                command.Parameters.AddWithValue("@bottleQuantity", bottleQuantity);
                command.Parameters.AddWithValue("@herbRefNum", herbRefNum);
                command.Parameters.AddWithValue("@herbBatchNum", herbBatchNum);
                command.Parameters.AddWithValue("@dosageGrams", herbQty);
                command.Parameters.AddWithValue("@herbProcentage", herbProcentage);


                con.Open();
                try
                {
                    command.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    divAlertWarning.Visible = true;
                    divAlertWarning.Focus();
                    lblAlertWarning.Text = message;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }


        }

//--------------------Check stock---------------------------
        protected int CheckStock(string herbRefNum, decimal herbQuantity)
        {
            decimal totalHerbStock;
            int result = 0;
            string message;
            decimal dosageQuantity;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("stp_CheckHerbStock", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@herbRefNum", herbRefNum);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {
                        if (!Convert.IsDBNull(rdr["TotalQuantity"]) || rdr["TotalQuantity"].ToString() != null)
                        {
                            totalHerbStock = Convert.ToDecimal(rdr["TotalQuantity"].ToString());
                             dosageQuantity = herbQuantity;

                            if (totalHerbStock < dosageQuantity)
                            {
                                lblalertLowStock.Text = String.Format("Quantity of {0} in stock: {1}g", herbRefNum, totalHerbStock);
                                lblHerbQuantityToOrder.Text = String.Format("Missing quantity: {0}g, herb refrence number: {1}", dosageQuantity - totalHerbStock, herbRefNum);
                                stockAlert.Visible = true;
                                stockAlert.Focus();
                                result = 0;
                            }
                            else
                            {
                                result = 1;
                            }
                        }
                        else
                        {
                            totalHerbStock = 0;
                            dosageQuantity = (herbQuantity );

                            if (totalHerbStock < dosageQuantity)
                            {
                                lblalertLowStock.Text = String.Format("Quantity of {0} in stock: {1}g", herbRefNum, totalHerbStock);
                                lblHerbQuantityToOrder.Text = String.Format("Missing quantity: {0}g, herb refrence number: {1}", dosageQuantity - totalHerbStock, herbRefNum);
                                stockAlert.Visible = true;
                                stockAlert.Focus();
                                result = 0;
                            }
                            else
                            {
                                result = 1;
                            }
                        }

                      

                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    divAlertWarning.Visible = true;
                    divAlertWarning.Focus();
                    lblAlertWarning.Text = message;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }

            return result;
        }
     
//----------------extract Initials--------------------
        public static string ExtractInitialsFromName(string name)
        {
            // first remove all: punctuation, separator chars, control chars, and numbers (unicode style regexes)
            string initials = Regex.Replace(name, @"[\p{P}\p{S}\p{C}\p{N}]+", "");

            // Replacing all possible whitespace/separator characters (unicode style), with a single, regular ascii space.
            initials = Regex.Replace(initials, @"\p{Z}+", " ");

            // Remove all Sr, Jr, I, II, III, IV, V, VI, VII, VIII, IX at the end of names
            initials = Regex.Replace(initials.Trim(), @"\s+(?:[JS]R|I{1,3}|I[VX]|VI{0,3})$", "", RegexOptions.IgnoreCase);

            // Extract up to 2 initials from the remaining cleaned name.
            initials = Regex.Replace(initials, @"^(\p{L})[^\s]*(?:\s+(?:\p{L}+\s+(?=\p{L}))?(?:(\p{L})\p{L}*)?)?$", "$1$2").Trim();

            if (initials.Length > 2)
            {
                // Worst case scenario, everything failed, just grab the first two letters of what we have left.
                initials = initials.Substring(0, 2);
            }

            return initials.ToUpperInvariant();
        }

    }
}