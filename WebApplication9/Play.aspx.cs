using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace WebApplication9
{
    public partial class Play : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                id = Convert.ToInt32(Request.QueryString["videoid"]);
                this.youtubeFrame.Attributes["src"] = GetIframeSrc();
            }
        }

        protected string ParseIframe(string iFrame)
        {
            return Regex.Match(iFrame, "(//[^\"]+)").Groups[1].Value;
        }

        protected string GetIframeSrc()
        {
            string src = null;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("SELECT Url FROM Video WHERE VideoID = " + id.ToString(), conn);
                try
                {
                    conn.Open();
                    src = (string)cmd.ExecuteScalar();
                    src = ParseIframe(src);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            return src;
        }
    }
}