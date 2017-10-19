<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Monthly Statistics</h2>
            <hr />
        </div>
    </div>
    <div class="container" style="width:500px; margin:0 auto;">
        
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" BackHatchStyle="DashedHorizontal" Height="350px" Palette="Chocolate" Width="500px">
            <Series>
                <asp:Series Name="Series1" ChartType="Column" XValueMember="Months" YValueMembers="Revenue"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Months">
                    </AxisX>
                    <AxisY Title="Revenue">
                    </AxisY>
                    <Area3DStyle Enable3D="true" />
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="select sum(bill) as Revenue,Month(CONVERT(DATE,END_DATE,103)) as Months
from[reservation]
group by Month(CONVERT(DATE,END_DATE,103))"></asp:SqlDataSource>

</asp:Content>

