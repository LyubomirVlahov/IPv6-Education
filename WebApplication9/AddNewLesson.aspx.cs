using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class AddNewLesson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void DetailsView1_ItemInserted(Object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("Lessons.aspx");
        }

        protected void DetailsView1_ModeChanging(Object sender, System.Web.UI.WebControls.DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit == true)
            {
                Response.Redirect("Lessons.aspx");
            }
        }
    }
}