<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Park.aspx.cs" Inherits="Park" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Park</h2>          
            <hr />
            <div  class="container">
                <label class="col-xs-3">REG NO</label>
                <div class="col-xs-3">
                    <span>
                        <asp:TextBox ID="REG_NO1" runat="server" Class="form-control" placeholder="REG NO"></asp:TextBox>
                    </span>
                </div>
             
                <div class="col-xs-4 space-vert">
                    <asp:Button ID="btPark" runat="server" Class="btn btn-success" Text="Park" OnClick="btPark_Click" />
                    
                <asp:Label ID="lblMsg1" runat="server"></asp:Label>
                    
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>


      <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">EXIT</h2>          
            <hr />
            <div  class="container">
                <label class="col-xs-3">REG NO</label>
                <div class="col-xs-3">
                    <span>
                        <asp:TextBox ID="REG_NO2" runat="server" Class="form-control" placeholder="REG NO"></asp:TextBox>
                    </span>
                </div>
             
                <div class="col-xs-4 space-vert">
                    <asp:Button ID="btExit" runat="server" Class="btn btn-success" Text="Exit" OnClick="btExit_Click"/>
                    
                <asp:Label ID="lblMsg2" runat="server"></asp:Label>
                    
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>


</asp:Content>

