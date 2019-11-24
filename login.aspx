<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Sajt.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    ADMINISTRATOR | Log-In
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>!!! - THIS PAGE IS FOR ADMINISTRATORS ONLY - !!!</h1>
    <br/>
    <hr/>
    <br/>
    <h2>PLEASE, LOG-IN TO CONTINUE</h2>
    <br/>
    <br/>
    <br/>
    <table style="width: 100%; height: 99px;">
        <tr>
            <td style="height: 35px; width: 300px"></td>
            <td style="height: 35px; width: 200px">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 35px; width: 10px">&nbsp;</td>
            <td style="height: 35px; width: 300px"></td>
        </tr>
        <tr>
            <td style="height: 40px; width: 300px"></td>
            <td style="height: 40px; width: 200px">
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="200px" AutoCompleteType="Disabled"></asp:TextBox>
            </td>
            <td style="height: 40px; width: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Field mustn't be empty!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td style="height: 40px; width: 300px"></td>
        </tr>
        <tr>
            <td style="width: 300px">&nbsp;</td>
            <td style="width: 200px">&nbsp;</td>
            <td style="width: 10px">&nbsp;</td>
            <td style="width: 300px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 35px; width: 300px"></td>
            <td style="height: 35px; width: 200px">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 35px; width: 10px">&nbsp;</td>
            <td style="height: 35px; width: 300px"></td>
        </tr>
        <tr>
            <td style="height: 40px; width: 300px"></td>
            <td style="height: 40px; width: 200px">
                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="200px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 40px; width: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Field mustn't be empty!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td style="height: 40px; width: 300px">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 50px; width: 300px"></td>
            <td style="height: 50px; width: 200px">
                <asp:Button ID="btnLogin" runat="server" Height="29px" Text="Log-In" Width="85px" OnClick="btnLogin_Click" class="button"/>
            </td>
            <td style="height: 50px; width: 10px">&nbsp;</td>
            <td style="height: 50px; width: 300px"></td>
        </tr>
        <tr>
            <td style="height: 50px; width: 300px">&nbsp;</td>
            <td style="height: 50px; width: 200px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                <asp:Label ID="Label3" runat="server" Font-Size="15px" ForeColor="Red" Text="Label"></asp:Label>
            </td>
            <td style="height: 50px; width: 10px">&nbsp;</td>
            <td style="height: 50px; width: 300px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
</asp:Content>
