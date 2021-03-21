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

namespace Dispensery
{
    public partial class AddPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    FillPage(id);
                    headerAddPatient.Visible = false;
                    headerUpdatePatient.Visible = true;
                    btnAddPatient.Visible = false;
                    btnUpdatePatient.Visible = true;

                }
            }
        }
        protected void btnUpdatePatient_Click(object sender, EventArgs e)
        {
            PatientModel patientModel = new PatientModel();
            Patient p = CreatePatient();

            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);

                divAlertSuccess.Visible = true;
                lblNoSelectionAlertHeader.Text = patientModel.UpdatePatient(id, p);
                Response.Redirect("AllPatients.aspx");
            }
            

        }
        private Patient CreatePatient()
        {
            Patient p = new Patient();
            p.PatientName = tbxPatientName.Text;
            p.PatientSurname = tbxPatientSurname.Text;
            p.PatientAddress = tbxPatientAddress.Text;
            p.PatientTown = tbxPatientCityTown.Text;
            p.PatientCounty = ddlPatientCounty.SelectedValue;
            p.PatientEirecode = tbxEirecode.Text;
            p.PatientCountry = ddlPatientCountry.SelectedValue;
            p.PatientPhoneNum = tbxPatientPhoneNumber.Text;
            p.PatientEmail = tbxPatientEmail.Text;
            p.PatientMedicalCondition = tbxPatientMedicalConditions.Text;
            p.PatientMedication = tbxPatientMedication.Text;
            return p;
        }

        private void FillPage(int id)
        {
            PatientModel patientModel = new PatientModel();
            Patient p = patientModel.GetPatient(id);
            tbxPatientName.Text = p.PatientName;
            tbxPatientSurname.Text = p.PatientSurname;
            tbxPatientAddress.Text = p.PatientAddress;
            tbxPatientCityTown.Text = p.PatientTown;
            ddlPatientCounty.SelectedValue = p.PatientCounty;
            tbxEirecode.Text = p.PatientEirecode;
            ddlPatientCountry.SelectedValue = p.PatientCountry;
            tbxPatientPhoneNumber.Text = p.PatientPhoneNum;
            tbxPatientEmail.Text = p.PatientEmail;
            tbxPatientMedicalConditions.Text = p.PatientMedicalCondition;
            tbxPatientMedication.Text = p.PatientMedication;



        }
        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spInsertNewPatient", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@patientName", tbxPatientName.Text  );
                command.Parameters.AddWithValue("@patientSurname", tbxPatientSurname.Text );
                command.Parameters.AddWithValue("@patientAddress", tbxPatientAddress.Text);
                command.Parameters.AddWithValue("@patientTown", tbxPatientCityTown.Text );
                command.Parameters.AddWithValue("@patientCounty", ddlPatientCounty.SelectedItem.Text);
                command.Parameters.AddWithValue("@patientEirecode", tbxEirecode.Text );
                command.Parameters.AddWithValue("@patientPhoneNum", tbxPatientPhoneNumber.Text);
                command.Parameters.AddWithValue("@patientEmail", tbxPatientEmail.Text );
                command.Parameters.AddWithValue("@patientMedication", tbxPatientMedication.Text );
                command.Parameters.AddWithValue("@patientCountry", ddlPatientCountry.SelectedItem.Text);
                command.Parameters.AddWithValue("@patientMedicalCondition", tbxPatientMedicalConditions.Text );


 

                con.Open();
                try
                {
                    command.ExecuteNonQuery();
                    divAlertSuccess.Visible = true;
                    CleartextBoxes(this);
                    tbxPatientName.Focus();

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

        public void CleartextBoxes(Control parent)

        {



            foreach (Control c in parent.Controls)

            {

                if ((c.GetType() == typeof(TextBox)))

                {



                    ((TextBox)(c)).Text = "";

                }
                else if(c.GetType() == typeof(DropDownList))
                {
                    ((DropDownList)(c)).SelectedIndex = 0;
                }



                if (c.HasControls())

                {

                    CleartextBoxes(c);

                }

            }

        }

       
    }
}