using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class registration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE FullName = @a", con))
                    {
                        cmd.Parameters.AddWithValue("@a", Uname.Text);
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            //Label12.Text = "Username already exists. Please choose a different username.";
                            //Label12.ForeColor = Color.Red;
                            dr.Close();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "customAlert", "showAlert('Username already exists. Please choose a different username.');", true);



                            return;
                        }
                        else
                        {
                            dr.Close();
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Users (FullName, Gender, Email,Mobile,PassingYear,Branch,Role,Password) VALUES (@a, @b, @c, @d ,@e ,@f ,@g ,@h )", con))
                    {
                        string hashedPassword = BCrypt.Net.BCrypt.HashPassword(pwd.Text);
                        cmd.Parameters.AddWithValue("@a", Uname.Text); //username
                        cmd.Parameters.AddWithValue("@b", gender.Text); // gender
                        cmd.Parameters.AddWithValue("@c", email.Text); // email
                        cmd.Parameters.AddWithValue("@d", mob.Text); // mobile
                        cmd.Parameters.AddWithValue("@e", passDrop.Text);// passing year
                        cmd.Parameters.AddWithValue("@f", branchDrop.Text);// branch
                        cmd.Parameters.AddWithValue("@g", role.Text);// status

                        cmd.Parameters.AddWithValue("@h", hashedPassword);

                        cmd.ExecuteNonQuery();
                        Session["Uname"] = Uname.Text;
                        Response.Redirect("home.aspx");
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                // Handle SQL-specific errors
                //Label12.Text = "Database error: " + sqlEx.Message;
                //Label12.ForeColor = Color.Red;
                // string safeMsg = sqlEx.Message.Replace("'", "\\'");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "customAlert", $"alert('Database error: {safeMsg}');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "customAlert", "showAlert('The email address or mobile number you entered is already associated with an existing account. Please use different details to register.');", true);


            }
            catch (Exception ex)
            {
                // Handle general errors
                //Label12.Text = "An unexpected error occurred: " + ex.Message;
                //Label12.ForeColor = Color.Red;
                //string safeMsg = ex.Message.Replace("'", "\\'");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "customAlert", $"alert('An unexpected error occurred: {safeMsg}');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "customAlert", "showAlert('An unexpected error occurred. Please contact support.');", true);


            }

        }
    }
}