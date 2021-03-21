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
    public partial class AllPatients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowDetails_Click(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
            GridViewRow row = grvShort.Rows[rowIndex];
            lblPatientName.Text = (row.FindControl("lblPatientName") as Label).Text + " "+ (row.FindControl("lblPatientSurname") as Label).Text;
            tbxPatientName.Text = (row.FindControl("lblPatientName") as Label).Text;
            tbxPatientSurname.Text = (row.FindControl("lblPatientSurname") as Label).Text;
            hdPatientID.Value = row.Cells[1].Text;

            ShowData();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }
        protected void ShowData()
        {
            DataTable dt = new DataTable();
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
         
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPatientPrescriptionHistory", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@patientID", Convert.ToInt32(hdPatientID.Value.ToString()));
               
               
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(command))
                    {
                      

                        da.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
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

        protected void btnModalShowDatails_Click(object sender, EventArgs e)
        {
            Response.Redirect("PendingPrescriptions.aspx");
        }

        protected void grvShort_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = e.NewEditIndex;
            GridViewRow row = grvShort.Rows[e.NewEditIndex];
            string cellValue = row.Cells[1].Text;
            int rowId = Convert.ToInt32(row.Cells[1].Text);

            Response.Redirect("AddPatient.aspx?id=" + rowId);
        }
    }
}