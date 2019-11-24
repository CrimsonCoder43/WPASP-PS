<%@ Page Title="" Language="C#" MasterPageFile="~/Sajt.Master" AutoEventWireup="true" CodeBehind="reservations.aspx.cs" Inherits="Sajt.reservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    PIZZA SHOP | Reservations
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="first" runat="server">
    <h1>Make Your reservation online!</h1>
    <br/>
    <hr/>
    <br/>
    <table style="width: 100%; height: 200px;">
        <tr>
            <td style="width: 220px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="20px" Text="Label"></asp:Label>
                </td>
            <td style="width: 175px" class="auto-style2">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20px" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="20px" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 220px">&nbsp;</td>
            <td style="width: 175px" class="auto-style2">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BazaVeza %>" SelectCommand="SELECT Id, hours, reserved FROM hours WHERE (reserved = 'false')"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 220px; height: 200px;">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" FirstDayOfWeek="Sunday" OnSelectionChanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </td>
            <td style="width: 175px; height: 200px;" class="auto-style2">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="150px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="hours" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="height: 200px">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="25px" Text="Your reservation was successful!" Visible="False"></asp:Label>
                <asp:Panel ID="Panel1" runat="server" Height="200px">
                    <table style="width:100%; height: 200px;">
                        <tr>
                            <td style="width: 100px">Name:</td>
                            <td style="width: 300px">
                                <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style2" style="width: 30px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="You must enter your name!" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is not in valid format!" ForeColor="Red" ValidationExpression="([A-Z]{1}[a-z]{2,})+">*</asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 100px">E-Mail:</td>
                            <td style="width: 300px">
                                <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style2" style="width: 30px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="You must enter Your E-Mail!" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="E-Mail is not in valid format!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 100px">Phone:</td>
                            <td style="width: 300px">
                                <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style2" style="width: 30px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="You must enter your phone!" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Phone is not in valid format!" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Height="35px" Text="Submit" Width="75px" OnClick="Button1_Click" class="button"/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>        <tr>
            <td style="width: 220px;">

            </td>
            <td style="width: 175px;" class="auto-style2">

            </td>
            <td>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="second" runat="server">
    <h2>Visit us anyday!</h2>
    <br/>
    <hr/>
    <br/>
    <div id="slider">
        <div class="slide fade">
            <img src="img/general/shop1.jpg" alt="Shop Picture 1"/>
        </div>
        <div class="slide fade">
            <img src="img/general/shop2.jpg" alt="Shop Picture 2"/>
        </div>
        <div class="slide fade">
            <img src="img/general/shop3.jpg" alt="Shop Picture 3"/>
        </div>
        <div class="slide fade">
            <img src="img/general/shop4.jpg" alt="Shop Picture 4"/>
        </div>
        <div class="slide fade">
            <img src="img/general/shop5.jpg" alt="Shop Picture 5"/>
        </div>
    </div>
    <script lang="javascript" type="text/javascript">
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("slide");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) { slideIndex = 1 }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 3000);
            }
    </script>
</asp:Content>
