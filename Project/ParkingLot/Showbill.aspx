<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Showbill.aspx.cs" Inherits="Show_bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">RECEIPT</h2>
            <hr />
        </div>
    </div>

    <div class="container">
        <div class="table-responsive" style="width: 75%">
            <table class="table">
                <tr>
                    <td class="col-md-4">Customer Name</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="Customer_Name" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">RES ID</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="RES_ID" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">SPOT NO</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="SPOT_NO" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">START DATE</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="START_DATE" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">END DATE</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="END_DATE" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">START TIME</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="START_TIME" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4">END TIME</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="END_TIME" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                 <tr>
                    <td class="col-md-4">BILL</td>
                    <td class="col-md-8" style="text-align: right;">
                        <asp:Label ID="BILL" runat="server" Text="Label" Font-Bold="true"></asp:Label></td>
                </tr>
                <tr>
                    <td class="col-md-4" style="font-weight: bold">Signature</td>
                    <td class="col-md-8" style="text-align: right;">__________</td>
                </tr>
            </table>
            <div class="col-xs-4 space-vert">
                    <asp:Button ID="btPrint" runat="server" Class="btn btn-success" Text="PRINT"/>
                    
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    
                </div>
        </div>
    </div>
</asp:Content>

