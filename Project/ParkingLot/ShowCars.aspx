<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ShowCars.aspx.cs" Inherits="ShowCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    
        <asp:SqlDataSource ID="SqlDataSourceCar" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT * FROM [car]" DeleteCommand="DELETE FROM [car] WHERE [car_id] = @car_id" InsertCommand="INSERT INTO [car] ([car_regno], [user_id]) VALUES (@car_regno, @user_id)" UpdateCommand="UPDATE [car] SET [car_regno] = @car_regno, [user_id] = @user_id WHERE [car_id] = @car_id">
            <DeleteParameters>
                <asp:Parameter Name="car_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="car_regno" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="car_regno" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="car_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
     </div>

    <div class="container">
        <div class="form-horizontal">
                <h2 style="text-align:center">Registered Cars</h2>
                <hr />
            </div>
    </div>

    <div class="container" >

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCar"  horizontalalign="Center" style="margin-top:5% ; margin-bottom:5%" AllowSorting="True" CellPadding="3" DataKeyNames="car_id" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" ShowFooter="True">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="car_id" InsertVisible="False" SortExpression="car_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("car_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("car_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="INSERT" OnClick="lbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="car_regno" SortExpression="car_regno">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("car_regno") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditRegNo" runat="server" ErrorMessage="RegNo is the required field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("car_regno") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtRegNo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertFName" runat="server" ErrorMessage="RegNo is the required field"
                            ControlToValidate="txtRegNo" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="user_id" SortExpression="user_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("user_id") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditUserId" runat="server" ErrorMessage="UserId is the required field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertUserId" runat="server" ErrorMessage="UserId is the required field"
                            ControlToValidate="txtUserId" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />

        
    
    </div>

</asp:Content>

  