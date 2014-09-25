using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class InsertNewTest : System.Web.UI.Page
    {
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
            }
        }

        protected void DetailsView1_ItemInserted(Object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("Tests.aspx");
        }

        protected void DetailsView1_ModeChanging(Object sender, System.Web.UI.WebControls.DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit == true)
            {
                Response.Redirect("Tests.aspx");
            }
        }
        protected void DetailsView1_ItemInserted(Object sender, SqlDataSourceCommandEventArgs e)
        {
            
        }

        protected void SqlDataSource3_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@QuizID"].Value = id;
        }
    }
}