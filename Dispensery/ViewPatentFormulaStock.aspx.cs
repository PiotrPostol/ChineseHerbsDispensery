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
    public partial class ViewPatentFormulaStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModalDetails_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string pfFormulaName= (item.FindControl("hdFormulaName") as HiddenField).Value.ToString();
            hdModalFormulaName.Value = pfFormulaName;
            lblFormulaName.Text = pfFormulaName;
            //tbxBottlesQty.Text = GetBottlesQty(ddlpfRefNum.SelectedValue.ToString());
            tbxBottlesQty.Text = GetBottlesQty(lbpfRefNum.SelectedValue.ToString());
            ClientScript.RegisterStartupScript(this.GetType(), "pupup", "openModal()", true);
        }

        protected string GetBottlesQty(string pfRefNum)
        {
            string result ="";
            string message;
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand command = new SqlCommand("spGetPFbottlesQty", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@pfRefNum", pfRefNum);

                con.Open();
                SqlDataReader rdr = command.ExecuteReader();
                try
                {

                    while (rdr.Read())
                    {

                        result = rdr["BottleQuantity"].ToString();
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
            return result;
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbxBottlesQty.Text = GetBottlesQty(lbpfRefNum.SelectedValue.ToString());

            GridView1.DataBind();
        }

      

        //protected void ddlpfRefNum_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //     tbxBottlesQty.Text = GetBottlesQty(ddlpfRefNum.SelectedValue.ToString());

        //    GridView1.DataBind();
        //}
    }
}