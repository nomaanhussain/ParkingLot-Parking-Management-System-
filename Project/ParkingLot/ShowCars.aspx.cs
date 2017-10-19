using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowCars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSourceCar.InsertParameters["car_regno"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtRegNo")).Text;
        SqlDataSourceCar.InsertParameters["date_added"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtDate")).Text;
        SqlDataSourceCar.InsertParameters["user_id"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtUserId")).Text;

        SqlDataSourceCar.Insert();
    }

}