using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class AvailableSpots : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = 0;

        String CS = ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString;


        var labels = new List<Label> { Label1, Label2, Label3, Label4, Label5, Label6, Label7, Label8, Label9, Label10 ,
                                       Label11, Label12, Label13, Label14, Label15, Label16, Label17, Label18, Label19, Label20 ,
                                        Label21, Label22, Label23, Label24, Label25, Label26, Label27, Label28, Label29, Label30 ,
                                        Label31, Label32, Label33, Label34, Label35, Label36, Label37, Label38, Label39, Label40 ,
                                        Label41, Label42, Label43, Label44, Label45, Label46, Label47, Label48, Label49, Label50 ,
                                        Label51, Label52, Label53, Label54, Label55, Label56, Label57, Label58, Label59, Label60 ,
                                        Label61, Label62, Label63, Label64, Label65, Label66, Label67, Label68, Label69, Label70 ,
                                        Label71, Label72, Label73, Label74, Label75, Label76, Label77, Label78, Label79, Label80 ,
                                        Label81, Label82, Label83, Label84, Label85, Label86, Label87, Label88, Label89, Label90 ,
                                        Label91, Label92, Label93, Label94, Label95, Label96, Label97, Label98, Label99, Label100 
                                        };

        foreach (var label in labels)
        {
                
            i++;
           
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand(" SELECT [Status] FROM [parkinglot].[dbo].[spot] Where [SpotNo] ='" + i + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                string Utype;
                Utype = dt.Rows[0][0].ToString().Trim();

                

                if (Utype == "r")
                {
                    label.Attributes.Add("style", "background-color:Yellow;");
                }
                else if (Utype == "e")
                {
                    label.Attributes.Add("style", "background-color:Green;");
                }
                else
                {
                    label.Attributes.Add("style", "background-color:Red;");

                }
                con.Close();
          }
           

        
    }

}