using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;
using System.Drawing;
using System.Configuration;

namespace alumniweb
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)

            {
                Response.Redirect("home.aspx");

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = Uname.Text;
            string enteredPassword = password.Text;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString)) 
            {
                SqlCommand cmd = new SqlCommand("SELECT Password,Role,UserID FROM Users WHERE FullName = @username", conn);
                cmd.Parameters.AddWithValue("@username", username);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string storedHashedPassword = reader["Password"].ToString();
                        string userRole = reader["Role"].ToString();
                        string UserID = reader["UserID"].ToString();

                        if (BCrypt.Net.BCrypt.Verify(enteredPassword, storedHashedPassword))
                        {
                            Session["Role"] = userRole;
                            Session["UserID"] = UserID;
                            //Session["username"] = reader["FullName"].ToString();
                            //Session["email"] = reader["Email"].ToString();
                            //Session["mobile"] = reader["Mobile"].ToString();

                            // Role-based redirection
                            switch (userRole.ToLower())
                            {
                                case "admin":
                                    Response.Redirect("admin_panel.aspx");
                                    break;
                                case "alumni":
                                case "student":
                                    Response.Redirect($"home.aspx?loginSuccess=true");

                                    break;
                                default:
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert('Unknown user role!');", true);
                                    break;
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert('Invalid username or password.');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert('Account not found. Please check your credentials.');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message.Replace("'", @"\'")}');", true);
                }
                finally
                {
                    cmd.Dispose();
                    conn.Close();
                }
            }





        }
    }
}

