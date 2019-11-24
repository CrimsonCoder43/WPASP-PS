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
    public partial class menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connStr);

            SqlDataAdapter adapterUp = new SqlDataAdapter("SELECT * FROM menu WHERE new = 'false'", sqlConn);
            SqlDataAdapter adapterDown = new SqlDataAdapter("SELECT * FROM menu WHERE new = 'true'", sqlConn);
            DataTable dataUp = new DataTable();
            DataTable dataDown = new DataTable();
            adapterUp.Fill(dataUp);
            adapterDown.Fill(dataDown);

            PlaceHolder3.Controls.Add(new LiteralControl("<table style='width: 100%;'>"));
            foreach (DataRow row in dataUp.Rows)
            {
                string source = row[3].ToString();
                source = source.Remove(0, 2);
                PlaceHolder3.Controls.Add(new LiteralControl("<tr>"));
                PlaceHolder3.Controls.Add(new LiteralControl("<td><img src='" + source + "' alt='" + row[1] + "'/></td>"));
                PlaceHolder3.Controls.Add(new LiteralControl("<td>" + row[1] + "<br/><br/>" + row[2] + "</td>"));
                PlaceHolder3.Controls.Add(new LiteralControl("</tr>"));
            }
            PlaceHolder3.Controls.Add(new LiteralControl("</table>"));

            PlaceHolder4.Controls.Add(new LiteralControl("<table style='width: 100%;'>"));
            foreach (DataRow row in dataDown.Rows)
            {
                string source = row[3].ToString();
                source = source.Remove(0, 2);
                PlaceHolder4.Controls.Add(new LiteralControl("<tr>"));
                PlaceHolder4.Controls.Add(new LiteralControl("<td width='50%'><img src='" + source + "' alt='" + row[1] + "'/></td>"));
                PlaceHolder4.Controls.Add(new LiteralControl("<td width='50%'>" + row[1] + "<br/><br/>" + row[2] + "</td>"));
                PlaceHolder4.Controls.Add(new LiteralControl("</tr>"));
            }
            PlaceHolder4.Controls.Add(new LiteralControl("</table>"));
        }
    }
}