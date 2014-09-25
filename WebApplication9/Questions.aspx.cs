using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace WebApplication9
{
    public partial class Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                questionDetails.DataBind();
            }
        }

        protected void nextButton_Click(object sender, EventArgs e)
        {
            // Save off previous answers
            System.Data.DataRowView dr = (System.Data.DataRowView)questionDetails.DataItem;

            // Create Answer object to save values
            Answer a = new Answer();
            a.QuestionID = dr["QuestionOrder"].ToString();
            a.CorrectAnswer = dr["CorrectAnswer"].ToString();
            a.UserAnswer = answerDropDownList.SelectedValue.ToString();

            ArrayList al = (ArrayList)Session["AnswerList"];
            al.Add(a);

            Session.Add("AnswerList", al);

            if (questionDetails.PageIndex == questionDetails.PageCount - 1)
            {
                // Go to evaluate answers
                Response.Redirect("Results.aspx");
            }
            else
            {
                questionDetails.PageIndex++;
            }

            if (questionDetails.PageIndex == questionDetails.PageCount - 1)
            {
                nextButton.Text = "Finished";
            }



        }
    }
}