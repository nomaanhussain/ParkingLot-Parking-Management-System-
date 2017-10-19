using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSourceUser.InsertParameters["f_name"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtFName")).Text;
        SqlDataSourceUser.InsertParameters["l_name"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtLName")).Text;
        SqlDataSourceUser.InsertParameters["email"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text;
        SqlDataSourceUser.InsertParameters["password"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtPass")).Text;
        SqlDataSourceUser.InsertParameters["last_login"].DefaultValue = "01/ 01/16";

        SqlDataSourceUser.Insert();
    }

}