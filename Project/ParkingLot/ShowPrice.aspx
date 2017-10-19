<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ShowPrice.aspx.cs" Inherits="ShowPrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">

        <asp:SqlDataSource ID="SqlDataSourcePrice" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" DeleteCommand="DELETE FROM [price_plan] WHERE [price_id] = @price_id" InsertCommand="INSERT INTO [price_plan] ([member_price], [org_price], [min_price], [active]) VALUES (@member_price, @org_price, @min_price, @active)" SelectCommand="SELECT * FROM [price_plan]" UpdateCommand="UPDATE [price_plan] SET [member_price] = @member_price, [org_price] = @org_price, [min_price] = @min_price, [active] = @active WHERE [price_id] = @price_id">
            <DeleteParameters>
                <asp:Parameter Name="price_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="member_price" Type="Double" />
                <asp:Parameter Name="org_price" Type="Double" />
                <asp:Parameter Name="min_price" Type="Double" />
                <asp:Parameter Name="active" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="member_price" Type="Double" />
                <asp:Parameter Name="org_price" Type="Double" />
                <asp:Parameter Name="min_price" Type="Double" />
                <asp:Parameter Name="active" Type="String" />
                <asp:Parameter Name="price_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div class="container">
        <div class="form-horizontal">
            <h2 style="text-align: center">Price Plans</h2>
            <hr />
        </div>
    </div>

    <div class="container">


        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="price_id" DataSourceID="SqlDataSourcePrice" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowFooter="True">
            <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510" />

            <Columns>

                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="price_id" InsertVisible="False" SortExpression="price_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("price_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("price_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="INSERT" OnClick="lbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="member_price" SortExpression="member_price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("member_price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditMPrice" runat="server" ErrorMessage="Member Price is the required field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("member_price") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFMPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertMPrice" runat="server" ErrorMessage="Member Price is the required field"
                            ControlToValidate="txtFMPrice" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="org_price" SortExpression="org_price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("org_price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditOPrice" runat="server" ErrorMessage="Original Price is the required field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("org_price") %>'></asp:Label>
                        
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtOPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertOPrice" runat="server" ErrorMessage="Original Price is the required field"
                            ControlToValidate="txtOPrice" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="min_price" SortExpression="min_price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("min_price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditMinPrice" runat="server" ErrorMessage="Minimum Price is the required field"
                            ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("min_price") %>'></asp:Label>
                        
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMinPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertMinPrice" runat="server" ErrorMessage="Min Price is the required field"
                            ControlToValidate="txtMinPrice" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="active" SortExpression="active">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("active") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditActive" runat="server" ErrorMessage="Active is the required field"
                            ControlToValidate="TextBox4" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("active") %>'></asp:Label> 
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtActive" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertActive" runat="server" ErrorMessage="Active is the required field"
                            ControlToValidate="txtActive" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
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
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />

    </div>
</asp:Content>

