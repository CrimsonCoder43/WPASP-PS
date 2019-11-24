using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Sajt
{
    public partial class reservations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = "Choose date";
            Label3.Text = "";
            Label4.Text = "";
            Label5.Visible = false;
            DropDownList1.Visible = false;
            Panel1.Visible = false;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate >= Calendar1.TodaysDate)
            {
                Label3.Text = "Choose time";
                DropDownList1.Visible = true;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                Label3.Text = "Choose time";
                DropDownList1.Visible = true;
            }
            else
            {
                Label3.Text = "Choose time";
                Label4.Text = "Leave Your details";
                DropDownList1.Visible = true;
                Panel1.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = Calendar1.SelectedDate.ToShortDateString();
            string time = DropDownList1.SelectedItem.ToString();
            string name = TextBox1.Text;
            string mail = TextBox2.Text;
            string phone = TextBox3.Text;

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;

            string insertQuery = "INSERT INTO reservations(name, mail, phone, date, time) VALUES (@name, @mail, @phone, @date, @time)";
            string updateQuery = "UPDATE dbo.hours SET hours = hours, reserved = 'true' WHERE hours = @time";

            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlCommand sqlComm1 = new SqlCommand(insertQuery);
            sqlComm1.Parameters.AddWithValue("@name", name);
            sqlComm1.Parameters.AddWithValue("@mail", mail);
            sqlComm1.Parameters.AddWithValue("@phone", phone);
            sqlComm1.Parameters.AddWithValue("@date", date);
            sqlComm1.Parameters.AddWithValue("@time", time);
            sqlComm1.Connection = sqlConn;

            SqlCommand sqlComm2 = new SqlCommand(updateQuery);
            sqlComm2.Parameters.AddWithValue("@time", time);
            sqlComm2.Connection = sqlConn;

            sqlConn.Open();
            sqlComm1.ExecuteNonQuery();
            sqlComm2.ExecuteNonQuery();
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            sqlConn.Close();
            Label5.Visible = true;
        }
    }
}