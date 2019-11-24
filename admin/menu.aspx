<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Sajt.menus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    ADMINISTRATOR | Menu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>MANAGE WEBSITE CONTENT</h1>
    <br/>
    <hr/>
    <br/>
    <h2>CHOOSE WHAT TO MANAGE</h2>
    <br/>
    <table style="width:100%; height: 150px;">
        <tr>
            <td style="height: 50px; width: 233px">
                <asp:Button ID="Button1" runat="server" Text="ADMINS" Height="35px" Width="100px" PostBackUrl="~/admin/admins.aspx" class="button"/>
            </td>
            <td style="height: 50px; width: 233px">
                <asp:Button ID="Button2" runat="server" Text="MENU" Height="35px" Width="100px" PostBackUrl="~/admin/menu.aspx" class="button"/>
            </td>
            <td style="height: 50px; width: 233px">
                <asp:Button ID="Button3" runat="server" Text="RESERVATIONS" Height="35px" Width="100px" PostBackUrl="~/admin/reservations.aspx" class="button"/>
            </td>
            <td style="height: 50px; width: 233px">
                <asp:Button ID="Button5" runat="server" Height="35px" Text="POLL" Width="100px" PostBackUrl="~/admin/poll.aspx" class="button"/>
            </td>
            <td style="height: 50px; width: 233px">
                <asp:Button ID="Button4" runat="server" Text="REVIEWS" Height="35px" Width="100px" PostBackUrl="~/admin/reviews.aspx" class="button"/>
            </td>
        </tr>
        <tr>
            <td style="height: 50px; width: 233px">
                &nbsp;</td>
            <td style="height: 50px; width: 233px">
                &nbsp;</td>
            <td style="height: 50px; width: 233px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="25px" Font-Underline="True" Text="Label"></asp:Label>
            </td>
            <td style="height: 50px; width: 233px">
                &nbsp;</td>
            <td style="height: 50px; width: 233px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width: 600px; height: 21px;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BazaVeza %>" DeleteCommand="DELETE FROM [menu] WHERE [Id] = @Id" InsertCommand="INSERT INTO [menu] ([name], [description], [path], [cover], [new]) VALUES (@name, @description, @path, @cover, @new)" SelectCommand="SELECT * FROM [menu]" UpdateCommand="UPDATE [menu] SET [name] = @name, [description] = @description, [path] = @path, [cover] = @cover, [new] = @new WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="path" Type="String" />
                        <asp:Parameter Name="cover" Type="Boolean" />
                        <asp:Parameter Name="new" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="path" Type="String" />
                        <asp:Parameter Name="cover" Type="Boolean" />
                        <asp:Parameter Name="new" Type="Boolean" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 25px; height: 21px;">
                &nbsp;</td>
            <td style="width: 325px; height: 21px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 250px; width: 600px;">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="0" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="250px" PageSize="3" Width="601px" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="image" runat="server" Width="100" Height="100" ImageUrl='<%# Bind("path") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Image ID="image" runat="server" Width="100" Height="100" ImageUrl='<%# Bind("path") %>' />
                                <asp:FileUpload ID="fileUploadEditImage" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="cover" HeaderText="Cover" SortExpression="cover" />
                        <asp:CheckBoxField DataField="new" HeaderText="New" SortExpression="new" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/admin/img/cancel.png" DeleteImageUrl="~/admin/img/delete.png" EditImageUrl="~/admin/img/edit.png" UpdateImageUrl="~/admin/img/confirm.png" />
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
            </td>
            <td style="height: 250px; width: 25px;">
                &nbsp;</td>
            <td style="width: 325px; height: 250px">
                <asp:Panel ID="Panel1" runat="server" Height="250px" Width="325px">
                    <table style="width:100%;" border="1">
                        <tr>
                            <td style="width: 125px; height: 35px;">Name:</td>
                            <td style="width: 200px; height: 35px;">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px; height: 35px;">Description:</td>
                            <td style="width: 200px; height: 35px;">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" style="resize: none"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px; height: 35px;">Image:</td>
                            <td style="width: 200px; height: 35px;">
                                <asp:FileUpload ID="fileUploadNewImage" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px; height: 35px;">Slider:</td>
                            <td style="width: 200px; height: 35px;">
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px; height: 35px;">New:</td>
                            <td style="width: 200px; height: 35px;">
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 125px">
                                <asp:Button ID="btnCancel" runat="server" Height="35px" Text="Cancel" Width="75px" class="button"/>
                            </td>
                            <td style="width: 200px">
                                <asp:Button ID="btnInsert" runat="server" Height="35px" Text="Insert" Width="75px" OnClick="btnInsert_Click" class="button"/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <br/>
                <asp:Button ID="btnNew" Text="New item" runat="server" Height="35px" Width="75px" OnClick="btnNew_Click" class="button"/>
            </td>
            <td style="width: 25px">
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="20px" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <br/>
    <hr/>
    <br/>
    <asp:Button ID="btnLogout" Text="Log-Out" runat="server" Height="35px" OnClick="btnLogout_Click" Width="75px" class="button"/>
</asp:Content>
