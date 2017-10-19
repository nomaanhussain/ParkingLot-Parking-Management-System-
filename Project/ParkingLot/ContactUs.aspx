<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx"><span>
                            <img alt="Logo" src="images/parkinglogo.png" height="30" /></span>ParkingLot</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>
                            <li><a href="SignUp.aspx">Sign Up</a></li>
                            <li><a href="SignIn.aspx">Sign In</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="form-horizontal">
                    <h2 style="text-align: center">FeedBack Foam</h2>
                    <hr />
                </div>
            </div>

            <div class="container">

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

            </div>
        <!--- Footer  -->

        <hr />

        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2017 ParkingLot.com &middot; <a href="#">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
            </div>
        </footer>

        <!--- Footer -->
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

