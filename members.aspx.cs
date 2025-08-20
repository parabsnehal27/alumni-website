using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class members : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string searchQuery = TextBox1.Text.Trim();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT FullName, Email, PassingYear, Branch FROM Users WHERE FullName LIKE @Search OR Branch LIKE @Search", conn);
                    cmd.Parameters.AddWithValue("@Search", "%" + searchQuery + "%");

                    try
                    {
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptResults.DataSource = dt;
                            rptResults.DataBind();
                        }
                        else
                        {
                            rptResults.DataSource = null;
                            rptResults.DataBind();
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No results found.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message.Replace("'", @"\'")}');", true);
                    }
                }
            }
            else
            {
                rptResults.DataSource = null;
                rptResults.DataBind();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a search term.');", true);
            }
        }

    }
}