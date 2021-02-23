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



                if (c.HasControls())

                {

                    CleartextBoxes(c);

                }

            }

        }
    }
}