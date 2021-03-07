using System;
using System.Collections.Generic;
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


            ClientScript.RegisterStartupScript(this.GetType(), "pupup", "openModal()", true);
        }
    }
}