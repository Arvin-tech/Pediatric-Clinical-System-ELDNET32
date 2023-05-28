using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace Pediatric
{
    public partial class Billing : System.Web.UI.Page
    {
        String connectionString = @"Data Source=sql.bsite.net\MSSQL2016;Persist Security Info=True;User ID=saguisa_eldnet;Password=Arvin5034#";
        public String username;
        public bool found;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
            displayLoggedInUserData(); //method call, display in label
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int consultPrice = 500;
            int immunizationPrice = 800;
            int totalAmount=0;
            int billCount = 0;

            SqlConnection billingCon = new SqlConnection(connectionString);
            //billing header file
            SqlDataAdapter adapter1 = new SqlDataAdapter("SELECT * FROM BILLINGHEADERFILE", connectionString);
            SqlCommandBuilder command = new SqlCommandBuilder(adapter1);
            DataSet ds = new DataSet();
            adapter1.MissingSchemaAction = MissingSchemaAction.AddWithKey; //set primary key
            adapter1.Fill(ds, "BILLINGHEADERFILE");       

            //prim key billing
            DataColumn[] primarykey = new DataColumn[1];
            primarykey[0] = ds.Tables["BILLINGHEADERFILE"].Columns["BILLHNO"];

            ds.Tables["BILLINGHEADERFILE"].PrimaryKey = primarykey;    
            //findrow
            DataRow row = ds.Tables["BILLINGHEADERFILE"].Rows.Find(BillingNoTextBox.Text);
            if(row == null)
            {                        
                //billing header file
                DataRow dr = ds.Tables["BILLINGHEADERFILE"].NewRow();
                dr["BILLHNO"] = BillingNoTextBox.Text;
                dr["BILLHPATCODE"] = PatientCodeTextBox.Text;

                DateTime inputDate = Convert.ToDateTime(DateTextBox.Text);
                DateTime todayDate = DateTime.Today;
                if(inputDate < todayDate)
                {
                    Response.Write("<script>alert('Invalid Date');</script>");
                    return;
                }
                else
                {
                    dr["BILLHDATE"] = DateTextBox.Text;
                }              
                             
                //service type
                if (ConsultationCheckBox.Checked == true && ImmunizationCheckBox.Checked == true)
                {
                    totalAmount = consultPrice + immunizationPrice;
                    TotalAmountLabel.Text = totalAmount.ToString();
                    dr["BILLHTOTAMT"] = TotalAmountLabel.Text;
                }
                else if (ConsultationCheckBox.Checked == true)
                {
                    totalAmount += consultPrice;
                    TotalAmountLabel.Text = totalAmount.ToString();
                    dr["BILLHTOTAMT"] = TotalAmountLabel.Text;
                }
                else if (ImmunizationCheckBox.Checked == true)
                {
                    totalAmount += immunizationPrice;
                    TotalAmountLabel.Text = totalAmount.ToString();
                    dr["BILLHTOTAMT"] = TotalAmountLabel.Text;
                }

                dr["BILLHPREPBY"] = PreparedByLabel.Text;
                dr["BILLHSTAT"] = "OP"; //OP and CL
                billCount += 1; //every billing
          
                ds.Tables["BILLINGHEADERFILE"].Rows.Add(dr);
                adapter1.Update(ds, "BILLINGHEADERFILE");
   
                Response.Write("<script> alert('Successfully Saved!');</script>");
                clearData();
            }
            else
            {
                Response.Write("<script> alert('Duplicate Entries!');</script>");
                BillingNoTextBox.Focus();
            }
          

        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            BillingNoTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            ImmunizationNoTextBox.Text = "";
            FirstNameLabel.Text = "";
            MiddleNameLabel.Text = "";
            LastNameLabel.Text = "";
            AgeLabel.Text = "";
        }
  

        public void displayLoggedInUserData()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM EMPLOYEEFILE WHERE EMPUSERNAME ='"+username+"'";

            SqlCommand searchCommand = new SqlCommand(sql, con);
            SqlDataReader searchReader = searchCommand.ExecuteReader();
        
            if (searchReader.Read()) //["EMPUSERNAME"].ToString() == username)
            {       
                PreparedByLabel.Text = searchReader["EMPLOYEECODE"].ToString()+ " " + searchReader["EMPFNAME"].ToString();  
            }
            con.Close();
            searchReader.Close();
        }

        public void clearData()
        {
            BillingNoTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            ImmunizationNoTextBox.Text = "";
            FirstNameLabel.Text = "";
            MiddleNameLabel.Text = "";
            LastNameLabel.Text = "";
            AgeLabel.Text = "";
            ConsultationCheckBox.Checked = false;
            ImmunizationCheckBox.Checked = false;
            TotalAmountLabel.Text = " ";

        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }

        public void displayData()
        {
            string con = ConfigurationManager.ConnectionStrings["ELDNETConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(con);
            sqlcon.Open();
            SqlCommand sqlcommand = new SqlCommand();
            string query = "SELECT * IMMDIMMUHNO, IMMDVAXCODE, IMMDDOSE FROM IMMUNIZATIONDETAILFILE WHERE IMMDIMMUHNO LIKE '%' + @IMMDIMMUHNO + '%'";
            sqlcommand.CommandText = query;
            sqlcommand.Connection = sqlcon;
            sqlcommand.Parameters.AddWithValue("IMMDIMMUHNO", ImmunizationNoTextBox.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcommand);
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void SearchPatient()
        {
            SqlConnection patientCon = new SqlConnection(connectionString);
            string sql = "SELECT * FROM PATIENTINFOFILE";
            patientCon.Open();

            SqlCommand patientCommand = new SqlCommand(sql, patientCon);
            patientCommand.CommandText = "SELECT * FROM PATIENTINFOFILE WHERE PATCODE = '" + PatientCodeTextBox.Text + "'";

            SqlDataReader searchReader = patientCommand.ExecuteReader();

            while (searchReader.Read())
            {
                if (searchReader["PATSTATUS"].ToString().Trim() == "IN")
                {
                    found = true;
                    Response.Write("<script> alert('Patient is already inactive!');</script>");
                    break;
                }
                if (searchReader["PATCODE"].ToString().Trim() == PatientCodeTextBox.Text.Trim() && searchReader["PATSTATUS"].ToString().Trim() == "AC")
                {
                    found = true;
                    FirstNameLabel.Text = searchReader["PATFNAME"].ToString();
                    MiddleNameLabel.Text = searchReader["PATMNAME"].ToString();
                    LastNameLabel.Text = searchReader["PATLNAME"].ToString();
                    AgeLabel.Text = searchReader["PATAGE"].ToString();

                }

            }
            if (found == false)
            {
                Response.Write("<script> alert('Patient Code not found!');</script>");
                PatientCodeTextBox.Text = " ";
            }
            //close objects
            patientCon.Close();
            searchReader.Close();
        }

        public void SearchBilling()
        {
            SqlConnection billingCon = new SqlConnection(connectionString);
            string sql = "SELECT * FROM BILLINGHEADERFILE WHERE BILLHNO = '" + BillingNoTextBox.Text + "'";

            SqlCommand command = new SqlCommand(sql, billingCon);
            billingCon.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                if (reader["BILLHNO"].ToString().Trim() == BillingNoTextBox.Text.Trim())
                {
                    found = true;
                    Response.Write("<script> alert('Billing Number already in the file');</script>");
                    BillingNoTextBox.Text = " ";
                    BillingNoTextBox.Focus();
                }               
            }
            if (found == false)
            {
                Response.Write("<script> alert('Billing number not yet found in the file. Please continue.');</script>");
                BillingNoTextBox.Focus();
            }
        }

        public void SearchImmunization()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "SELECT * FROM IMMUNIZATIONDETAILFILE";

            SqlCommand command = new SqlCommand(sql, con);
            command.CommandText = "SELECT * FROM IMMUNIZATIONDETAILFILE WHERE IMMDIMMUHNO = '" + ImmunizationNoTextBox.Text + "'";

            SqlDataReader searchReader = command.ExecuteReader();

            while (searchReader.Read())
            {
                if (searchReader["IMMDIMMUHNO"].ToString().Trim() == ImmunizationNoTextBox.Text.Trim())
                {
                    found = true;
                    displayData();
                }
            }
            if (found == false)
            {
                displayData();
            }
            //close objects
            con.Close();
            searchReader.Close();
        }

        protected void SearchBillingButton_Click(object sender, EventArgs e)
        {
            SearchBilling();
        }

        protected void SearchPatientButton_Click(object sender, EventArgs e)
        {
            SearchPatient();
        }
    }
}