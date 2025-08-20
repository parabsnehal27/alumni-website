using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlBatch.Items.Clear();
                ddlBatch.Items.Add(new ListItem("-- Select Year --", ""));

                int startYear = 2000;
                int currentYear = DateTime.Now.Year;

                for (int year = startYear; year <= currentYear; year++)
                {
                    ddlBatch.Items.Add(new ListItem(year.ToString(), year.ToString()));
                }
            }
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;



            SqlConnection con = new SqlConnection(conStr);
            try
            {
                con.Open();
                Response.Write("Connected to DB!");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string conStr = "Data Source=SNEHAL_PARAB\\SQLEXPRESS;Initial Catalog=alumni;Integrated Security=True;";

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "INSERT INTO Feedback (FullName, Email, Batch, Comments) VALUES (@Name, @Email, @Batch, @Feedback)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Batch", ddlBatch.Text.Trim());
                    cmd.Parameters.AddWithValue("@Feedback", txtFeedback.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("ThankYou.aspx");
                }
            }
        }
    }
}
