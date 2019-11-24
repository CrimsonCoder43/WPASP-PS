<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admins.aspx.cs" Inherits="Sajt.admins" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    ADMINISTRATOR | Admins
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
            <td>&nbsp;</td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 420px">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="150px" Width="420px" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="Password" ReadOnly="True" SortExpression="password" />
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" Text="Update" runat="server" Height="35px" OnClick="btnUpdate_Click" Width="75px" CommandName="Update" CommandArgument='<%# Eval("Id") + ";" + Eval("username") + ";" + Eval("password") %>' class="button"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button Text="Delete" runat="server" Height="35px" OnClick="btnDelete_Click" Width="75px" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' class="button"/>
                            </ItemTemplate>
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
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 420px">
                <asp:Panel ID="Panel1" runat="server" Height="150px">
                    <table style="width:100%; height: 125px;" border="1">
                        <tr>
                            <td style="height: 25px; width: 100px">Username:</td>
                            <td style="height: 25px; " colspan="2">
                                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px; width: 100px">Password:</td>
                            <td style="height: 25px; " colspan="2">
                                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 100px; width: 150px">
                                <asp:Button ID="cancelUpdate" runat="server" Height="35px" Text="Cancel" Width="75px" class="button"/>
                            </td>
                            <td style="height: 100px; width: 150px">
                                <asp:Button ID="confirmUpdate" runat="server" Height="35px" Text="Update" Width="75px" OnClick="confirmUpdate_Click" class="button"/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Height="150px">
                    <table style="width:100%; height: 125px;" border="1">
                        <tr>
                            <td style="height: 25px; width: 100px">Username:</td>
                            <td style="height: 25px; " colspan="2">
                                <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px; width: 100px">Password:</td>
                            <td style="height: 25px; " colspan="2">
                                <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 100px; width: 150px">
                                <asp:Button ID="cancelInsert" runat="server" Height="35px" Text="Cancel" Width="75px" class="button"/>
                            </td>
                            <td style="height: 100px; width: 150px">
                                <asp:Button ID="confirmInsert" runat="server" Height="35px" Text="Insert" Width="75px" OnClick="confirmInsert_Click" class="button"/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 40px">
                <br/>
                <asp:Button ID="btnInsert" runat="server" Height="35px" OnClick="btnInsert_Click" Text="New admin" Width="75px" class="button"/>
            </td>
            <td style="width: 100px; height: 40px;"><asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox></td>
            <td style="width: 420px; height: 40px;"></td>
        </tr>
    </table>
    <br/>
    <hr/>
    <br/>
    <asp:Button ID="btnLogout" Text="Log-Out" runat="server" Height="35px" OnClick="btnLogout_Click" Width="75px" class="button"/>
</asp:Content>
