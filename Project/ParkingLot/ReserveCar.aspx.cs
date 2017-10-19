using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Globalization;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text;


public partial class ReserveCar : System.Web.UI.Page
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
            conn.Open();
            String insertQuery1 = " SELECT [SpotNo] FROM [parkinglot].[dbo].[spot]";
            SqlCommand con = new SqlCommand(insertQuery1, conn);
            SpotNo.DataTextField = "SpotNo";
            // SpotNo.DataValueField = "SpotNo";
            SpotNo.DataSource = con.ExecuteReader();
            SpotNo.DataBind();
            conn.Close();

            String userId = Session["ID"].ToString();
            String insertQuery2 = " SELECT [car_regno] FROM [parkinglot].[dbo].[car] WHERE [user_id] ='" + userId + "'";
            conn.Open();
            con = new SqlCommand(insertQuery2, conn);
            CarRegNo.DataTextField = "car_regno";
            CarRegNo.DataSource = con.ExecuteReader();
            CarRegNo.DataBind();
            conn.Close();


        

        }
    }

    protected void btReserve_Click(object sender, EventArgs e)
    {
        Int32 t = 0;
        lblMsg.Text = " ";
        if (StartTime.Text != "" && EndTime.Text != "" && StartDate.Text != "" && EndDate.Text != "" && SpotNo.Text != "")
        {

            try
            {

                String a = StartTime.Text;
                String b = EndTime.Text;
                String c = StartDate.Text;
                String d = EndDate.Text;


                DateTime starttime = DateTime.Parse(a);
                String stringStartTime = starttime.ToString("HH:mm");

                DateTime endtime = DateTime.Parse(b);
                String stringEndTime = endtime.ToString("HH:mm");

                DateTime startdate = DateTime.Parse(c);
                String stringStartDate = startdate.ToString("dd/MM/yyyy");

                DateTime enddate = DateTime.Parse(d);
                String stringEndDate = enddate.ToString("dd/MM/yyyy");

                int cmp1 = DateTime.Compare(startdate, enddate);
                int cmp2 = DateTime.Compare(starttime, endtime);
                string relationship = "abc";
                int result;
               

                 if (cmp1 < 0)
                 {
                     result = 1;
                 }

                 else if (cmp1 == 0)
                     result = compare(cmp2);
                 else
                     result = 0;
                    


               // Double totalMin = (endtime - starttime).TotalMinutes;
                //Double totalHr = (endtime - starttime).TotalHours;
                Double totalDays = (enddate - startdate).TotalHours;
                Double totalHr = (endtime - starttime).TotalHours;
                Double totalTime = totalDays + totalHr;
               // Response.Write(totalDays);
              ;


                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);

                connection.Open();
                SqlCommand cmda = new SqlCommand(" SELECT [member_price],[price_id] FROM [parkinglot].[dbo].[price_plan] WHERE [active] ='1'", connection);

                SqlDataAdapter sd = new SqlDataAdapter(cmda);
                DataTable dtable = new DataTable();
                sd.Fill(dtable);
                string price;
                price = dtable.Rows[0][0].ToString().Trim();
                string price_id;
                price_id = dtable.Rows[0][1].ToString().Trim();
                connection.Close();
                int x = Convert.ToInt32(price); 
                Double bill = x * totalTime;

                



                if (result==0)
                {
                    lblMsg.ForeColor = Color.Red;

                    lblMsg.Text = "Choose correct start and end date";
                    

                }
                else
                {
                    String spotNoSelected = SpotNo.SelectedItem.ToString();
                    String regNoSelected = CarRegNo.SelectedItem.ToString();
                    
                    lblMsg.Text = "";
                    int xyz;
                    xyz = 0;
                    int abc = 0;



                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                    using (conn)
                    {
                        conn.Open();
                        String insertQuery = "SELECT [res_id] FROM [parkinglot].[dbo].[parking] WHERE [spot_no] ='" + spotNoSelected + "'";
                        SqlCommand con = new SqlCommand(insertQuery, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(con);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        conn.Close();


                        foreach (DataRow row in dt.Rows)
                        {

                            xyz = 1;
                            String res_id = row["res_id"].ToString();


                          //  String checkSlot = "SELECT * FROM [parkinglot].[dbo].[reservation] WHERE [res_id] ='" + res_id + "' and (([start_time]<='" + stringStartDate + "'  and end_time >='" + stringStartDate + "') or (start_time <='" + stringEndDate + "' and end_time >='" + stringEndDate + "'))";
                          //  String checkSlot = "SELECT * FROM [parkinglot].[dbo].[reservation] WHERE [res_id] ='" + res_id + "' and (([start_date]<='" + stringStartDate + "'  and end_date >='" + stringStartDate + "') or (start_date <='" + stringEndDate + "' and end_date >='" + stringEndDate + "')) and (([start_time]<='" + stringStartTime + "'  and end_time >='" + stringStartTime + "') or (start_time <='" + stringEndTime + "' and end_time >='" + stringEndTime + "'))";
                            String checkSlot = "SELECT * FROM [parkinglot].[dbo].[reservation] WHERE [res_id] ='" + res_id + "' and ((([start_date]<='" + stringStartDate + "'  and [end_date] >='" + stringStartDate + "') or ([start_date] <='" + stringEndDate + "' and [end_date] >='" + stringEndDate + "')) and (([start_time]<='" + stringStartTime + "'  and end_time >='" + stringStartTime + "') or ([start_time] <='" + stringEndTime + "' and [end_time] >='" + stringEndTime + "')))";
                            SqlCommand cmd = new SqlCommand(checkSlot, conn);
                            conn.Open();
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.HasRows)
                            {
                                lblMsg.Text = "Spot not available for above time and date ";
                                goto reserve_not_available;

                            }
                            else
                            {
                                lblMsg.Text = "Spot available for above time and date ";
                                abc = 1;
                            }
                            conn.Close();
                        }
                        if (xyz == 0)
                        {
                            abc = 1;
                            lblMsg.Text = "Spot available for above time and date ";

                        }
                        conn.Close();


                    }
                    if (abc == 1)
                    {

                        String Date = DateTime.Now.ToString("dd/MM/yyyy");


                        String userId = Session["ID"].ToString();
                        SqlConnection connec = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                        connec.Open();
                        String insertQueryResv = "INSERT INTO [dbo].[reservation] ([start_time],[end_time],[start_date],[end_date],[res_date],[user_id],[bill]) values (@start_time,@end_time,@start_date,@end_date,@res_time,@user_id,@bill)";
                        SqlCommand con = new SqlCommand(insertQueryResv, connec);
                        con.Parameters.AddWithValue("@start_time", stringStartTime);
                        con.Parameters.AddWithValue("@end_time", stringEndTime);
                        con.Parameters.AddWithValue("@start_date", stringStartDate);
                        con.Parameters.AddWithValue("@end_date", stringEndDate);
                        con.Parameters.AddWithValue("@res_time", Date);
                        con.Parameters.AddWithValue("@user_id", userId);
                        con.Parameters.AddWithValue("@bill", bill);
                        con.ExecuteNonQuery();
                        connec.Close();




                        connec.Open();
                        SqlCommand cdm = new SqlCommand(" SELECT [car_id] FROM [parkinglot].[dbo].[car] WHERE [car_regno] ='" + regNoSelected + "'", connec);

                        SqlDataAdapter sda = new SqlDataAdapter(cdm);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        string CID;
                        CID = dt.Rows[0][0].ToString().Trim();
                        connec.Close();


                        connec.Open();
                        cdm = new SqlCommand(" SELECT TOP 1 [res_id] FROM [parkinglot].[dbo].[reservation] ORDER BY [res_id] DESC", connec);

                        sda = new SqlDataAdapter(cdm);
                        dt = new DataTable();
                        sda.Fill(dt);
                        string RID;
                        RID = dt.Rows[0][0].ToString().Trim();
                        connec.Close();


                        connec.Open();
                        String insertQueryPark = "INSERT INTO [dbo].[parking] ([user_id],[res_id],[price_id],[car_id],[spot_no]) values (@user_id,@res_id,@price_id,@car_id,@spot_no)";
                        con = new SqlCommand(insertQueryPark, connec);
                        con.Parameters.AddWithValue("@user_id", userId);
                        con.Parameters.AddWithValue("@res_id", RID);
                        con.Parameters.AddWithValue("@price_id", price_id);
                        con.Parameters.AddWithValue("@car_id", CID);
                        con.Parameters.AddWithValue("@spot_no", spotNoSelected);
                        con.ExecuteNonQuery();
                        connec.Close();




                        connec.Open();
                        String insertQuerySpot = "UPDATE [dbo].[spot] set [Status]='r' where [SpotNo]='" + spotNoSelected + "'";
                        con = new SqlCommand(insertQuerySpot, connec);
                        con.ExecuteNonQuery();
                        connec.Close();
                        

                        connec.Open();
                        SqlCommand sqlcdm = new SqlCommand(" SELECT [email] FROM [parkinglot].[dbo].[user] WHERE [user_id] ='" + userId + "'", connec);

                        SqlDataAdapter sqlda = new SqlDataAdapter(sqlcdm);
                        DataTable dtb = new DataTable();
                        sqlda.Fill(dtb);
                        string UEmail;
                        UEmail = dt.Rows[0][0].ToString().Trim();
                        connec.Close();


                        String ToEmailAddress = "nomanghanchi_11@yahoo.com";
                      //  String EmailBody = "Hi ,<br/><br/> Click the link below to reset your password <br/><br/> http://localhost:22939/RecoverPassword.aspx?Uid=";
                        MailMessage PassRecMail = new MailMessage("nomanghanchi11@gmail.com", ToEmailAddress);
                        String EmailBody = "Hello Sir ,<br/><br/>ThankYou for registering..<br/><br/>Your bill for reservation Id " + RID + " is " + bill + " ";
                        //MailMessage PassRecMail = new MailMessage("nomanghanchi11@gmail.com", ToEmailAddress);
                        PassRecMail.Body = EmailBody;
                        PassRecMail.IsBodyHtml = true;
                        PassRecMail.Subject = "Reservation Bill";

                        //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                        SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                        SMTP.Credentials = new NetworkCredential()
                        {
                            UserName = "nomanghanchi11@gmail.com",
                            Password = "11m31995"
                        };
                        SMTP.EnableSsl = true;
                        SMTP.Send(PassRecMail);

                        Response.Redirect("Showbill.aspx");
                    }

                }
            invalid_date_time:
            reserve_not_available:
                int temp = 0;

            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }



        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";

        }
    }


    int compare(int cmp2)
    {
        int result;
        if (cmp2 < 0)
            return 1;
        else if (cmp2 == 0)
            return 0;
        else
            return 0;

        

    }



}
