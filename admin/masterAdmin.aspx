<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="masterAdmin.aspx.cs" Inherits="Sajt.admin.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    ADMINISTRATOR | Managing
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
                    &nbsp;</td>
                <td style="height: 50px; width: 233px">
                    &nbsp;</td>
                <td style="height: 50px; width: 233px">
                    &nbsp;</td>
            </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <br/>
    <hr/>
    <br/>
    <asp:Button ID="btnLogout" Text="Log-Out" runat="server" Height="35px" OnClick="btnLogout_Click" Width="75px" class="button"/>
</asp:Content>
