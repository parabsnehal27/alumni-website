using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class link : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjects();
            }
        }
        private void BindProjects()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Id, Title, Link, Description FROM StudentProjects", con))
                {
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string link = txtLink.Text.Trim();
            string description = txtDescription.Text.Trim();

            // Basic validations
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description))
            {
                // Show an error message (optional: use a Label like lblError.Text)
                lblError.Text = "Title, Description and project file is require are required.";
                return;
            }

            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                byte[] bytes;

                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        bytes = br.ReadBytes((int)fs.Length);
                    }
                }

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query;
                    SqlCommand cmd;

                    if (!string.IsNullOrEmpty(link))
                    {
                        // Store with link
                        query = "INSERT INTO StudentProjects (Title, Description, Link, FileName, ContentType, FileData) VALUES (@Title, @Description, @Link, @FileName, @ContentType, @FileData)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Link", link);
                    }
                    else
                    {
                        // Store without link
                        query = "INSERT INTO StudentProjects (Title, Description, FileName, ContentType, FileData) VALUES (@Title, @Description, @FileName, @ContentType, @FileData)";
                        cmd = new SqlCommand(query, con);
                    }

                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@FileName", fileName);
                    cmd.Parameters.AddWithValue("@ContentType", contentType);
                    cmd.Parameters.AddWithValue("@FileData", bytes);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                BindProjects();
            }
        }
        protected void ViewFile_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT FileName, ContentType, FileData FROM StudentProjects WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                            return;

                        bytes = (byte[])reader["FileData"];
                        fileName = reader["FileName"].ToString();
                        contentType = reader["ContentType"].ToString();
                    }
                }
            }

            Response.Clear();
            Response.ContentType = contentType;
            Response.AddHeader("Content-Disposition", "inline; filename=" + fileName);
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.SuppressContent = true;
            HttpContext.Current.ApplicationInstance.CompleteRequest();

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string linkValue = DataBinder.Eval(e.Row.DataItem, "Link")?.ToString();
                LinkButton viewBtn = e.Row.FindControl("ViewFile") as LinkButton;

                if (string.IsNullOrEmpty(linkValue) && viewBtn != null)
                {
                    viewBtn.Visible = false;
                }
            }
        }

    }
}