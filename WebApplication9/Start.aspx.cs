using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication9
{
    public partial class Start : System.Web.UI.Page
    {
        string dateTimeComplete;
        int score;
        bool isFirstTime = true;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (Request.QueryString["testid"] != null)
                {
                    int testID = int.Parse(Request.QueryString["testid"]);
                    checkIsFirstTime(testID);
                    if (isFirstTime)
                    {
                        ArrayList al = new ArrayList();
                        Session.Add("AnswerList", al);
                        Session.Add("QuizID", testID);
                        info.Text = " Натиснете старт бутона за да започнете теста.";
                        startButton.Text = "Старт";
                    }
                    else
                    {
                        info.Text = "Вие вече сте правили този тест на " + dateTimeComplete + " Вашият резултат е " + score + "%";
                        startButton.Text = "ОК";
                    }
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
        }

        protected void checkIsFirstTime(int id)
        {
            string name = HttpContext.Current.User.Identity.Name;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString()))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT DateTimeComplete, Score FROM UserQuiz WHERE QuizID = " + id +
                        "AND UserName = '" + HttpContext.Current.User.Identity.Name + "'", conn);

                    conn.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {

                        if (rdr.Read())
                        {
                            isFirstTime = false;
                            dateTimeComplete = (String)rdr["DateTimeComplete"];
                            score = (byte)rdr["Score"];
                        }
                    }
                }
                catch (Exception)
                {
                    throw;
                }
                finally
                {
                    conn.Close();
                }
            }
        }



        protected void startButton_Click(object sender, EventArgs e)
        {
            if (isFirstTime)
            {
                Response.Redirect("questions.aspx");
            }
            else
            {
                Response.Redirect("Profile.aspx");
            }
        }
    }
}