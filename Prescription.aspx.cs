using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Configuration;

namespace Pediatric
{
    public partial class Prescription1 : System.Web.UI.Page
    {
        SqlConnection connectionString = new SqlConnection(@"Data Source=sql.bsite.net\MSSQL2016; Persist Security Info=True;User ID = saguisa_eldnet; Password=Arvin5034#");
        public String username;
        bool found = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            username = (string)Session["username"];
            displayLoggedInUserData(); //method call, display in label
        }

        protected void SearchMedicineButton_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM VACCINEFILE";
            connectionString.Open();

            SqlCommand vaxCommand = new SqlCommand(sql, connectionString);
            vaxCommand.CommandText = "SELECT * FROM VACCINEFILE WHERE VAXCODE = '" + MedicineTextBox.Text + "'";

            SqlDataReader searchReader = vaxCommand.ExecuteReader();

            while (searchReader.Read())
            {
                if (searchReader["VAXCODE"].ToString().Trim() == MedicineTextBox.Text.Trim())
                {
                    found = true;
                    displayVaxData();
                }
            }
            if (found == false)
            {
                displayVaxData();
            }
            //close objects
            connectionString.Close();
            searchReader.Close();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            connectionString.Open();
            //prescription header file
            SqlDataAdapter adapter1 = new SqlDataAdapter("SELECT * FROM PRESCRIPTIONHEADERFILE", connectionString);
            SqlCommandBuilder command = new SqlCommandBuilder(adapter1);
            DataSet ds = new DataSet();
            adapter1.MissingSchemaAction = MissingSchemaAction.AddWithKey; //set primary key
            adapter1.Fill(ds, "PRESCRIPTIONHEADERFILE");

            //prescription detail file
            SqlDataAdapter adapter2 = new SqlDataAdapter("SELECT * FROM PRESCRIPTIONDETAILFILE", connectionString);
            SqlCommandBuilder command2 = new SqlCommandBuilder(adapter2);
            DataSet ds2 = new DataSet();
            adapter2.Fill(ds2, "PRESCRIPTIONDETAILFILE");

            //prim key prescription
            DataColumn[] primarykey = new DataColumn[1];
            primarykey[0] = ds.Tables["PRESCRIPTIONHEADERFILE"].Columns["PRESHCODE"];

