<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserReservations.aspx.cs" Inherits="UserReservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT parking.parking_id, parking.spot_no, reservation.start_time, reservation.end_time, reservation.start_date, reservation.end_date, car.car_regno FROM parking INNER JOIN car ON parking.car_id = car.car_id INNER JOIN reservation ON parking.res_id = reservation.res_id WHERE (parking.user_id = @user_id)">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">My Reservations</h2>
            <hr />
        </div>
    </div>
    <div class="container">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="parking_id" DataSourceID="SqlDataSource1">
             <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />           
             <Columns>

                <asp:BoundField DataField="parking_id" HeaderText="parking_id" InsertVisible="False" ReadOnly="True" SortExpression="parking_id" />
                <asp:BoundField DataField="spot_no" HeaderText="spot_no" SortExpression="spot_no" />
                <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
                <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                 <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
                 <asp:BoundField DataField="car_regno" HeaderText="car_regno" SortExpression="car_regno" />
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

