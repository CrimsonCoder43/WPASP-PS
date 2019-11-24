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
    public partial class Sajt : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chart1.Visible = false;
            Label1.Text = "";

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlDataAdapter headAdapter = new SqlDataAdapter("SELECT * FROM navigation WHERE Id < 5", sqlConn);
            SqlDataAdapter footAdapter = new SqlDataAdapter("SELECT * FROM navigation WHERE Id > 4", sqlConn);
            DataTable headData = new DataTable();
            DataTable footData = new DataTable();
            headAdapter.Fill(headData);
            footAdapter.Fill(footData);

            PlaceHolder1.Controls.Add(new LiteralControl("<ul>"));

            foreach (DataRow row in headData.Rows)
            {
                PlaceHolder1.Controls.Add(new LiteralControl("<li>"));
                PlaceHolder1.Controls.Add(new LiteralControl("<a href='"+row[2]+"'>"+row[1]+"</a>"));
                PlaceHolder1.Controls.Add(new LiteralControl("</li>"));
            }

            PlaceHolder2.Controls.Add(new LiteralControl("</ul>"));

            PlaceHolder2.Controls.Add(new LiteralControl("<ul>"));

            foreach (DataRow row in footData.Rows)
            {
                PlaceHolder2.Controls.Add(new LiteralControl("<li>"));
                PlaceHolder2.Controls.Add(new LiteralControl("<a href='" + row[2] + "'>" + row[1] + "</a>"));
                PlaceHolder2.Controls.Add(new LiteralControl("</li>"));
            }

            PlaceHolder2.Controls.Add(new LiteralControl("</ul>"));
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            int id = Int32.Parse(RadioButtonList1.SelectedValue);

            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
            string updatePoll = "UPDATE dbo.poll SET votes = votes + 1 WHERE Id = @id";

            SqlConnection sqlConn = new SqlConnection(connStr);
            SqlCommand sqlComm = new SqlCommand(updatePoll);
            sqlComm.Parameters.AddWithValue("@id", id);
            sqlComm.Connection = sqlConn;

            sqlConn.Open();
            sqlComm.ExecuteNonQuery();
            sqlConn.Close();

            RadioButtonList1.Visible = false;
            Chart1.Visible = true;
            Label1.Text = "Thank You for voting!";
        }
    }
}