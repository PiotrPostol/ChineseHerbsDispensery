﻿using System;
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
using Xceed.Document.NET;
using Xceed.Words.NET;
using System.Diagnostics;
using System.IO;

namespace Dispensery
{
    public partial class CompletedPrescriptions : System.Web.UI.Page
    {
        decimal granulesTotal;
        decimal dailyDosageTotal;
        decimal totalCost;

        string formulaName;
        decimal dosageDays;
        int patientID;
        int practitionerID;
        string herbBatchNum;
        string herbName;
        decimal granulesQuantity;
        decimal sellPrice;
        decimal subtotal;
        DateTime dateCreated;
        string patientName;
        string patientAddress;
        string patientTown;
        string patientEirecode;
        string patientPhoneNo;
        string patientEmail;
        decimal formulaTotalCost;
        string methodOfAdminist;
        decimal methodOfAdministCost;
        decimal dispensingFee;
        string postageMethod;
        decimal postageFee;
        string prescriptionStatus;
        string practitionerName;
        string practitionerPhoneNo;
        string practitionerEmail;
        decimal discount;
        string formulaRefNum;
        string discountReason;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                divDiscount.Visible = false;
                divPracDiscount.Visible = false;
            }
        }

        protected void GetDataFromPrescriptionMain(string formulaRefNum)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetDataFromPrescriptionMain", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        formulaName = rdr["FormulaName"].ToString();
                        dosageDays = Convert.ToInt32(rdr["DosageDays"].ToString());
                        patientID = Convert.ToInt32(rdr["PatientID"].ToString());
                        practitionerID = Convert.ToInt32(rdr["PractitionerID"].ToString());
                        herbBatchNum = rdr["HerbBatchNum"].ToString();
                        herbName = rdr["HerbChineseName"].ToString();
                        granulesQuantity = Convert.ToDecimal(rdr["GranulesQuantity"].ToString());
                        sellPrice = Convert.ToDecimal(rdr["SellPrice"].ToString());
                        subtotal = Convert.ToDecimal(rdr["Subtotal"].ToString());
                        dateCreated = Convert.ToDateTime(rdr["DateCreated"].ToString());

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
        protected void GetPatientData(int patientID)
        {

            string patientFirstName;
            string patientSurname;
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPatientName", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@patientID", patientID);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        patientFirstName = rdr["PatientName"].ToString();
                        patientSurname = rdr["PatientSurname"].ToString();
                        patientName = patientFirstName + " " + patientSurname;
                        patientAddress = rdr["PatientAddress"].ToString();
                        patientTown = rdr["PatientTown"].ToString();
                        patientEirecode = rdr["PatientEirecode"].ToString();
                        patientPhoneNo = rdr["PatientPhoneNum"].ToString();
                        patientEmail = rdr["PatientEmail"].ToString();

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

        protected void GetPrescriptionCostData(string formulaRefNumber)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPrescriptionCostData", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@formulaRefNumber", formulaRefNumber);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {
                    while (rdr.Read())
                    {

                        formulaTotalCost = Convert.ToDecimal(rdr["FormulaTotalCost"].ToString());
                        methodOfAdminist = rdr["MethodOfAdminist"].ToString();
                        methodOfAdministCost = Convert.ToDecimal(rdr["MethodOfAdministCOST"].ToString());
                        dispensingFee = Convert.ToDecimal(rdr["DispensingFee"].ToString());
                        postageMethod = rdr["Postage"].ToString();
                        postageFee = Convert.ToDecimal(rdr["PostageFee"].ToString());
                        prescriptionStatus = rdr["PrescriptionStatus"].ToString();
                        discount = Convert.ToDecimal(rdr["Discount"].ToString());
                        discountReason = rdr["DiscountReason"].ToString();
                    }
                    //Convert.ToDecimal(rdr["PostageFee"].ToString());
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

        protected void GetPractitionerData(int practitionerId)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPractitonerData", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@practitionerId", practitionerId);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {
                    while (rdr.Read())
                    {

                        practitionerName = rdr["PracName"].ToString() + " " + rdr["PracSurname"].ToString();
                        practitionerEmail = rdr["PracEmail"].ToString();
                        practitionerPhoneNo = rdr["PracTellphoneNum"].ToString();

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

        protected void btnPatientView_Click(object sender, EventArgs e)
        {
            practitionerInvoice.Visible = false;
            GridView2.Visible = false;
            patientInvoice.Visible = true;
            GridView1.Visible = true;
            lblDosageDays.Visible = false;
            //string message;

            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            formulaRefNum = (item.FindControl("hdFormulaRefNum") as HiddenField).Value.ToString();
            modallblFormulaRefNum.Text = formulaRefNum;
            GetDataFromPrescriptionMain(formulaRefNum);
            GetPatientData(patientID);
            GetPrescriptionCostData(formulaRefNum);
            GetPractitionerData(practitionerID);
            mdlblCurrentDate.Text = String.Format("{0:dd/MM/yyyy}", dateCreated);
            lblPatientID.Text = " #" + patientID.ToString();
            lblPatientName.Text = patientName;
            lblPatientAddress.Text = patientAddress;
            lblPatientTown.Text = patientTown;
            lblPatientEirecode.Text = patientEirecode;
            lblPatientEmail.Text = patientEmail;
            lblPatientPhone.Text = patientPhoneNo;

            decimal subtotalWithDispFee = formulaTotalCost - methodOfAdministCost - postageFee;
            if (subtotalWithDispFee <= 0)
            {
                subtotalWithDispFee = 0;

            }
            lblSubtotal.Text = String.Format("{0:C}", subtotalWithDispFee);
            lblDispensingFee.Text = String.Format("{0:C}", methodOfAdministCost);
            lblPostageFee.Text = String.Format("{0:C}", postageFee);
            if (discount != 0)
            {
                divDiscount.Visible = true;
                lblDiscount.Text = String.Format("{0:C}", discount);
                formulaTotalCost -= discount;
            }
            lblDosageDays.Text = " " + dosageDays.ToString() + " days";
            lblTotalCost.Text = String.Format("{0:C}", formulaTotalCost);

            lblPractitionerDetails.Text = practitionerName + ", " + practitionerPhoneNo;


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "patientModal();", true);


        }

        protected void btnPractitionerView_Click(object sender, EventArgs e)
        {

            GridView1.Visible = false;
            patientInvoice.Visible = false;
            practitionerInvoice.Visible = true;
            GridView2.Visible = true;
            lblDosageDays.Visible = true;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            formulaRefNum = (item.FindControl("hdFormulaRefNum") as HiddenField).Value.ToString();
            modallblFormulaRefNum.Text = formulaRefNum;
            GetDataFromPrescriptionMain(formulaRefNum);
            GetPatientData(patientID);
            GetPrescriptionCostData(formulaRefNum);
            GetPractitionerData(practitionerID);
            mdlblCurrentDate.Text = String.Format("{0:dd/MM/yyyy}", dateCreated);
            lblPatientID.Text = " #" + patientID.ToString();
            lblPatientName.Text = patientName;
            lblPatientAddress.Text = patientAddress;
            lblPatientTown.Text = patientTown;
            lblPatientEirecode.Text = patientEirecode;
            lblPatientEmail.Text = patientEmail;
            lblPatientPhone.Text = patientPhoneNo;
            lbldiscountReason.Text = discountReason;

            decimal subtotalWithDispFee = formulaTotalCost - postageFee;
            //lblSubtotal.Text = String.Format("{0:C}", subtotalWithDispFee);

            if (dispensingFee != 0)
            {
                lblPracDispensingFee.Text = String.Format("{0:C}", subtotalWithDispFee - (subtotalWithDispFee * 1 / (1 + (dispensingFee / 100))));
            }

            else
            {
                lblPracDispensingFee.Text = "€0.00";
            }
            lblDosageDays.Text = " " + dosageDays.ToString() + " days";
            lblPracAdminiMethod.Text = methodOfAdminist.ToString();
            lblPracAdminiCost.Text = String.Format("{0:C}", methodOfAdministCost);
            lblPracPostageMethod.Text = postageMethod.ToString();
            lblPracPostageCost.Text = String.Format("{0:C}", postageFee);
            if (discount != 0)
            {
                divPracDiscount.Visible = true;
                lblPracDiscount.Text = String.Format("{0:C}", discount);
                formulaTotalCost -= discount;
            }

            lblPracTotalCost.Text = String.Format("{0:C}", formulaTotalCost);

            lblPractitionerDetails2.Text = "<b>Dispensing Practitioner:</b>" + " " + practitionerName;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "patientModal();", true);


        }



        protected void GridView2_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

                dailyDosageTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "DailyDosage"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[2].Text = String.Format("{0:f0}", "<b>" + String.Format("{0:f0}", dailyDosageTotal) + "</b>");


            if (e.Row.RowType == DataControlRowType.DataRow)
                granulesTotal += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "GranulesQuantity"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[3].Text = "<b>" + granulesTotal + "</b>";

            if (e.Row.RowType == DataControlRowType.DataRow)
                totalCost += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Subtotal"));
            else if (e.Row.RowType == DataControlRowType.Footer)
                e.Row.Cells[5].Text = String.Format("{0:C}", "<b>" + String.Format("{0:C}", totalCost) + "</b>");




        }

        protected void btnChangeStatus_Click(object sender, EventArgs e)
        {
            string message;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            formulaRefNum = (item.FindControl("hdFormulaRefNum") as HiddenField).Value.ToString();

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spUpdateStock", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);

                con.Open();
                //SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    command.ExecuteNonQuery();
                    divAlertSuccess.Visible = true;
                    Repeater1.DataBind();
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

        protected void ddlPatient_SelectedIndexChanged(object sender, EventArgs e)
        {
            Repeater1.DataBind();
        }
 //-------------------------print lable---------------------------------

        protected void btnPrintLable_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
            formulaRefNum = (item.FindControl("hdFormulaRefNum") as HiddenField).Value.ToString();
            modallblFormulaRefNum.Text = formulaRefNum;
            GetDataFromPrescriptionMain(formulaRefNum);
            GetPatientData(patientID);
            GetPrescriptionCostData(formulaRefNum);
            GetPractitionerData(practitionerID);
            mdlblCurrentDate.Text = String.Format("{0:dd/MM/yyyy}", dateCreated);
            lblPatientID.Text = " #" + patientID.ToString();
            lblPatientName.Text = patientName;
            lblPatientAddress.Text = patientAddress;
            lblPatientTown.Text = patientTown;
            lblPatientEirecode.Text = patientEirecode;
            lblPatientEmail.Text = patientEmail;
            lblPatientPhone.Text = patientPhoneNo;

            decimal subtotalWithDispFee = formulaTotalCost - methodOfAdministCost - postageFee;
            if (subtotalWithDispFee <= 0)
            {
                subtotalWithDispFee = 0;

            }
            lblSubtotal.Text = String.Format("{0:C}", subtotalWithDispFee);
            lblDispensingFee.Text = String.Format("{0:C}", methodOfAdministCost);
            lblPostageFee.Text = String.Format("{0:C}", postageFee);
            if (discount != 0)
            {
                divDiscount.Visible = true;
                lblDiscount.Text = String.Format("{0:C}", discount);
                formulaTotalCost -= discount;
            }
            lblDosageDays.Text = " " + dosageDays.ToString() + " days";
            lblTotalCost.Text = String.Format("{0:C}", formulaTotalCost);

            lblPractitionerDetails.Text = practitionerName + ", " + practitionerPhoneNo;
            decimal totalGranulesQty = GetTotalGranulsQty(formulaRefNum);

            using (FileStream fs = new FileStream(@"C:\Labels\Template.docx", FileMode.Open))
             {
                 // Load the document using fs
                 using (var document = DocX.Load(fs))
                 {
                    // Do something with the document here.
                    document.AddCustomProperty(new CustomProperty("PatientName", patientName));
                    document.AddCustomProperty(new CustomProperty("PatientAddress", patientAddress+", "+patientTown+", "+patientEirecode));
                    document.AddCustomProperty(new CustomProperty("PracName", practitionerName));
                    document.AddCustomProperty(new CustomProperty("PrescribedDate", dateCreated.ToShortDateString()));
                    document.AddCustomProperty(new CustomProperty("DispensedDate", DateTime.Now.ToShortDateString()));
                    document.AddCustomProperty(new CustomProperty("UseBy", DateTime.Now.AddDays(56).ToShortDateString()));
                    document.AddCustomProperty(new CustomProperty("FormulaTotalWeight", totalGranulesQty.ToString()));
                    document.AddCustomProperty(new CustomProperty("FormulaDoseWeight", (totalGranulesQty / dosageDays).ToString()));
                    document.AddCustomProperty(new CustomProperty("Formula", GetPrescriptionHerbNamesQty(formulaRefNum)));





                    // Save all changes made to this document.
                    document.SaveAs(string.Format(@"C:\Labels\{0}.docx", patientName+"-" + formulaRefNum));
                    Process.Start("WINWORD.EXE", "\"" + string.Format(@"C:\Labels\{0}.docx", patientName+"-"+formulaRefNum) + "\"");
                }// Release this document from memory.
            }
          
        }

        protected decimal GetTotalGranulsQty(string formulaRefNum)
        {
            decimal totalGranulsQty = 0;
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPrescriptionTotalGranulsQty", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {
                    while (rdr.Read())
                    {

                        totalGranulsQty = Convert.ToDecimal(rdr["GranulesQuantity"]);

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


            return totalGranulsQty;
        }



        protected string GetPrescriptionHerbNamesQty (string formulaRefNum)
        {
            string formulaHerbs = "";
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetHerbNameGranulsQtyFromPrescription", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {
                    while (rdr.Read())
                    {

                        formulaHerbs += rdr["HerbChineseName"].ToString() + "(" + rdr["GranulesQuantity"].ToString()+"g), ";
                       
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

            return formulaHerbs;
        }

    }
}