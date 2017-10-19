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

public partial class Park : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btPark_Click(object sender, EventArgs e)
    {
        REG_NO2.Text = "";
         lblMsg1.Text = " ";
         lblMsg2.Text = " ";
        if (REG_NO1.Text != "")
        {

            try
            {
               String a =REG_NO1.Text;
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);

                connection.Open();
                SqlCommand cmda = new SqlCommand("SELECT [car_id] FROM [parkinglot].[dbo].[car] WHERE [car_regno] ='" + a + "'", connection);

                SqlDataAdapter sd = new SqlDataAdapter(cmda);
                DataTable dtable = new DataTable();
                sd.Fill(dtable);
                string CID;
                if (dtable.Rows.Count > 0)
                {
                    CID = dtable.Rows[0][0].ToString().Trim();
                    connection.Close();

                    connection.Open();
                    cmda = new SqlCommand(" SELECT TOP 1 [spot_no] FROM [parkinglot].[dbo].[parking] WHERE [car_id]='" + CID + "' ORDER BY [res_id] DESC", connection);

                    sd = new SqlDataAdapter(cmda);
                    dtable = new DataTable();
                    sd.Fill(dtable);
                    string SpotNo;
                    if (dtable.Rows.Count > 0)
                {
                    SpotNo = dtable.Rows[0][0].ToString().Trim();
                    connection.Close();


                    connection.Open();
                    cmda = new SqlCommand(" UPDATE [dbo].[spot] set [Status]='f' where [SpotNo]='" + SpotNo + "'", connection);

                    cmda.ExecuteNonQuery();

                    connection.Close();
                }

                    else
                    {
                        lblMsg1.ForeColor = Color.Red;
                        lblMsg1.Text = "Reservation not found";
                    }
                }
                else
                {
                    lblMsg1.ForeColor = Color.Red;
                    lblMsg1.Text = "REG NO not found";
                }

            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }



        }
        else
        {
            lblMsg1.ForeColor = Color.Red;
            lblMsg1.Text = "REG NO is Mandatory";

        }

    }
    protected void btExit_Click(object sender, EventArgs e)
    {
        REG_NO1.Text = "";
        lblMsg1.Text = " ";
        lblMsg2.Text = " ";
        if (REG_NO2.Text != "")
        {

            try
            {
                String a = REG_NO2.Text;
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);

                connection.Open();
                SqlCommand cmda = new SqlCommand("SELECT [car_id] FROM [parkinglot].[dbo].[car] WHERE [car_regno] ='" + a + "'", connection);

                SqlDataAdapter sd = new SqlDataAdapter(cmda);
                DataTable dtable = new DataTable();
                sd.Fill(dtable);
                string CID;
                if (dtable.Rows.Count > 0)
                {
                CID = dtable.Rows[0][0].ToString().Trim();
                connection.Close();
               
                connection.Open();
                cmda = new SqlCommand(" SELECT TOP 1 [spot_no] FROM [parkinglot].[dbo].[parking] WHERE [car_id]='" + CID + "' ORDER BY [res_id] DESC", connection);

                sd = new SqlDataAdapter(cmda);
                dtable = new DataTable();
                sd.Fill(dtable);
                string SpotNo;
                if (dtable.Rows.Count > 0)
                {
                SpotNo = dtable.Rows[0][0].ToString().Trim();
                connection.Close();


                connection.Open();
                cmda = new SqlCommand(" UPDATE [dbo].[spot] set [Status]='e' where [SpotNo]='" + SpotNo + "'", connection);

                cmda.ExecuteNonQuery();

                connection.Close();
                }

                else
                {
                    lblMsg2.ForeColor = Color.Red;
                    lblMsg2.Text = "Reservation not found";
                }

                }

                else
                {
                    lblMsg2.ForeColor = Color.Red;
                    lblMsg2.Text = "REG NO not found";
                }

            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }



        }
        else
        {
            lblMsg2.ForeColor = Color.Red;
            lblMsg2.Text = "REG NO is Mandatory";

        }

    }
}