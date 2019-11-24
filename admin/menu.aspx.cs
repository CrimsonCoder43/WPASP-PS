using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Sajt
{
    public partial class menus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["password"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                Panel1.Visible = false;
                Label1.Text = "MENU";
                Label3.Text = "";
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string uploadFolder = Server.MapPath("~/img/menu/");
            FileUpload newImage = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("fileUploadEditImage");
            Image oldImage = (Image)GridView1.Rows[e.RowIndex].FindControl("image");

            if (newImage != null && newImage.HasFile)
            {
                string oldPath = oldImage.ImageUrl;
                FileInfo fileInformation = new FileInfo(Server.MapPath(oldPath));
                if (fileInformation.Exists)
                {
                    File.Delete(Server.MapPath(oldPath));
                }
                string fileName = newImage.PostedFile.FileName;
                newImage.SaveAs(Server.MapPath("~/img/menu/" + fileName));
                e.NewValues["path"] = "~/img/menu/" + fileName;
            }
            else
            {
                e.NewValues["path"] = oldImage.ImageUrl;
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string uploadFolder = Server.MapPath("~/img/menu/");
            if (fileUploadNewImage.HasFile)
            {
                string name = TextBox1.Text;
                string description = TextBox2.Text;
                bool cover = CheckBox1.Checked;
                bool newItem = CheckBox2.Checked;

                string fileName = fileUploadNewImage.PostedFile.FileName;
                string fileType = fileUploadNewImage.PostedFile.ContentType;

                if (fileType == "image/jpeg" || fileType == "image/jpg" || fileType == "image/png")
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["BazaVeza"].ConnectionString;
                    string insertQuery = "INSERT INTO menu(name, description, path, cover, new) VALUES (@name, @description, @path, @cover, @new)";

                    SqlConnection sqlConn = new SqlConnection(connStr);
                    SqlCommand sqlComm = new SqlCommand(insertQuery);
                    sqlComm.Parameters.AddWithValue("@name", name);
                    sqlComm.Parameters.AddWithValue("@description", description);
                    sqlComm.Parameters.AddWithValue("@path", "~/img/menu/" + fileName);
                    sqlComm.Parameters.AddWithValue("@cover", cover);
                    sqlComm.Parameters.AddWithValue("@new", newItem);
                    sqlComm.Connection = sqlConn;
                    try
                    {
                        fileUploadNewImage.SaveAs(uploadFolder + fileName);
                        sqlComm.Connection.Open();
                        sqlComm.ExecuteNonQuery();

                        TextBox1.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        CheckBox1.Checked = false;
                        CheckBox2.Checked = false;
                        GridView1.DataBind();

                    }
                    catch (Exception ex)
                    {
                        Panel1.Visible = true;
                        Label3.Text = (ex.Message);
                    }
                    finally
                    {
                        sqlConn.Close();
                    }
                }
            }
            else
            {
                Panel1.Visible = true;
                Label3.Text = "You have to choose the image to upload!";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Image oldImage = (Image)GridView1.Rows[e.RowIndex].FindControl("image");
            string oldPath = oldImage.ImageUrl;
            FileInfo fileInformation = new FileInfo(Server.MapPath(oldPath));
            if (fileInformation.Exists)
            {
                File.Delete(Server.MapPath(oldPath));
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