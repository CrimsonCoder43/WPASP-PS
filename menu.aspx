<%@ Page Title="" Language="C#" MasterPageFile="~/Sajt.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Sajt.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    PIZZA SHOP | Menu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>Pizza for You!</h1>
    <br/>
    <hr/>
    <br/>
    <div id="menu">
        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <h2>!!! NEW !!! - PASTA - !!! NEW !!!</h2>
    <br/>
    <hr/>
    <br/>
    <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
</asp:Content>
