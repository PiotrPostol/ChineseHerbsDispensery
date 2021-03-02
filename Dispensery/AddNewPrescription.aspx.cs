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
    public partial class AddNewPrescription : System.Web.UI.Page
    {
        string refNum;
        string herbName;
        decimal herbQuantity;
        int herbNo = 0;
        decimal totalFormulaPrice;
        decimal postageCost;
        decimal phenixTotal;
        decimal balanceTotal;
        decimal granulesWeight;
        decimal priceSubtotal;
        string formulaRefNum;
        int numOfDosageDays;
        int practitionerID;
        int patientID;
        decimal administrationCost;
        int admPerTimePeriod;
        decimal totalGranulesQuantity;
        decimal totalCost;
        decimal totalCostPlusPostage;
        decimal discount;
        decimal totalPrescriptionCost;
        decimal dosageQuantity;
      
        List<HerbInStock> listHerbInSock = new List<HerbInStock>();


        //DataTable herbDT;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            // ---------ViewState to record values of patient, formula name and number of days ------
           
            ViewState["PatientID"] = ddlPatient.SelectedValue;
            ViewState["FormulaName"] = tbxFormulaName.Text;
            ViewState["NumOfDays"] = tbxNumDays.Text;
            ViewState["Patient"] = ddlPatient.SelectedItem.Text;
            if (IsPostBack)
            {
               
                if (!(String.IsNullOrEmpty(ddlPatient.Text.Trim())))
                {
                    lblPatient.Text = ViewState["Patient"].ToString();
                    if(ddlPatient.SelectedValue != "0.1")
                    {
                        patientID = Convert.ToInt16(ViewState["PatientID"].ToString());
                    }
                   
                    ddlPatient.Visible = false;
                    btnAddNewPatient.Visible = false;
                    lblPatient.Visible = true;
                    divPatient.Visible = true;
                    //or txtConfirmPwd.Attributes.Add("value", txtConfirmPwd.Text);
                }
                if (!(String.IsNullOrEmpty(ViewState["FormulaName"].ToString())))
                {
                    string formulaName = ViewState["FormulaName"].ToString();
                    //tbxFormulaName.Text = formulaName;
                    tbxFormulaName.Visible = false;
                    lblFormulaName.Text = formulaName;
                    lblFormulaName.Visible = true;
                    divFormulaName.Visible = true;
                    //or txtPwd.Attributes.Add("value",txtPwd.Text);
                }
                if (!(String.IsNullOrEmpty(ViewState["NumOfDays"].ToString())))
                {
                    lblNumDays.Text = ViewState["NumOfDays"].ToString();
                    lblNumDays.Visible = true;
                    tbxNumDays.Visible = false;
                    divNumDays.Visible = true;
                    //or txtConfirmPwd.Attributes.Add("value", txtConfirmPwd.Text);
                }
                GetTotals();
            }

            CultureInfo FrCulture = new CultureInfo("fr-FR");
            if (!IsPostBack)
            {
                divPatient.Visible = false;
                divNumDays.Visible = false;
                divFormulaName.Visible = false;
                ClearPrescriptionTempTable();
                GetTotals();
                grvShort.DataBind();
               grvShort.UseAccessibleHeader = true;
                int rowCount = grvShort.Rows.Count;
                if (rowCount != 0)
                {
                    grvShort.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                //DataTable herbDT = new DataTable();
                //herbDT.Columns.AddRange(new DataColumn[4] { new DataColumn("No", typeof(int)),  new DataColumn("RefNum", typeof(string)), new DataColumn("HerbName", typeof(string)), new DataColumn("Quantity", typeof(decimal)) });
                //Session["data"] = herbDT;
                divAlert.Visible = false;
                divAlertError.Visible = false;
               

            }
           

        }
        //--------------Clear Temp Table if !IsPostBack-----------------
        protected void ClearPrescriptionTempTable()
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spClearPrescriptionTemp", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
   
                con.Open();
                try
                {
                    command.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    lblError.Text = message;
                    divAlertError.Visible = true;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }


        }


        protected void GetTotalGranulesQuantity()
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetTotalGranulesQuantityFromTemp", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;


                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        totalGranulesQuantity = Convert.ToDecimal(rdr["TotalGranulesQty"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                    message = "";
                }
                finally
                {

                    con.Close();

                }

            }
        }

        protected void CheckAdministrationFees()
        {
            string message;
            int admMethodID;
            decimal admCost;
            decimal admTimePeriodCalc;
          
            if(rdbAdministration.SelectedValue == "")
            {
                admMethodID = 0;
            }
            else
            {
                admMethodID = Convert.ToInt16(rdbAdministration.SelectedItem.Value);

            }
           
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetAdmData", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@AdmId", admMethodID);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        admCost = Convert.ToDecimal(rdr["AdmMethodPrice"].ToString());
                        admPerTimePeriod = Convert.ToInt16(rdr["PerTimePeriod"]);
                        switch (admMethodID)
                        {
                            case 1:
                                administrationCost = 0;
                                break;
                            case 2:
                                admTimePeriodCalc = Convert.ToInt32(tbxNumDays.Text.ToString()) / admPerTimePeriod;
                                administrationCost = admTimePeriodCalc * admCost;
                                break;
                            case 3:
                                GetTotalGranulesQuantity();
                              
                                administrationCost = ((totalGranulesQuantity / 2) / admPerTimePeriod)* admCost;
                                break;

                        }
                             


                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                    message = "";
                }
                finally
                {

                    con.Close();

                }




            }


        }

        protected void btnAddToTable_Click(object sender, EventArgs e)
        {
            divAlertError.Visible = false;
            stockAlert.Visible = false;
            string message;

            if (tbxQuantity.Text.Length != 0 && tbxHerb.Text.Length !=0 && tbxNumDays.Text.Length !=0)
            {
                herbQuantity = Convert.ToDecimal(tbxQuantity.Text.ToString());
                herbName = tbxHerb.Text.ToString();
                numOfDosageDays = Convert.ToInt16(tbxNumDays.Text.ToString());
            
            if (tbxHerb.Text != "" && tbxQuantity.Text != "")
            {

                //---Get ID of the herb
                string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand("spGetHerbRefNum", con);
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@herbName", herbName);
                    con.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                    try
                    {

                        while (rdr.Read())
                        {

                            refNum = rdr["RefNum"].ToString();

                            if (refNum == "")
                            {
                                message = "No Herb: " + herbName + " in Herb Database! ";
                                    divAlertError.Visible = true;
                                    lblError.Text = message;
                                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                                message = "";
                            }


                        }
                    }
                    catch (Exception ex)
                    {
                        message = "Error! " + ex;
                            divAlertError.Visible = true;
                            lblError.Text = message;
                            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                        message = "";
                    }
                    finally
                    {

                        con.Close();

                    }




                }
            }
            else
            {
                message = "No Herb selected! Please Enter requiered Herb.";
                    divAlertError.Visible = true;
                    lblError.Text = message;
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                message = "";
            }
               int instock =  CheckStock(refNum, herbQuantity);
                if(instock == 1)
                {
                    string formulaName = tbxFormulaName.Text.ToString();
                    if (hdFormulaRefNum.Value == "")
                    {
                        FormulaRefNum();
                        hdFormulaRefNum.Value = formulaRefNum.ToString();
                    }
//-------------------HardCodeed Practitioner ID!!!!!!!!!!!!--------------------
                    practitionerID = 1;

                    CheckBatch(refNum,dosageQuantity);

                    formulaRefNum = hdFormulaRefNum.Value.ToString();
                    foreach (HerbInStock herbInStock in listHerbInSock)
                    {
                        InsertRecordTempPrescription(formulaRefNum, refNum, formulaName, herbInStock.Quantity, numOfDosageDays, patientID, practitionerID,herbInStock.BatchNum);
                    }
               
                        

                        GetTotals();

                        grvShort.DataBind();
                    grvShort.UseAccessibleHeader = true;
                    grvShort.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void CheckBatch(string herbRefNum, decimal totalHerbQuantity)
        {
            List<int> herbsInStockIDs = new List<int>();
            List<decimal> herbInStockQuantity = new List<decimal>();
            List<string> herbInStockBatchNum = new List<string>();
            List<decimal> Ratio = new List<decimal>();

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
                        Ratio.Add(Convert.ToDecimal(rdr["HerbRawToGranRatio"].ToString()));
                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    divAlertError.Visible = true;
                    lblError.Text = message;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }

            HerbInStock resultHerbInStock;

            for (int i=0; i < herbsInStockIDs.Count; i++)
            {
  

                if (herbInStockQuantity[i] >= totalHerbQuantity)
                {
                                     
                   resultHerbInStock = new HerbInStock();
                    resultHerbInStock.HerbStockID = herbsInStockIDs[i];
                    resultHerbInStock.BatchNum = herbInStockBatchNum[i];
                    resultHerbInStock.Quantity = totalHerbQuantity*Ratio[i]/numOfDosageDays;

                    listHerbInSock.Add(resultHerbInStock);
                    break;
                }
                else
                {
                   
                    resultHerbInStock = new HerbInStock();
                    resultHerbInStock.HerbStockID = herbsInStockIDs[i];
                    resultHerbInStock.BatchNum = herbInStockBatchNum[i];
                    resultHerbInStock.Quantity = herbInStockQuantity[i] * Ratio[i] / numOfDosageDays;
                    listHerbInSock.Add(resultHerbInStock);
                    totalHerbQuantity -= herbInStockQuantity[i];

                }
               

            }

        }

        protected void FormulaRefNum()
        {
            string message;
            DateTime today = DateTime.Now;
            string dayOfYear = today.DayOfYear.ToString();
            int yearInt = today.Year % 100;
            string year = yearInt.ToString();
            string formulaName = lblFormulaName.Text.ToString();
            Label lblMasterStatus = (Label)Master.FindControl("lblPractitionerName");
            string pracName = lblMasterStatus.Text.ToString();
//-------------------HardCodeed Practitioner ID!!!!!!!!!!!!--------------------
            practitionerID = 1;


            try
            {
                patientID = Convert.ToInt16(ddlPatient.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                message = "Error! " + ex;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                message = "";
            }

            formulaRefNum = ExtractInitialsFromName(pracName) + dayOfYear + year + DateTime.Now.ToString("HHmmss") + ExtractInitialsFromName(formulaName);
            if (tbxNumDays.Text.ToString() != "")
            {

                numOfDosageDays = Convert.ToInt32(tbxNumDays.Text.ToString());

            };

        }

        protected int CheckStock(string herbRefNum, decimal herbQuantity)
        {
            decimal totalHerbStock;
            int result = 0;
            string message;

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
                        if (!Convert.IsDBNull(rdr["TotalQuantity"]))
                        {
                            totalHerbStock = Convert.ToDecimal(rdr["TotalQuantity"].ToString());
                            dosageQuantity = (herbQuantity * numOfDosageDays) / 5;

                            if (totalHerbStock < dosageQuantity)
                            {
                                lblalertLowStock.Text = String.Format("Quantity of {0} in stock: {1}g", herbName, totalHerbStock);
                                lblHerbQuantityToOrder.Text = String.Format("Missing quantity: {0}g, herb refrence number: {1}", dosageQuantity - totalHerbStock, refNum);
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
                            dosageQuantity = (herbQuantity * numOfDosageDays) / 5;

                            if (totalHerbStock < dosageQuantity)
                            {
                                lblalertLowStock.Text = String.Format("Quantity of {0} in stock: {1}g", herbName, totalHerbStock);
                                lblHerbQuantityToOrder.Text = String.Format("Missing quantity: {0}g, herb refrence number: {1}", dosageQuantity - totalHerbStock, refNum);
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
                    divAlertError.Visible = true;
                    divAlertError.Focus();
                    lblError.Text = message;
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }
           
            return result;
        }

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

        private void GetTotals()
        {
            decimal dispensingFee;
            decimal costb4DispenseryFee;
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetTotalPrice", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        totalFormulaPrice = Convert.ToDecimal(rdr["TotalCost"].ToString());

                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                    message = "";
                }
                finally
                {

                    con.Close();

                }

            }
            grvShort.Columns[0].FooterText = "Total:";

            grvShort.Columns[5].FooterText = string.Format("{0:C}", totalFormulaPrice);
            grvShort.FooterStyle.CssClass = "font-weight-bold";
            CheckAdministrationFees();
            if (ddlDispensingFee.SelectedValue.ToString() == "")
            {
                dispensingFee = 0;
            }
            else
            {
                dispensingFee = Convert.ToDecimal(ddlDispensingFee.SelectedValue.ToString());
            }
           
       
            if (rdbPostage.SelectedValue.ToString() == "")
            {
                postageCost = 0;

            }
            else
            {
                postageCost = Convert.ToDecimal(rdbPostage.SelectedValue.ToString());
            }
            costb4DispenseryFee = totalFormulaPrice + administrationCost;
            totalCost = (costb4DispenseryFee *(dispensingFee / 100))+ costb4DispenseryFee;
            totalCostPlusPostage = (totalCost + postageCost);
            if (tbxDiscount.Text.ToString() == "0.00" || tbxDiscount.Text.ToString() == "")
            {
                discount = 0;
            }
            else
            {
                discount = Convert.ToDecimal(tbxDiscount.Text.ToString());
            }
            
            //if(totalCostPlusPostage<discount)
            //{
            //    totalCostPlusPostage = 0;
            //}
            //else
            //{
            //    totalCostPlusPostage = totalCostPlusPostage - discount;

            //}
            tbxDiscount.Text = discount.ToString();
            lblTotalCost.Text = "€"+ totalCostPlusPostage.ToString("0.00");


        }

        private void InsertRecordTempPrescription(string formulaRefNum, string herbRefNum, string formulaName, decimal herbQuantity, int numOfDosageDays, int patientID, int practitionerID, string herbBatchNum)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spInsertRecordTempPrescription", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
                command.Parameters.AddWithValue("@herbRefNum", herbRefNum);
                command.Parameters.AddWithValue("@formulaName", formulaName);
                command.Parameters.AddWithValue("@herbQuantity", herbQuantity);
                command.Parameters.AddWithValue("@numOfDosageDays", numOfDosageDays);
                command.Parameters.AddWithValue("@patientID", patientID);
                command.Parameters.AddWithValue("@practitionerID", practitionerID);
                command.Parameters.AddWithValue("@herbBatchNum", herbBatchNum);

                con.Open();
                try
                {
                    command.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                    message = "";
                }
                finally
                {

                    con.Close();

                }
            }

        }

        protected decimal GetHerbPrice(string refnum, decimal quantity, string supplier)
        {
            decimal herbPrice = 0;
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetHerbPrice", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@refnum", refnum);
                command.Parameters.AddWithValue("@supplier", supplier);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        herbPrice = Convert.ToDecimal(rdr["Price"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    message = "Error! " + ex;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                    message = "";
                }
                finally
                {

                    con.Close();

                }



                return herbPrice;
            }

        }

        //protected void btnSelectPrescription_Click(object sender, EventArgs e)
        //{
        //    string message;
        //    string tradFormulaName;


        //    if (ddlPrescripion.Text != "" && ddlPrescripion.Text.ToString() != "-- Select Formula --")
        //    {
        //        FormulaRefNum();
        //        tradFormulaName = ddlPrescripion.SelectedItem.Text.ToString();
        //        string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            SqlCommand command = new SqlCommand("spInsertTraditionalFormula", con);
        //            command.CommandType = System.Data.CommandType.StoredProcedure;

        //            command.Parameters.AddWithValue("@formulaName", tradFormulaName);
        //            command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
        //            command.Parameters.AddWithValue("@dosageDays", numOfDosageDays);
        //            command.Parameters.AddWithValue("@patientID", patientID);
        //            command.Parameters.AddWithValue("@practitionerID", practitionerID);
        //            con.Open();
        //            SqlDataReader rdr = command.ExecuteReader();
        //            try
        //            {

        //                command.ExecuteNonQuery();
        //            }
        //            catch (Exception ex)
        //            {
        //                message = "Error! " + ex;
        //                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        //                message = "";
        //            }
        //            finally
        //            {

        //                con.Close();

        //            }
        //        }
        //    }
        //    else
        //    {
        //        message = "No Formula selected! Please select Formula.";
        //        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        //        message = "";
        //    }

        //    grvShort.DataBind();
        //    grvShort.UseAccessibleHeader = true;
        //    int rowCount = grvShort.Rows.Count;
        //    if (rowCount != 0)
        //    {
        //        grvShort.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //    GetTotals();

        //}
        
        protected void grvShort_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            GetTotals();
        }
        
        protected void tbxFormulaName_TextChanged(object sender, EventArgs e)
        {
            lblFormulaName.Text = tbxFormulaName.Text.ToString();
        }

        protected void tbxNumDays_TextChanged(object sender, EventArgs e)
        {
            lblNumDays.Text = tbxNumDays.Text.ToString();
        }

        protected void ddlPatient_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblPatient.Text = ddlPatient.SelectedItem.Text;
        }

        protected void grvShort_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GetTotals();
        }

        protected void addPrescription_Click(object sender, EventArgs e)
        {
            string message;
            if (rdbAdministration.SelectedItem == null)
            {
                divAlert.Visible = true;
                lblNoSelectionAlertHeader.Text = "No Dispensing Method Selected.";
                
            }
            else if(rdbPostage.SelectedItem == null)
            {
                divAlert.Visible = true;
                lblNoSelectionAlertHeader.Text = "No Postage Method Selected.";
            }
            else
            {
                string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand("spInsertIntoPrescriptionMainFromTemp", con);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@formulaTotalCost", totalCostPlusPostage);
                    command.Parameters.AddWithValue("@methodOfAdminist", rdbAdministration.SelectedItem.Text);
                    command.Parameters.AddWithValue("@methodOfAdministCOST", administrationCost);
                    command.Parameters.AddWithValue("@dispensingFee", Convert.ToDecimal(ddlDispensingFee.SelectedItem.Value));
                    command.Parameters.AddWithValue("@postage", rdbPostage.SelectedItem.Text);
                    command.Parameters.AddWithValue("@postageFee", postageCost);
                    command.Parameters.AddWithValue("@discount", Convert.ToDecimal(tbxDiscount.Text.ToString()));
                    command.Parameters.AddWithValue("@discountReason", tbxDiscountReason.Text);
                    command.Parameters.AddWithValue("@prescriptionStatus", "Pending");
                    con.Open();
                    try
                    {
                        command.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        message = "Error! " + ex;
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                        message = "";
                    }
                    finally
                    {

                        con.Close();
                        Response.Redirect("PendingPrescriptions.aspx");
                    }

                }

            }

        }

        protected void btnAddNewPatient_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPatient.aspx");
        }

        protected void tbxDiscount_TextChanged(object sender, EventArgs e)
        {
            GetTotals();
            tbxDiscount.Text = discount.ToString();
        }

        protected void tbxDiscount_PreRender(object sender, EventArgs e)
        {
            tbxDiscount.Attributes["Value"] = tbxDiscount.Text;
        }
    }
}