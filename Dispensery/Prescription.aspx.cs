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
    public partial class CreateFormula : System.Web.UI.Page
    {
        string refNum;
        string herbName;
        decimal herbQuantity;
        int herbNo = 0;
        decimal phenixPrice;
        decimal balancePrice;
        decimal phenixTotal;
        decimal balanceTotal;
        //DataTable herbDT;




        protected void Page_Load(object sender, EventArgs e)
        {
            CultureInfo FrCulture = new CultureInfo("fr-FR");
            if (!IsPostBack)
            {
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                int rowCount = GridView1.Rows.Count;
                if (rowCount != 0)
                {
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                GetTotals();
                //DataTable herbDT = new DataTable();
                //herbDT.Columns.AddRange(new DataColumn[4] { new DataColumn("No", typeof(int)),  new DataColumn("RefNum", typeof(string)), new DataColumn("HerbName", typeof(string)), new DataColumn("Quantity", typeof(decimal)) });
                //Session["data"] = herbDT;


            }

        }


        protected void addHerb_Click(object sender, EventArgs e)
        {
            string message = "";
            foreach (TextBox textBox in Page.Form.Controls.OfType<TextBox>())
            {
                message += textBox.ID + ": " + textBox.Text + "\\n";
            }

            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }
        protected void btnAddToTable_Click(object sender, EventArgs e)
        {

            herbName = tbxHerb.Text.ToString();
            herbQuantity = Convert.ToDecimal(tbxQuantity.Text.ToString());

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
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                message = "";
            }
            phenixPrice = GetHerbPrice(refNum, herbQuantity, "Phenix") * herbQuantity;
            balancePrice = GetHerbPrice(refNum, herbQuantity, "Balance") * herbQuantity;
            InsertRecordTempPrescription(refNum, herbName, herbQuantity, phenixPrice, balancePrice);
            GetTotals();
           
            GridView1.DataBind();
            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        private void GetTotals()
        {
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

                        phenixTotal = Convert.ToDecimal(rdr["PhenixTotal"].ToString());
                        balanceTotal = Convert.ToDecimal(rdr["BalanceTotal"].ToString());
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
            GridView1.Columns[4].FooterText = string.Format("{0:C}", phenixTotal);
            GridView1.Columns[5].FooterText = string.Format("{0:C}", balanceTotal);
        }
        private void InsertRecordTempPrescription(string refNum, string herbName, decimal herbQuantity, decimal phenixPrice, decimal balancePrice)
        {
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spInsertRecordTempPrescription", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@refNum", refNum);
                command.Parameters.AddWithValue("@herbName", herbName);
                command.Parameters.AddWithValue("@herbQuantity", herbQuantity);
                command.Parameters.AddWithValue("@phenixPrice", phenixPrice);
                command.Parameters.AddWithValue("@balancePrice", balancePrice);
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

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            GetTotals();
        }

        protected void btnSelectPrescription_Click(object sender, EventArgs e)
        {
            string message;
            string tradFormulaName;


            if (ddlPrescripion.Text != "" && ddlPrescripion.Text.ToString() != "-- Select Formula --")
            {

                tradFormulaName = ddlPrescripion.SelectedItem.Text.ToString();
                string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand command = new SqlCommand("spGetTraditionalFormula", con);
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@formulaName", tradFormulaName);
                    con.Open();
                    SqlDataReader rdr = command.ExecuteReader();
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
            else
            {
                message = "No Formula selected! Please select Formula.";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
                message = "";
            }
         
            GridView1.DataBind();
            GridView1.UseAccessibleHeader = true;
            int rowCount = GridView1.Rows.Count;
            if (rowCount != 0)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            GetTotals();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}