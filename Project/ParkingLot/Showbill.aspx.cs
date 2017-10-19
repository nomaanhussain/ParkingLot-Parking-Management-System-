using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Show_bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);

        connection.Open();
        SqlCommand cmda = new SqlCommand(" SELECT top 1 * FROM [parkinglot].[dbo].[reservation]  ORDER BY [res_id] DESC", connection);

        SqlDataAdapter sd = new SqlDataAdapter(cmda);
        DataTable dtable = new DataTable();
        sd.Fill(dtable);
        string bill;
        string res_id;
        string start_time;
        string end_time;
        string start_date;
        string end_date;
        string user_id;
        res_id = dtable.Rows[0][0].ToString().Trim();
        start_time = dtable.Rows[0][1].ToString().Trim();
        end_time = dtable.Rows[0][2].ToString().Trim();
        user_id = dtable.Rows[0][4].ToString().Trim();
        start_date = dtable.Rows[0][5].ToString().Trim();
        end_date = dtable.Rows[0][6].ToString().Trim();
        bill = dtable.Rows[0][7].ToString().Trim();
        connection.Close();

        connection.Open();
        cmda = new SqlCommand("SELECT [spot_no]  FROM [parkinglot].[dbo].[parking] WHERE [res_id] ='" + res_id + "'", connection);

        SqlDataAdapter sda = new SqlDataAdapter(cmda);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        string spot_no;
        spot_no = dt.Rows[0][0].ToString().Trim();
        connection.Close();


        connection.Open();
        cmda = new SqlCommand("SELECT [f_name]  FROM [parkinglot].[dbo].[user] WHERE [user_id] ='" + user_id + "'", connection);

        SqlDataAdapter sdap = new SqlDataAdapter(cmda);
        DataTable dtb = new DataTable();
        sdap.Fill(dtb);
        string f_name;
        f_name = dtb.Rows[0][0].ToString().Trim();
        connection.Close();


        BILL.Text = bill;
        RES_ID.Text = res_id;
        START_TIME.Text = start_time;
        END_TIME.Text = end_time;
        START_DATE.Text = start_date;
        END_DATE.Text = end_date;
        Customer_Name.Text = f_name;
        SPOT_NO.Text = spot_no;
    }
}