<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ReserveCar.aspx.cs" Inherits="ReserveCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Reservation</h2>
           
            <hr />


            <div  class="container">


                <label class="col-xs-3">Start Time</label>
                <div class="col-xs-3">
                    <span>
                        <asp:TextBox ID="StartTime" runat="server" Class="form-control" placeholder="StartTime" TextMode="Time"></asp:TextBox>
                    </span>
                </div>
                

                <label class="col-xs-3">End Time</label>
                <div class="col-xs-3">
                    <asp:TextBox ID="EndTime" runat="server" Class="form-control" placeholder="End Time" TextMode="Time"></asp:TextBox>
                </div>

                <label class="col-xs-3">Start Date</label>
                <div class="col-xs-3">
                    <asp:TextBox ID="StartDate" runat="server" Class="form-control" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                </div>

                <label class="col-xs-3">End Date</label>
                <div class="col-xs-3">
                    <asp:TextBox ID="EndDate" runat="server" Class="form-control" placeholder="End Date" TextMode="Date"></asp:TextBox>
                </div>

                <label class="col-xs-3">Spot No</label>
                <div class="col-xs-3">
                    <asp:DropDownList ID="SpotNo"  Class="form-control" placeholder="Spot No" runat="server">
                        <asp:ListItem Selected="True">Select Spot No</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <label class="col-xs-3">Reg No</label>
                <div class="col-xs-3">
                    <asp:DropDownList ID="CarRegNo"  Class="form-control" placeholder="RegNo" runat="server">
                        <asp:ListItem Selected="True">Select Car RegNo</asp:ListItem>
                    </asp:DropDownList>
                </div>

            

                <div class="col-xs-4 space-vert">
                    <asp:Button ID="btReserve" runat="server" Class="btn btn-success" Text="Reserve" OnClick="btReserve_Click" />
                    
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>

   



</asp:Content>



