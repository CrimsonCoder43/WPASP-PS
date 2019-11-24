<%@ Page Title="" Language="C#" MasterPageFile="~/Sajt.Master" AutoEventWireup="true" CodeBehind="placeTime.aspx.cs" Inherits="Sajt.placeTime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   PIZZA SHOP | Location & Hours
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>Where can You find us</h1>
    <br/>
    <hr/>
    <br/>
    <div id="pic">
        <asp:ImageButton ID="ImageButton1" runat="server" BorderStyle="Solid" ImageAlign="Left" ImageUrl="~/img/general/map.jpg" OnClientClick="window.open('https://www.google.com/maps/place/27+Water+St,+Newburgh,+NY+12550/@41.5008753,-74.0087577,17z/data=!3m1!4b1!4m5!3m4!1s0x89dd321f603c81f5:0xd13ead683c80d7ca!8m2!3d41.5008753!4d-74.006569?hl=en')"/>
    </div>
    <div id="txt">
        <h3>27 South Water Street</h3>
        <h3>Newburgh, NY 12550</h3>
        <br/>
        <h3>Sunday-Thursday: 11am-10pm</h3>
        <h3>Friday-Saturday: 11am-11pm</h3>
        <br/>
        <h3>Phone: 845-565-(SHOP) 7467</h3>
        <h3>Fax: 845-565-7469</h3>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <h2>Write a review</h2>
    <br/>
    <hr/>
    <br/>
    <table style="width:100%;">
        <tr>
            <td class="auto-style12" style="height: 85px; width: 145px">
                Name:</td>
            <td class="auto-style13" style="height: 85px; width: 275px">
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="240px" MaxLength="30"></asp:TextBox>
            </td>
            <td class="auto-style18" style="height: 85px; width: 25px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter something!" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style14" style="height: 85px">
                <h3>Last review</h3><hr style="width: 50%"/></td>
        </tr>
        <tr>
            <td class="auto-style15" rowspan="2" style="width: 145px">
                Your review:</td>
            <td class="auto-style16" rowspan="2" style="width: 275px">
                <asp:TextBox ID="TextBox2" runat="server" Height="60px" Width="240px" TextMode="MultiLine" style="resize: none"></asp:TextBox>
            </td>
            <td rowspan="2" style="width: 25px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must enter something!" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style20" style="height: 40px">
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style20" style="height: 40px">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" style="height: 50px; width: 145px"></td>
            <td class="auto-style13" style="height: 50px; width: 275px">
                <asp:Button ID="Button1" runat="server" Height="35px" Text="Submit" Width="100px" OnClick="Button1_Click" class="button"/>
            </td>
            <td class="auto-style18" style="height: 50px; width: 25px">
                </td>
            <td class="auto-style14" style="height: 50px">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BazaVeza %>" SelectCommand="SELECT * FROM [reviews]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" style="width: 145px; height: 60px"></td>
            <td class="auto-style13" style="height: 60px; width: 275px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
            <td class="auto-style18" style="height: 60px; width: 25px">
                </td>
            <td class="auto-style14" style="height: 60px">
                <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="25px"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
