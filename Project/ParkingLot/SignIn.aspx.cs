using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    Int32 temp;
    protected void Page_Load(object sender, EventArgs e)
    {
        temp = 0;
        if (!IsPostBack)
        {
            if (Request.Cookies["Email"] != null && Request.Cookies["PWD"] != null)
            {
                UserName.Text = Request.Cookies["Email"].Value;
                Password.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
      
        using (con)
        {
           

            String checkUser = "SELECT count(*) FROM [parkinglot].[dbo].[user] WHERE [email] ='" + UserName.Text + "' and [password] ='" + Password.Text + "'";
            SqlCommand cmd = new SqlCommand(checkUser, con);
            con.Open();
            temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
           // SqlDataAdapter sda = new SqlDataAdapter(cmd);
           // DataTable dt = new DataTable();
           // sda.Fill(dt);
            if (temp!= 0)
            {
                
                if (CheckBox1.Checked)
                {
                    Response.Cookies["Email"].Value = UserName.Text;
                    Response.Cookies["PWD"].Value = Password.Text;

                    Response.Cookies["Email"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                }


                SqlCommand cdm = new SqlCommand(" SELECT [user_id],[f_name] FROM [parkinglot].[dbo].[user] WHERE [email] ='" + UserName.Text + "'", con);
                
                SqlDataAdapter sda = new SqlDataAdapter(cdm);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                string UID;
                UID = dt.Rows[0][0].ToString().Trim();
                string UName;
                UName = dt.Rows[0][1].ToString().Trim();


                Session["ID"] = UID;
                Session["USERNAME"] = UName;

                if (UserName.Text == "Admin@gmail.com")
                {
                    Response.Redirect("~/AdminHome.aspx");
                }

                Response.Redirect("~/UserHome.aspx");
            }
            else
            {
                lblError.Text = "Invalid Username or Password !";
            }
        }

        con.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
    
}