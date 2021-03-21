using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dispensery
{
    public partial class ViewInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrWhiteSpace(Request.QueryString["rowIndex"]))
                {
                 
                    int rowIndex = Convert.ToInt32(Request.QueryString["rowIndex"]);


                    GridView1.Focus();
                    GridView1.Rows[rowIndex].Cells[0].Focus();
                    GridView1.Rows[rowIndex].BackColor = System.Drawing.Color.FromArgb(159, 194, 153);
                }
            }

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }
        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Dispensary - Inventory Export - " + DateTime.Now.ToShortDateString() + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        protected void btnExportToExl_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = e.NewEditIndex;
            GridViewRow row = GridView1.Rows[e.NewEditIndex];
            string cellValue = ((Label)(row.Cells[1].FindControl("Label1"))).Text;
            int rowId = Convert.ToInt32(cellValue);

            Response.Redirect("AddHerbToStock.aspx?id=" + rowId+"&rowIndex="+rowIndex);
        }

      
    }
}