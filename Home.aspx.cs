using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace Pediatric
{
    public partial class Home : System.Web.UI.Page
    {
        String connectionString = @"Data Source=sql.bsite.net\MSSQL2016;Persist Security Info=True;User ID = saguisa_eldnet; Password=Arvin5034#";
        public String username;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
            displayLoggedInUserData(); //method call, display in label
      
        }

        protected void PatientLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientForm.aspx");
        }

        protected void BillingLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Billing.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Immunization.aspx");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }

        public void displayLoggedInUserData()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM EMPLOYEEFILE WHERE EMPUSERNAME ='" + username + "'";

            SqlCommand searchCommand = new SqlCommand(sql, con);
            SqlDataReader searchReader = searchCommand.ExecuteReader();

            if (searchReader.Read()) //["EMPUSERNAME"].ToString() == username)
            {
                PreparedByLabel.Text = searchReader["EMPLOYEECODE"].ToString() + " " + searchReader["EMPFNAME"].ToString();
            }
            con.Close();
            searchReader.Close();
        }

        protected void PrescriptionLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Prescription.aspx");
        }

        public void displayEmployee()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            //retrieve at datagrid
            SqlCommand gridCommand = new SqlCommand("SELECT * FROM EMPLOYEEFILE", con);
            SqlDataAdapter gridAdapter = new SqlDataAdapter(gridCommand);
            DataSet dataSet = new DataSet();
            gridAdapter.Fill(dataSet);
            //GridView1.DataSource = dataSet;
            GridView1.DataBind();
        }

        public void displayImmunizationHeader()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            //retrieve at datagrid
            SqlCommand gridCommand = new SqlCommand("SELECT * FROM IMMUNIZATIONHEADERTABLE", con);
            SqlDataAdapter gridAdapter = new SqlDataAdapter(gridCommand);
            DataSet dataSet = new DataSet();
            gridAdapter.Fill(dataSet);
            //GridView1.DataSource = dataSet;
            GridView1.DataBind();
        }
    }
}