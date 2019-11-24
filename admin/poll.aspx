<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="poll.aspx.cs" Inherits="Sajt.admin.poll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    ADMINISTRATOR | Poll
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
            <td style="width: 420px">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BazaVeza %>" DeleteCommand="DELETE FROM [poll] WHERE [Id] = @Id" InsertCommand="INSERT INTO [poll] ([name], [votes]) VALUES (@name, @votes)" SelectCommand="SELECT * FROM [poll]" UpdateCommand="UPDATE [poll] SET [name] = @name, [votes] = @votes WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="votes" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="votes" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 420px; height: 273px;">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="250px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="420px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/admin/img/select.png" />
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
            <td style="width: 100px; height: 273px;"></td>
            <td style="width: 420px">
                <asp:Panel ID="Panel1" runat="server" Height="250px">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="250px" Width="420px" OnItemCommand="DetailsView1_OnItemCommand">
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="votes" HeaderText="Votes" SortExpression="votes" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Image" CancelImageUrl="~/admin/img/cancel.png" DeleteImageUrl="~/admin/img/delete.png" EditImageUrl="~/admin/img/edit.png" InsertImageUrl="~/admin/img/confirm.png" NewImageUrl="~/admin/img/new.png" UpdateImageUrl="~/admin/img/confirm.png" />
                        </Fields>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BazaVeza %>" DeleteCommand="DELETE FROM [poll] WHERE [Id] = @Id" InsertCommand="INSERT INTO [poll] ([name], [votes]) VALUES (@name, @votes)" SelectCommand="SELECT * FROM [poll] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [poll] SET [name] = @name, [votes] = @votes WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="votes" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="votes" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 420px">&nbsp;</td>
            <td style="width: 100px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br/>
    <hr/>
    <br/>
    <asp:Button ID="btnLogout" Text="Log-Out" runat="server" Height="35px" OnClick="btnLogout_Click" Width="75px" class="button"/>
</asp:Content>
