<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ContactUsUser.aspx.cs" Inherits="ContactUsUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

              <div class="container">
                <div class="form-horizontal">
                    <h2 style="text-align: center">FeedBack Foam</h2>
                    <hr />
                </div>
            </div>

            <div class="container"

            <div style="font-family: Arial">
    <fieldset style="width: 350px">
        <legend title="Contact us">Contact us</legend>
        <table>
            <tr>
                <td>
                    <b>Name:</b>
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtName" 
                        Width="200px" 
                        runat="server">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ForeColor="Red" 
                        ID="RequiredFieldValidator1" 
                        runat="server"
                        ControlToValidate="txtName" 
                        ErrorMessage="Name is required" 
                        Text="*">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Email:</b>
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtEmail" 
                        Width="200px" 
                        runat="server">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        Display="Dynamic" 
                        ForeColor="Red" 
                        ID="RequiredFieldValidator2"
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required"
                        Text="*">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                        Display="Dynamic" 
                        ForeColor="Red" 
                        ID="RegularExpressionValidator1"
                        runat="server" 
                        ErrorMessage="Invalid Email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail"
                        Text="*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Subject:</b>
                </td>
                <td>
                    <asp:TextBox 
                        ID="txtSubject" 
                        Width="200px" 
                        runat="server">
                    </asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ForeColor="Red" 
                        ID="RequiredFieldValidator3" 
                        runat="server"
                        ControlToValidate="txtSubject" 
                        ErrorMessage="Subject is required" 
                        Text="*">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">
                    <b>Comments:</b>
                </td>
                <td style="vertical-align: top">
                    <asp:TextBox 
                        ID="txtComments" 
                        Width="200px" 
                        TextMode="MultiLine" 
                        Rows="5" 
                        runat="server">
                    </asp:TextBox>
                </td>
                <td style="vertical-align: top">
                    <asp:RequiredFieldValidator 
                        ForeColor="Red" 
                        ID="RequiredFieldValidator4" 
                        runat="server"
                        ControlToValidate="txtComments" 
                        ErrorMessage="Comments is required" 
                        Text="*">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary 
                        HeaderText="Please fix the following errors" 
                        ForeColor="Red"
                        ID="ValidationSummary1" 
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label 
                        ID="lblMessage" 
                        runat="server" 
                        Font-Bold="true">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button 
                        ID="Button1" 
                        runat="server" 
                        Text="Submit" 
                        OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>

</asp:Content>

