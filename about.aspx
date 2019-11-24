<%@ Page Title="" Language="C#" MasterPageFile="~/Sajt.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Sajt.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    PIZZA SHOP | About me
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>About me</h1>
    <br/>
    <hr/>
    <br/>
    <div id="pic">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/general/profile.jpg" BorderStyle="Ridge" ImageAlign="Left" Width="250px" />
    </div>
    <div id="txt">
        <p>My name is Bogdan Matorkić (student number 30/13) and I am currently studying Internet Technologies on ICT College of Vocational Studies, extended year in Belgrade. I have interest and knowledge in front-end programming and I am eager to always learn something new. Feel free to contact me for anything.</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <h2>Contact me</h2>
    <br/>
    <hr/>
    <br/>
    <div class="social">
        &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/img/general/facebook.png" target="_blank" ImageWidth="75px" NavigateUrl="https://www.facebook.com/bogdan.lucifer">Facebook Link</asp:HyperLink>
    </div>
    <div class="social">
        &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/img/general/twitter.png" target="_blank" ImageWidth="75px" NavigateUrl="https://twitter.com/43GuitarGod">Twitter Link</asp:HyperLink>
    </div>
    <div class="social">
        &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/img/general/mail.png" target="_blank" ImageWidth="75px" NavigateUrl="mailto:bogdan_992@icloud.com?Subject=Question">Mail Link</asp:HyperLink>
    </div>
    <div class="clear"></div>
</asp:Content>
