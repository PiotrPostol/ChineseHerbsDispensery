using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dispensery
{
    public partial class AddHerbToStock : System.Web.UI.Page
    {
        string refNum;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                divAlertWarning.Visible = false;
                divAlertSuccess.Visible = false;
            }

        }


//-----------------Get Herb Ref Number---------------------------------
        protected void GetHerbRefNum(string herbName)
        {
            string message;
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
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                                message = "";
                            }


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
            else
            {
                message = "No Herb selected! Please Enter requiered Herb.";
                divAlertWarning.Visible = true;
                lblAlertWarning.Text = message;
                message = "";
            }

        }


        //----------------add herb to stock---------------
        protected void btnAddHerb_Click(object sender, EventArgs e)
        {
            string message;
            string herbName = tbxHerb.Text.ToString();
            GetHerbRefNum(herbName);

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spAddHerbToStock", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@herbRefNum", refNum);
                command.Parameters.AddWithValue("@batchNum", tbxBatchNumber.Text.ToString());
                command.Parameters.AddWithValue("@buyPrice", Convert.ToDecimal(tbxSupplierPrice.Text));
                //command.Parameters.AddWithValue("@sellPrice", Convert.ToDecimal(tbxSellPrice.Text));
                command.Parameters.AddWithValue("@expiaryDate", Convert.ToDateTime(tbxExpiaryDate.Text));
                command.Parameters.AddWithValue("@quantity", Convert.ToDecimal(tbxQuantity.Text));
                command.Parameters.AddWithValue("@supplierID", ddlSupplier.SelectedValue);
                command.Parameters.AddWithValue("@ratio", tbxRatio.Text);
                command.Parameters.AddWithValue("@dateReceived", Convert.ToDateTime(tbxDateReceived.Text));
                command.Parameters.AddWithValue("@dateToDispensery", Convert.ToDateTime(tbxDateToDispensery.Text));
                command.Parameters.AddWithValue("@herbForm", ddlHerbForm.SelectedValue.ToString());
                con.Open();
                try
                {
                    command.ExecuteNonQuery();
                    divAlertSuccess.Visible = true;
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
    }
}