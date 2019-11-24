using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt.admin
{
    public partial class poll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["password"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Label1.Text = "POLL";
                Panel1.Visible = false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void DetailsView1_OnItemCommand(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Session.Remove("password");
            Response.Redirect("~/login.aspx");
        }
    }
}