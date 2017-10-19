using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowPrice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSourcePrice.InsertParameters["member_price"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtFMPrice")).Text;
        SqlDataSourcePrice.InsertParameters["org_price"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtOPrice")).Text;
        SqlDataSourcePrice.InsertParameters["min_price"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtMinPrice")).Text;
        SqlDataSourcePrice.InsertParameters["active"].DefaultValue =
            ((TextBox)GridView1.FooterRow.FindControl("txtActive")).Text;

        SqlDataSourcePrice.Insert();
    }

}