            ds.Tables["PRESCRIPTIONHEADERFILE"].PrimaryKey = primarykey;
            DataRow row = ds.Tables["PRESCRIPTIONHEADERFILE"].Rows.Find(PrescriptionTextBox.Text);
            if (row == null)
            {
                //prescription header file
                DataRow dr = ds.Tables["PRESCRIPTIONHEADERFILE"].NewRow();
                dr["PRESHCODE"] = PrescriptionTextBox.Text;                            
                dr["PRESHCONSNO"] = ConsultationTextBox.Text;                                      
                dr["PRESHPATCODE"] = PatientCodeTextBox.Text;
                dr["PRESHDATE"] = DateTextBox.Text;            
                dr["PRESHPREPBY"] = PreparedByLabel.Text;
                dr["PRESHSTATUS"] = "AC";

                //prescription detail file
                DataRow dr2 = ds2.Tables["PRESCRIPTIONDETAILFILE"].NewRow();          
                SqlCommand detailcommand = connectionString.CreateCommand();
                dr2["PREDCODE"] = PrescriptionTextBox.Text;
                dr2["PREDMEDCODE"] = MedicineTextBox.Text;
                dr2["PREDQTY"] = QuantityTextBox.Text;
                dr2["PREDREMARKS"] = RemarksTextBox.Text;
                dr2["PREDSTATUS"] = "AC";

                //rows add
                ds.Tables["PRESCRIPTIONHEADERFILE"].Rows.Add(dr);
                ds2.Tables["PRESCRIPTIONDETAILFILE"].Rows.Add(dr2);
                adapter1.Update(ds, "PRESCRIPTIONHEADERFILE");
                adapter2.Update(ds2, "PRESCRIPTIONDETAILFILE");

                connectionString.Close();
                clearData();
                Response.Write("<script> alert('Entries Recorded!');</script>");
            }
            else
            {
                Response.Write("<script> alert('Duplicate Entries!');</script>");
            }
              
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            PrescriptionTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            ConsultationTextBox.Text = "";
            MedicineTextBox.Text = "";
            QuantityTextBox.Text = "";
            RemarksTextBox.Text = "";
            NameLabel.Text = "";
            AgeLabel.Text = "";
        }

        public void displayVaxData()
        {
            string con = ConfigurationManager.ConnectionStrings["ELDNETConnectionString"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(con);
            sqlcon.Open();
            SqlCommand sqlcommand = new SqlCommand();
            string query = "SELECT * FROM VACCINEFILE WHERE VAXCODE LIKE '%' + @VAXCODE + '%'";
            sqlcommand.CommandText = query;
            sqlcommand.Connection = sqlcon;
            sqlcommand.Parameters.AddWithValue("VAXCODE", MedicineTextBox.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcommand);
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void displayLoggedInUserData()
        {

            connectionString.Open();
            string sql = "SELECT * FROM EMPLOYEEFILE WHERE EMPUSERNAME ='" + username + "'";

            SqlCommand searchCommand = new SqlCommand(sql, connectionString);
            SqlDataReader searchReader = searchCommand.ExecuteReader();

            if (searchReader.Read()) //["EMPUSERNAME"].ToString() == username)
            {
                PreparedByLabel.Text = searchReader["EMPLOYEECODE"].ToString(); // + " " + searchReader["EMPFNAME"].ToString();             
            }
            connectionString.Close();
            searchReader.Close();
        }

        public void clearData()
        {
            PrescriptionTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            ConsultationTextBox.Text = "";
            MedicineTextBox.Text = "";
            QuantityTextBox.Text = "";
            RemarksTextBox.Text = "";
            NameLabel.Text = "";
            AgeLabel.Text = "";
            GridView1.Visible = false;
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }

        public void SearchPrescription()
        {
            bool found = false;
            string sql = "SELECT * FROM PRESCRIPTIONHEADERFILE WHERE PRESHCODE = '" + PrescriptionTextBox.Text + "'";

            SqlCommand thisCommand = new SqlCommand(sql, connectionString);
            connectionString.Open();

            SqlDataReader thisReader = thisCommand.ExecuteReader();
            while (thisReader.Read())
            {
                if (thisReader["PRESHCODE"].ToString().Trim() == PrescriptionTextBox.Text.Trim())
                {
                    found = true;
                    Response.Write("<script> alert('Immunization Number Already Exist!');</script>");
                    PrescriptionTextBox.Text = "";
                    PrescriptionTextBox.Focus();
                }
            }
            if(found == false)
            {
                Response.Write("<script> alert('Prescription number not yet found in the file. Please continue.');</script>");
                PrescriptionTextBox.Focus();
            }
        }

        public void SearchPatient()
        {
            connectionString.Open();
            string sql = "SELECT * FROM PATIENTINFOFILE";

            SqlCommand patientCommand = new SqlCommand(sql, connectionString);
            patientCommand.CommandText = "SELECT * FROM PATIENTINFOFILE WHERE PATCODE = '" + PatientCodeTextBox.Text + "'";

            SqlDataReader searchReader = patientCommand.ExecuteReader();

            while (searchReader.Read())
            {
                if (searchReader["PATSTATUS"].ToString().Trim() == "IN")
                {
                    Response.Write("<script> alert('Patient is already inactive!');</script>");
                    found = true;
                    break;
                }
                if (searchReader["PATCODE"].ToString().Trim() == PatientCodeTextBox.Text.Trim() && searchReader["PATSTATUS"].ToString().Trim() == "AC")
                {
                    found = true;
                    NameLabel.Text = searchReader["PATFNAME"].ToString() + searchReader["PATLNAME"].ToString();
                    AgeLabel.Text = searchReader["PATAGE"].ToString();

                }
            }
            if (found == false)
            {
                Response.Write("<script> alert('Patient Code not found!');</script>");
                PatientCodeTextBox.Text = " ";
            }
            //close objects
            connectionString.Close();
            searchReader.Close();
        }

        protected void SearchPrescriptionButton_Click(object sender, EventArgs e)
        {
            SearchPrescription();
        }

        protected void SearchPatientButton_Click(object sender, EventArgs e)
        {
            SearchPatient();
        }
    }
}