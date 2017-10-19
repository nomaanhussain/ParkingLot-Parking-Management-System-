using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        String userId;
        SqlDataSource1.InsertParameters["car_regno"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtRegNo")).Text;
        userId= Session["ID"].ToString();
        SqlDataSource1.InsertParameters["user_id"].DefaultValue = userId;

        SqlDataSource1.Insert();
    }

}