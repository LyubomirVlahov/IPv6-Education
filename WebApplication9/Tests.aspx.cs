using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class Tests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void addNewQuizButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewQuiz.aspx");
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessageLabel.Text = "Failed to DELETE due to foreign key contstraint on the table.  You may only delete rows which have no related records.";
                e.ExceptionHandled = true;
            }
        }

        protected void OnDelete(Object sender, EventArgs e)
        {
            SqlDataSource2.Delete();
        }

        protected void LinkButton_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/InsertNewQuestion.aspx?ID=" + DropDownList1.SelectedValue, true);
        }

    }
}