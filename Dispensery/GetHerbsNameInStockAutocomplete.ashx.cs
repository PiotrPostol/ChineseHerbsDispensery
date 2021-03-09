using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace Dispensery
{
    /// <summary>
    /// Summary description for GetHerbsNameInStockAutocomplete
    /// </summary>
    public class GetHerbsNameInStockAutocomplete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            List<string> listHerbsNames = new List<string>();

            string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetHerbsNameInStock", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter()
                {
                    ParameterName = "@term",
                    Value = term
                };

                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    listHerbsNames.Add(rdr["HerbName"].ToString());
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(listHerbsNames));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}