using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class RegisterEvent : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                // Proceed normally
            }
            else
            {
                // Redirect to login page or show error
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["eventid"] != null)
                {
                    int eventId = Convert.ToInt32(Request.QueryString["eventid"]);
                    hdnEventID.Value = eventId.ToString();
                    int userId = Convert.ToInt32(Session["UserID"]);
                    hdnStudentID.Value = userId.ToString();

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();

                        // 1. Fetch Event Title
                        string eventQuery = "SELECT Title FROM Event WHERE EventID = @EventID";
                        SqlCommand eventCmd = new SqlCommand(eventQuery, con);
                        eventCmd.Parameters.AddWithValue("@EventID", eventId);

                        using (SqlDataReader dr = eventCmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblEventName.Text = "Event: " + dr["Title"].ToString();
                            }
                        }

                        // 2. Fetch Student Info
                        string studentQuery = "SELECT FullName, Email, Mobile FROM Users WHERE UserID = @UserID";
                        SqlCommand studentCmd = new SqlCommand(studentQuery, con);
                        studentCmd.Parameters.AddWithValue("@UserID", userId);

                        using (SqlDataReader dr2 = studentCmd.ExecuteReader())
                        {
                            if (dr2.Read())
                            {
                                StudentName.Text = "Name: " + dr2["FullName"].ToString();
                                lblStudentEmail.Text = "Email: " + dr2["Email"].ToString();
                                lblStudentMobile.Text = "Mobile No: " + dr2["Mobile"].ToString();
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("AllEvents.aspx");
                }
            }


        }

        [System.Web.Services.WebMethod]
        public static void SaveRegistration(string paymentId, string UserID, string eventId, string amount)
        {
            string connectionString = "Data Source=SNEHAL_PARAB\\SQLEXPRESS;Initial Catalog=alumni;Integrated Security=True;";
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Registration(UserID, EventID, PaymentID, Amount, PaymentDate) VALUES (@UserID, @EventID, @PaymentID, @Amount, @PaymentDate)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    cmd.Parameters.AddWithValue("@EventID", eventId);
                    cmd.Parameters.AddWithValue("@PaymentID", paymentId);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                // Log this error somewhere like a text file or database
                throw new Exception("Database error: " + ex.Message);
            }

        }
        protected void btnHiddenSubmit_Click(object sender, EventArgs e)
        {
            string paymentId = hdnPaymentID.Value;
            string studentId = hdnStudentID.Value;
            string eventId = hdnEventID.Value;
            string amount = hdnAmount.Value;

            if (!string.IsNullOrEmpty(paymentId) && !string.IsNullOrEmpty(studentId) && !string.IsNullOrEmpty(eventId))
            {
                SaveRegistration(paymentId, studentId, eventId, amount);
                SendConfirmationEmail(studentId, paymentId, eventId, amount);


                // Optionally redirect to Thank You page
                Response.Redirect("payment.aspx?paymentId=" + paymentId + "&datetime=" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            }
            else
            {
                // Show error
                lblError.Text = "Payment successful but missing some details. Please contact support.";
            }
        }
        private void SendConfirmationEmail(string UserID, string paymentId, string eventId, string amount)
        {
            string studentEmail = "";
            string studentName = "";
            string eventTitle = "";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Get student info
                string studentQuery = "SELECT FullName, Email FROM Users WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(studentQuery, con))
                {
                    cmd.Parameters.AddWithValue("@UserId", UserID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        studentName = reader["FullName"].ToString();
                        studentEmail = reader["Email"].ToString();
                    }
                    reader.Close();
                }

                // Get event title
                string eventQuery = "SELECT Title FROM Event WHERE EventID = @EventID";
                using (SqlCommand cmd = new SqlCommand(eventQuery, con))
                {
                    cmd.Parameters.AddWithValue("@EventID", eventId);
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                        eventTitle = result.ToString();
                }
            }

            // Compose email
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("enter_your_gmail_is"); // Your sender email
            mail.To.Add(studentEmail);
            mail.Subject = "Event Registration Successful!";
            mail.Body = $"Dear {studentName},\n\n" +
                        $"Thank you for registering for the event: {eventTitle}.\n\n" +
                        $" Payment ID: {paymentId}\n" +
                        $" Amount Paid: ₹{amount}\n" +
                        $" Payment Time: {DateTime.Now.ToString("f")}\n\n" +
                        $"We look forward to seeing you at the event!\n\n" +
                        $"Best regards,\nAlumni Event Team";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("enter_your_gmail_is", "enter_app_password"); // use App Password
            smtp.EnableSsl = true;

            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                lblError.Text = "Email Error: " + ex.Message;
            }
        }


    }
}