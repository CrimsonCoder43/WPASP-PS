using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt
{
    public partial class admins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["password"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Label1.Text = "ADMINS";
                Panel1.Visible = false;
                Panel2.Visible = false;

                OpAdminSelect op = new OpAdminSelect();
                OperacijaRezultat rezultat = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rezultat == null) || (!rezultat.Status))
                {
                    return;
                }
                else
                {
                    DbItem[] items = rezultat.DbItems;
                    AdminDb[] admins = items.Cast<AdminDb>().ToArray();

                    GridView1.DataSource = admins;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;

            Button button = (Button)sender;
            string[] arg = button.CommandArgument.ToString().Split(';');
            TextBox1.Text = arg[1];
            TextBox2.Text = arg[2];
            TextBox3.Text = arg[0];
        }

        protected void confirmUpdate_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;
            int id = Int32.Parse(TextBox3.Text);

            OpAdminUpdate op = new OpAdminUpdate();
            op.Admin = new AdminDb { ID = id, Username = username, Password = password };
            OperacijaRezultat rezultat = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rezultat == null) || (!rezultat.Status))
            {
                return;
            }
            else
            {
                DbItem[] items = rezultat.DbItems;
                AdminDb[] admins = items.Cast<AdminDb>().ToArray();

                GridView1.DataSource = admins;
                GridView1.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = Convert.ToInt32(button.CommandArgument);

            OpAdminDelete op = new OpAdminDelete();
            op.IdAdmin = id;
            OperacijaRezultat rezultat = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rezultat == null) || (!rezultat.Status))
            {
                return;
            }
            else
            {
                DbItem[] items = rezultat.DbItems;
                AdminDb[] admins = items.Cast<AdminDb>().ToArray();

                GridView1.DataSource = admins;
                GridView1.DataBind();
            } 
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void confirmInsert_Click(object sender, EventArgs e)
        {
            string username = TextBox4.Text;
            string password = TextBox5.Text;

            OpAdminInsert op = new OpAdminInsert();
            op.Admin = new AdminDb { Username = username, Password = password };
            OperacijaRezultat rezultat = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rezultat == null) || (!rezultat.Status))
            {
                return;
            }
            else
            {
                DbItem[] items = rezultat.DbItems;
                AdminDb[] admins = items.Cast<AdminDb>().ToArray();

                GridView1.DataSource = admins;
                GridView1.DataBind();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Session.Remove("password");
            Response.Redirect("~/login.aspx");
        }
    }
}