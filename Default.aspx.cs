using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

namespace Sports_Day_Website
{
    public partial class Default : System.Web.UI.Page
    {
        public enum MessageType { Success, Warning, Error, Info };

        protected void ShowMessage(string uMsg, MessageType mtType)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                System.Guid.NewGuid().ToString(), "showAlert('" + uMsg + "', '" + mtType + "');", true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            setupScreen();

            var connString = WebConfigurationManager.ConnectionStrings["MyDB"];

            SqlConnection conn = new SqlConnection(connString.ConnectionString);
            try
            {
                conn.Open();
                lblConnection.Text = "Connected Successfully...";
            }
            catch (SqlException ex)
            {
                lblConnection.Text = "Connection Failed";
            }
        }


        private void saveDataToDB()
        {
            string query = "INSERT INTO STUDENTS (first_nm, last_nm, gender, email_addr, house_nm)";
            query += "VALUES (@first_nm, @last_nm, @gender, @email_addr, @house_nm)";

            var connString = WebConfigurationManager.ConnectionStrings["MyDB"];
            SqlConnection conn = new SqlConnection(connString.ConnectionString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);

                Boolean doesItExist = recordExists(txtEmail.Text);
                lblResults.Text += "<br />" + doesItExist;
                if (doesItExist == false)
                {
                    string genMF = "Male";
                    if (radFemale.Checked == true)
                    {
                        genMF = "Female";
                    }


                    string[] houses = { "Mahogany", "Spanish Elm", "Blue Mohoe" };


                    Random randHouse = new Random();

                    //Generate a random index less than the size of the array
                    int index = randHouse.Next(houses.Length);
                    string chosenHouses = houses[index];

                    
                    cmd.Parameters.AddWithValue("@first_nm", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@last_nm", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@email_addr", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@gender", genMF);
                    cmd.Parameters.AddWithValue("@house_nm", chosenHouses);

                    cmd.ExecuteNonQuery();

                    //Show Message if successfully saved record
                    ShowMessage($"Record successfully saved to database. You have been assigned to {chosenHouses} house", MessageType.Success);
                }
                else
                {
                    //Show Message if failed to save record
                    ShowMessage("Record already exists!", MessageType.Error);
                }
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }

        private Boolean recordExists(string uEmail)
        {
            Boolean blnRetVal = false;
            string query = "SELECT COUNT(first_nm) FROM STUDENTS WHERE email_addr = @email";
            var connString = WebConfigurationManager.ConnectionStrings["MyDB"];
            SqlConnection conn = new SqlConnection(connString.ConnectionString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@email", uEmail);

                int studentExist = (int) cmd.ExecuteScalar();
                if (studentExist > 0)
                {
                    blnRetVal = true;
                }
            }
            catch (SqlException ex)
            {
                blnRetVal = false;
            }
            return blnRetVal;
        }

        private void setupScreen()
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                txtFirstName.Attributes.Add("Placeholder", "Enter your first name");
                txtLastName.Attributes.Add("Placeholder", "Enter your last name");
                txtEmail.Attributes.Add("Placeholder", "Enter your email address");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            saveDataToDB();
        }
    }
}