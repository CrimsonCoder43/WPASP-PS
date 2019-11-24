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
    public partial class placeTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP 1 * FROM reviews ORDER BY Id DESC", sqlConn);
            DataTable data = new DataTable();

            adapter.Fill(data);

            string name = data.Rows[0][1].ToString();
            string review = data.Rows[0][2].ToString();

            Label1.Text = name;
            Label2.Text = review;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string review = TextBox2.Text;

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;

            string insertQuery = "INSERT INTO reviews(name, review) VALUES (@name, @review)";

            SqlConnection sqlConn = new SqlConnection(connStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@name", name);
            sqlComm.Parameters.AddWithValue("@review", review);
            sqlComm.Connection = sqlConn;

            sqlConn.Open();
            sqlComm.ExecuteNonQuery();
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            Label1.Text = name;
            Label2.Text = review;
            sqlConn.Close();
            Label3.Text = "Thank You for Your review!";
        }
    }
}