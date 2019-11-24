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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                PlaceHolder1.Controls.Add(new LiteralControl("<a href='../" + row[2] + "'>" + row[1] + "</a>"));
                PlaceHolder1.Controls.Add(new LiteralControl("</li>"));
            }

            PlaceHolder2.Controls.Add(new LiteralControl("</ul>"));

            PlaceHolder2.Controls.Add(new LiteralControl("<ul>"));

            foreach (DataRow row in footData.Rows)
            {
                PlaceHolder2.Controls.Add(new LiteralControl("<li>"));
                PlaceHolder2.Controls.Add(new LiteralControl("<a href='../" + row[2] + "'>" + row[1] + "</a>"));
                PlaceHolder2.Controls.Add(new LiteralControl("</li>"));
            }

            PlaceHolder2.Controls.Add(new LiteralControl("</ul>"));
        }
    }
}