using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication9
{
    public partial class Read : System.Web.UI.Page
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
                id = Convert.ToInt32(Request.QueryString["lessonid"]);
                this.pdf.Attributes["src"] = GetSrc();
            }
        }

        protected string GetSrc()
        {
            string src = null;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("SELECT Url FROM Lesson WHERE LessonID = " + id.ToString(), conn);
                try
                {
                    conn.Open();
                    src = (string)cmd.ExecuteScalar();                  
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