using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Pediatric
{
    public partial class Default : System.Web.UI.Page
    {
        String connectionString = @"Data Source=sql.bsite.net\MSSQL2016;Persist Security Info=True;User ID=saguisa_eldnet;Password=Arvin5034#";

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            ErrorLabel.Visible = false;       
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);

                SqlCommand command = new SqlCommand("SELECT * FROM EMPLOYEEFILE WHERE EMPUSERNAME=@username AND EMPPASSWORD=@password", con);
                command.Parameters.AddWithValue("@username", UsernameTxt.Text.Trim());
                command.Parameters.AddWithValue("@password", PasswordTxt.Text.Trim());
                con.Open();

                //int count = Convert.ToInt32(command.ExecuteScalar());
                //if(count == 1)
                var rd = command.ExecuteReader();
                if (rd.HasRows)
                {

                    while (rd.Read())
                    {
                        Session["username"] = rd["EMPUSERNAME"].ToString();
                        string role = rd["EMPPOSITION"].ToString();
                        switch (role)
                        {
                            case "Admin":
                                Response.Redirect("Home.aspx");
                                break;
                            case "Doctor":
                                Response.Redirect("Prescription.aspx");
                                break;
                            case "Nurse":
                                Response.Redirect("Billing.aspx");
                                break;
                        }
                    }
                    //Session["username"] = UsernameTxt.Text;

                }
                else
                {
                    ErrorLabel.Visible = true; //wrong credentials
                }
            }
            catch (Exception exception)
            {
                Response.Write(exception.StackTrace);
            }

        }

        protected void SignUpLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        public void GetEmployeePosition(String position)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand command = new SqlCommand("SELECT FROM * EMPLOYEEFILE", connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                if (reader["EMPPOSITION"].ToString().Trim() == "Admin")
                    position = "Admin";
                else if (reader["EMPPOSITION"].ToString().Trim() == "Doctor")
                    position = "Doctor";
                else if (reader["EMPPOSITION"].ToString().Trim() == "Nurse")
                    position = "Nurse";
            }
            connection.Close();
            reader.Close();
        }
    }
}