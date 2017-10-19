<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ShowUser.aspx.cs" Inherits="ShowUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT * FROM [user]" DeleteCommand="DELETE FROM [user] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user] ([f_name], [l_name], [email], [password], [last_login]) VALUES (@f_name, @l_name, @email, @password, @last_login)" UpdateCommand="UPDATE [user] SET [f_name] = @f_name, [l_name] = @l_name, [email] = @email, [password] = @password, [last_login] = @last_login WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="f_name" Type="String" />
                <asp:Parameter Name="l_name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="last_login" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="f_name" Type="String" />
                <asp:Parameter Name="l_name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="last_login" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Registered Users</h2>
            <hr />
        </div>
    </div>
    <div class="container">
        <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />
        <asp:GridView ID="GridView1" runat="server" CssClass="grid" AllowSorting="True" AutoGenerateColumns="False" HorizontalAlign="Center" Style="margin-top: 5%; margin-bottom: 5%" CellPadding="3" DataKeyNames="user_id" DataSourceID="SqlDataSourceUser" PageSize="20" ShowFooter="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                  <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />

            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="user_id" InsertVisible="False" SortExpression="user_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="INSERT" OnClick="lbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>


                </asp:TemplateField>
                <asp:TemplateField HeaderText="f_name" SortExpression="f_name" >

                    <EditItemTemplate>

                        <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black" Text='<%# Bind("f_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditFName" runat="server" ErrorMessage="First Name is the required field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertFName" runat="server" ErrorMessage="First Name is the required field"
                            ControlToValidate="txtFName" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle CssClass="HeaderStyle-HorizontalAlign =&quot;Center&quot;" HorizontalAlign="Center" />

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="l_name" SortExpression="l_name" HeaderStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("l_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditLName" runat="server" ErrorMessage="Last Name is the required field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("l_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertLName" runat="server" ErrorMessage="Last Name is the required field"
                            ControlToValidate="txtLName" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Email is the required field"
                            ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEmail" runat="server" ErrorMessage="Email is the required field"
                            ControlToValidate="txtEmail" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="password" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditPass" runat="server" ErrorMessage="Password is the required field"
                            ControlToValidate="TextBox4" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertPass" runat="server" ErrorMessage="Password is the required field"
                            ControlToValidate="txtPass" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="last_login" SortExpression="last_login">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("last_login") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("last_login") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle HorizontalAlign="Center" BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />

    </div>
</asp:Content>

