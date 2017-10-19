<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Reservations.aspx.cs" Inherits="Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT reservation.res_id, parking.parking_id, reservation.user_id, parking.spot_no, parking.car_id, parking.price_id, reservation.start_time, reservation.end_time, reservation.res_date FROM reservation INNER JOIN parking ON reservation.res_id = parking.res_id"></asp:SqlDataSource>

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Reservations</h2>
            <hr />
        </div>
    </div>
    <div class="container">

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="res_id,parking_id" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="res_id" HeaderText="res_id" InsertVisible="False" ReadOnly="True" SortExpression="res_id" />
                <asp:BoundField DataField="parking_id" HeaderText="parking_id" InsertVisible="False" ReadOnly="True" SortExpression="parking_id" />
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                <asp:BoundField DataField="spot_no" HeaderText="spot_no" SortExpression="spot_no" />
                <asp:BoundField DataField="car_id" HeaderText="car_id" SortExpression="car_id" />
                <asp:BoundField DataField="price_id" HeaderText="price_id" SortExpression="price_id" />
                <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
                <asp:BoundField DataField="res_date" HeaderText="res_date" SortExpression="res_date" />
            </Columns>
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>

    </div>
</asp:Content>

