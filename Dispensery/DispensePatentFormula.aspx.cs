using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dispensery
{
    public partial class DispensePatentFormula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbxCurrentDate.Text = DateTime.Now.ToString("d");
            if (IsPostBack)
            {
                divAlertSuccess.Visible = false;
            }
        }
        protected void btnAddNewPatient_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPatient.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btnDispense_Click(object sender, EventArgs e)
        {
           
            int practitionerID = Convert.ToInt32(ddlPractitioner.SelectedValue);
            string formulaName = ddlFormulaName.SelectedItem.ToString();
            int batchNumID = Convert.ToInt32(lbAvailablePF.SelectedValue);
            int bottleQty = Convert.ToInt32(tbxDispenseBottleQty.Text.ToString());
            DateTime sellDate = Convert.ToDateTime(tbxCurrentDate.Text);
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
              
                SqlCommand command = new SqlCommand("spPFsale", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@pracID", practitionerID);
                command.Parameters.AddWithValue("@batchNumID", batchNumID);
                command.Parameters.AddWithValue("@bottleQty", bottleQty);
                command.Parameters.AddWithValue("@saleDate", String.Format("{0:yyyy-MM-dd}",sellDate));

                SqlParameter returnParameter = command.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;


                con.Open();
                try
                {
                    command.ExecuteNonQuery();
                    int spResult = (int)returnParameter.Value;
                    if (spResult !=-1)
                    {
                        
                        divAlertSuccess.Visible = true;
                        ClearInputsFields();
                    }
                    else if (spResult == -1)
                    {
                        divAlertWarning.Visible = true;
                        lblAlertWarning.Text = String.Format("Not enough of {0} in stock!", formulaName);
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


        }

        protected void btnWarningCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void ClearInputsFields()
        {
            ddlPractitioner.SelectedIndex = 0;
            ddlFormulaName.SelectedIndex = 0;
            lbAvailablePF.DataBind();
            tbxDispenseBottleQty.Text = "";
            tbxCurrentDate.Text = DateTime.Now.ToShortDateString();


        }
    }
}