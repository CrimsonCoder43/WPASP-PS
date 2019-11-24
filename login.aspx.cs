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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Username";
            Label2.Text = "Password";
            Label3.Text = "There is no administrator with that username or password!";
            Label3.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;

            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlCommand sqlComm = new SqlCommand("SELECT username FROM admin WHERE username = @username AND password = @password", sqlConn);

            sqlComm.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
            sqlComm.Parameters.Add("@password", SqlDbType.NVarChar).Value = password;

            sqlConn.Open();
            string result = Convert.ToString(sqlComm.ExecuteScalar());

            if (string.IsNullOrEmpty(result))
            {
                Label3.Visible = true;
            }
            else
            {
                Session["username"] = TextBox1.Text.ToString();
                Session["password"] = TextBox2.Text.ToString();
                sqlConn.Close();
                Response.Redirect("~/admin/masterAdmin.aspx");
            }
        }
    }
}