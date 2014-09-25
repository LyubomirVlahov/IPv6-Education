using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;

namespace WebApplication9
{
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                SaveResults();
            }
            else
            {
                Response.Redirect("default.aspx");
            }

        }

        protected void SaveResults()
        {
            ArrayList al = (ArrayList)Session["AnswerList"];

            if (al == null)
            {
                Response.Redirect("default.aspx");
            }

            resultGrid.DataSource = al;
            resultGrid.DataBind();

            // Save the results into the database.
            if (IsPostBack == false)
            {
                // Calculate score
                double questions = al.Count;
                double correct = 0.0;


                for (int i = 0; i < al.Count; i++)
                {
                    Answer a = (Answer)al[i];
                    if (a.Result == Answer.ResultValue.Correct)
                        correct++;
                }

                int score = Convert.ToInt32((correct / questions) * 100);

                SqlDataSource userQuizDataSource = new SqlDataSource();
                userQuizDataSource.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Quiz.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
                ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                userQuizDataSource.InsertCommand = "INSERT INTO [UserQuiz] ([QuizID], [DateTimeComplete], [Score], [UserName]) VALUES (@QuizID, @DateTimeComplete, @Score, @UserName)";

                userQuizDataSource.InsertParameters.Add("QuizID", Session["QuizID"].ToString());
                userQuizDataSource.InsertParameters.Add("DateTimeComplete", DateTime.Now.ToString());
                userQuizDataSource.InsertParameters.Add("Score", score.ToString());
                userQuizDataSource.InsertParameters.Add("UserName", User.Identity.Name);

                int rowsAffected = userQuizDataSource.Insert();
                if (rowsAffected == 0)
                {
                    // Let's just notify that the insertion didn't
                    // work, but let' s continue on ...
                    errorLabel.Text = "There was a problem saving your quiz results into our database.  Therefore, the results from this quiz will not be displayed on the list on the main menu.";
                }

            }
        }

        protected void resultGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "QuestionOrder=" + resultGrid.SelectedValue;
        }
    }
}