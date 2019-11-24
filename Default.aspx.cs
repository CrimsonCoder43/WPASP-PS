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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM menu WHERE cover = 'true'", sqlConn);
            DataTable data = new DataTable();
            adapter.Fill(data);

            foreach (DataRow row in data.Rows)
            {
                string source = row[3].ToString();
                source = source.Remove(0, 2);
                PlaceHolder3.Controls.Add(new LiteralControl("<img class='cover' src='" + source + "' alt='" + row[1] + "'/><p class='cover_txt'>" + row[1] + "<br/><br/>" + row[2] + "</p>"));
            }

            int x = 1;
            foreach (DataRow row in data.Rows)
            {
                string source = row[3].ToString();
                source = source.Remove(0, 2);
                PlaceHolder4.Controls.Add(new LiteralControl("<img class='thumb' src='" + source + "' alt='" + row[1] + "' onclick='currentDiv(" + x + ")'/>"));
                x++;
            }
        }
    }
}