<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ShowPriceUser.aspx.cs" Inherits="ShowPriceUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT [price_id], [member_price], [org_price] FROM [price_plan]"></asp:SqlDataSource>

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Price Plans</h2>
            <hr />
        </div>
    </div>
    <div class="container">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True"  HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="price_id" DataSourceID="SqlDataSource1">
            <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="price_id" HeaderText="price_id" InsertVisible="False" ReadOnly="True" SortExpression="price_id" />
                <asp:BoundField DataField="member_price" HeaderText="member_price" SortExpression="member_price" />
                <asp:BoundField DataField="org_price" HeaderText="org_price" SortExpression="org_price" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </div>
</asp:Content>




