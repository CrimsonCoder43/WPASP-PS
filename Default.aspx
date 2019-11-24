<%@ Page Title="" Language="C#" MasterPageFile="~/Sajt.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sajt.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    PIZZA SHOP | Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>Our Story</h1>
    <br/>
    <hr/>
    <br/>
    <p>Our family tradition begins with a passion for culinary excellence. It continues with a storied reputation for award-winning cuisine, a legacy spanning more than 50 years.  And it culminates today in The Pizza Shop, where passion and tradition meet in a warm, inviting and contemporary light.</p><br/>
    <p>The Pizza Shop is old school, yes, but not old-fashioned. Recipes that have been in the family for generations have been carefully re-imagined. Familiar dishes have been done a little differently, given new, enticing twists. And, as always, the freshest local ingredients are used whenever possible.</p><br/>
    <p>And where better to combine the passion, culinary skill and warmth of The Pizza Shop than in the newly restored historic West Shore Train Station on the Newburgh waterfront? Designed by the same firm that gave the world Grand Central Station more than a century ago, this tiny architectural gem features a delicately arched entrance beneath a soaring cathedral ceiling. Stroll past the gleaming open-air kitchen, past the take-out area and take a seat inside or on the deck, where you’ll find an unrivaled view of the Hudson River.</p><br/>
    <p>The Pizza Shop, where the legacy continues.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <h2>Monthly TOP!</h2>
    <br/>
    <hr/>
    <br/>
    <div id="grid">
        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
        <div class="clear">
        </div>
        <div id="thumbHolder">
            <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
