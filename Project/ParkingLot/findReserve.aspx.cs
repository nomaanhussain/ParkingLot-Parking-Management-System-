using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class findReserve : System.Web.UI.Page
{
    Int32 temp;
    protected void Page_Load(object sender, EventArgs e)
    {
        temp = 0;
        lblMsg.Text = "";
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        
        String a = TextBox1.Text;
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
        using (conn)
        {
        conn.Open();
        String insertQuery = "SELECT [res_id] FROM [parkinglot].[dbo].[parking] WHERE [spot_no] ='" + a + "'";
        SqlCommand con = new SqlCommand(insertQuery, conn);
        SqlDataAdapter sda = new SqlDataAdapter(con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        conn.Close();
        temp = 0;
        int xyz;
            xyz=0;
        foreach (DataRow row in dt.Rows)
        {
            String b = row["res_id"].ToString();

            xyz = 1;
            String checkSlot = "SELECT * FROM [parkinglot].[dbo].[reservation] WHERE [res_id] ='" + b + "' and (([start_time]<='3/4/2018'  and end_time >='3/4/2018') or (start_time <='5/4/2018' and end_time >='5/4/2018'))";
            SqlCommand cmd = new SqlCommand(checkSlot, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
               // lblMsg.ForeColor = Color.Red;
                //lblMsg.Text = "Spot not available for above time and date ";
                temp++;
                lblMsg.Text = "Spot not available for above time and date ";
                goto reserve_not_available;
            }
            else
            {
               
                lblMsg.Text = "Spot available for above time and date ";
            }
            conn.Close();
        }
        if (xyz == 0)
        {
            lblMsg.Text = "Spot available for above time and date ";

        }
       
    reserve_not_available:
        int t = 0;
        conn.Close();
           
        }
        

    }
}





















