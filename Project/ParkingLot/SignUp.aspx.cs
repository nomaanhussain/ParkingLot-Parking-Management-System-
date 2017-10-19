using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class SignUp : System.Web.UI.Page
{
    Int32 temp;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        temp = 0;
        if (IsPostBack)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
            conn.Open();
            String checkUser = "SELECT count(*) FROM [parkinglot].[dbo].[user] WHERE [email] ='" + tbEmail.Text + "'";
            SqlCommand con = new SqlCommand(checkUser, conn);
            temp = Convert.ToInt32(con.ExecuteScalar().ToString());
            conn.Close();
        }

    }

    protected void btSignup_Click(object sender, EventArgs e)
    {
        if (tbFname.Text != "" & tbLname.Text != "" && tbEmail.Text != "" && tbPass.Text != "" && tbCPass.Text != "")
        {
            if (tbPass.Text == tbCPass.Text)
            {
                 if (temp == 0)
                 {
             
            
                     try
            
                     {
                         String Date = DateTime.Now.ToString("dd/MM/yyyy");

                      SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                    conn.Open();
                    String insertQuery = "INSERT INTO [dbo].[user] ([f_name],[l_name],[email],[password],[last_login]) values (@Fname,@Lname,@Email,@Password,@LastLogin)";
                    SqlCommand con = new SqlCommand(insertQuery, conn);
                    con.Parameters.AddWithValue("@Fname", tbFname.Text);
                    con.Parameters.AddWithValue("@Lname", tbLname.Text);
                    con.Parameters.AddWithValue("@Email", tbEmail.Text);
                    con.Parameters.AddWithValue("@Password", tbPass.Text);
                    con.Parameters.AddWithValue("@LastLogin", Date);
                    con.ExecuteNonQuery();

                    // Response.Redirect("ShowUser.aspx");
                     Response.Write("Registration is successful");
                     Response.Redirect("SignIn.aspx");
                     conn.Close();
                     }
                   catch (Exception ex)
                     {
                     Response.Write("Error:" + ex.ToString());
                    }
                 }
                 else
                 {
                     lblMsg.Text = "Email already registered";
                   
                 }
    
           }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";

        }

    }



  
}