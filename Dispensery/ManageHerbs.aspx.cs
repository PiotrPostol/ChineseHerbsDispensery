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
    public partial class ManageHerbs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                int rowCount = GridView1.Rows.Count;
                if (rowCount != 0)
                {
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

            }
        }

        protected void btnAddNewHerb_Click(object sender, EventArgs e)
        {

        }
//---new refNum for new herb---
    //    protected string genRefNum(string herbName)
    //    {
    //        string newRefNum="";


    //        string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

    //        using (SqlConnection con = new SqlConnection(constr))
    //        {
    //            SqlCommand command = new SqlCommand("spGetHerbRefNum", con);
    //            command.CommandType = System.Data.CommandType.StoredProcedure;

    //            command.Parameters.AddWithValue("@herbName", herbName);
    //            con.Open();
    //            SqlDataReader rdr = command.ExecuteReader();
    //            try
    //            {

    //                while (rdr.Read())
    //                {

    //                    refNum = rdr["RefNum"].ToString();

    //                    if (refNum == "")
    //                    {
    //                        message = "No Herb: " + herbName + " in Herb Database! ";
    //                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    //                        message = "";
    //                    }


    //                }
    //            }
    //            catch (Exception ex)
    //            {
    //                message = "Error! " + ex;
    //                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    //                message = "";
    //            }
    //            finally
    //            {

    //                con.Close();

    //            }
    //        }
    //        return newRefNum;
    //    }


   }
}