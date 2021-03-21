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
            if (!IsPostBack)
            {
                if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    int rowIndex = Convert.ToInt32(Request.QueryString["rowIndex"]);
                    FillPage(id);
                    addHerbToStock.Visible = false;
                    updateHerbStock.Visible = true;
                    btnAddHerb.Visible = false;
                    btnUpdateHerbStock.Visible = true;
                }
            }
                if (IsPostBack)
            {
                divAlertWarning.Visible = false;
                divAlertSuccess.Visible = false;
            }


        }

        private void FillPage(int id)
        {
            HerbStockModel herbStock = new HerbStockModel();
            HerbStock hs = herbStock.GetHerbStock(id);
            AllHerbsModel ahm = new AllHerbsModel();
            AllHerb ah = ahm.GetAllHerb(hs.HerbRefNum.ToString());
            tbxHerb.Text =  ah.HerbName ;
            tbxQuantity.Text = hs.Quantity.ToString();
            tbxBatchNumber.Text = hs.BatchNum;
            tbxExpiaryDate.Text = String.Format("{0:dd/MM/yyyy}",hs.ExpiryDate);
            ddlSupplier.SelectedValue = hs.SupplierID.ToString();
            tbxSupplierPrice.Text = String.Format("{0:0.0000}",hs.BuyPrice);
            ddlHerbForm.SelectedValue = hs.HerbForm.ToString();
            tbxRatio.Text = hs.HerbRawToGranRatio.ToString();
            tbxDateReceived.Text = String.Format("{0:dd/MM/yyyy}", hs.DateReceived);
            tbxDateToDispensery.Text = String.Format("{0:dd/MM/yyyy}", hs.DateToDispensery);



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

        protected void btnUpdateHerbStock_Click(object sender, EventArgs e)
        {
            HerbStockModel hsModel = new HerbStockModel();
            HerbStock hs = CreateHerbStock();

            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                int rowIndex = Convert.ToInt32(Request.QueryString["rowIndex"]);

                divAlertSuccess.Visible = true;
                lblNoSelectionAlertHeader.Text = hsModel.UpdateHerbStock(id, hs);
                Response.Redirect("ViewInventory.aspx?rowIndex="+ rowIndex);
            }
        }
        private HerbStock CreateHerbStock()
        {
            HerbStock hs = new HerbStock();
            AllHerbsModel ahm = new AllHerbsModel();
            AllHerb ah = ahm.GetHerbByName(tbxHerb.Text);
            hs.HerbRefNum = ah.RefNum.ToString();
            hs.BatchNum = tbxBatchNumber.Text;
            hs.BuyPrice = Convert.ToDecimal(tbxSupplierPrice.Text);
            hs.ExpiryDate = Convert.ToDateTime(tbxExpiaryDate.Text);
            hs.Quantity = Convert.ToDecimal(tbxQuantity.Text);
            hs.SupplierID = Convert.ToInt32(ddlSupplier.SelectedValue);
            hs.HerbRawToGranRatio = Convert.ToDecimal(tbxRatio.Text);
            hs.DateReceived = Convert.ToDateTime(tbxDateReceived.Text);
            hs.DateToDispensery = Convert.ToDateTime(tbxDateToDispensery.Text);
            hs.HerbForm = ddlHerbForm.SelectedItem.Text;
            return hs;
        }

    }
}