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
    public partial class PendingPrescriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPatientView_Click(object sender, EventArgs e)
        {
            //string message;
         
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the Label and TextBox.
           string formulaRefNum = (item.FindControl("hdFormulaRefNum") as HiddenField).Value.ToString();
            modallblFormulaRefNum.Text = formulaRefNum;
            string formulaDate = (item.FindControl("hdFormulaDate") as HiddenField).Value.ToString();
            mdlblCurrentDate.Text =  formulaDate;
            lblPatientID.Text = (item.FindControl("hdPatientID") as HiddenField).Value.ToString();
            lblPatientName.Text = (item.FindControl("hdPatientName") as HiddenField).Value.ToString();
            lblPatientAddress.Text = (item.FindControl("hdPatientAddress") as HiddenField).Value.ToString();
            lblPatientTown.Text = (item.FindControl("hdPatientTown") as HiddenField).Value.ToString();
           lblPatientEirecode.Text = (item.FindControl("hdPatientEirecode") as HiddenField).Value.ToString();
            lblPatientEmail.Text = (item.FindControl("hdPatientEmail") as HiddenField).Value.ToString();
            lblPatientPhone.Text = (item.FindControl("hdPatientPhoneNum") as HiddenField).Value.ToString();
            decimal formulaTotalCost = Convert.ToDecimal((item.FindControl("hdFormulaTotalCost") as HiddenField).Value.ToString());
            decimal methodOfAdminCost = Convert.ToDecimal((item.FindControl("hdMethodOdAdministrationCost") as HiddenField).Value.ToString());
            decimal postageFee = Convert.ToDecimal((item.FindControl("hdPostageFee") as HiddenField).Value.ToString());
            decimal subtotal = formulaTotalCost - methodOfAdminCost - postageFee;
            lblSubtotal.Text = String.Format("{0:C}",subtotal);
            lblDispensingFee.Text = String.Format("{0:C}", methodOfAdminCost);
            lblPostageFee.Text = String.Format("{0:C}", postageFee);
            lblTotalCost.Text = String.Format("{0:C}", formulaTotalCost);
            string practitionerName = (item.FindControl("hdPractitionerName") as HiddenField).Value.ToString();
            string pracTellPhoneNum = (item.FindControl("hdPracPhone") as HiddenField).Value.ToString();
            lblPractitionerDetails.Text = practitionerName + ", " + pracTellPhoneNum;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "patientModal();", true);
            //string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    SqlCommand command = new SqlCommand("spGetAllPrescriptionMain", con);
            //    command.CommandType = System.Data.CommandType.StoredProcedure;

            //    command.Parameters.AddWithValue("@formulaRefNum", formulaRefNum);
            //    con.Open();
            //    SqlDataReader rdr = command.ExecuteReader();
            //    try
            //    {

            //        while (rdr.Read())
            //        {

            //            patientID = Convert.ToInt32(rdr["PatientID"].ToString());
            //            practitionerID = Convert.ToInt32(rdr["PractitionerID"].ToString());



            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        message = "Error! " + ex;
            //        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
            //        message = "";
            //    }
            //    finally
            //    {

            //        con.Close();

            //    }




            //}

        }


    }   
}