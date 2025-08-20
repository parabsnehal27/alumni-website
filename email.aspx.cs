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
    public partial class email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string subject = txtSubject.Text;
            string body = txtBody.Text;
            int batchYear = int.Parse(txtBatchYear.Text);

            List<string> emailList = new List<string>();


            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Email FROM Users WHERE PassingYear =@PassingYear ";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PassingYear", batchYear);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    emailList.Add(reader["Email"].ToString());
                }
            }

        
            foreach (string toEmail in emailList)
            {
                try
                {
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("Enter_your_gmail_id");
                    mail.To.Add(toEmail);
                    mail.Subject = subject;
                    mail.Body = body;

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.Credentials = new NetworkCredential("Enter_your_gmail_id", "Enter_app_password");
                    smtp.EnableSsl = true;

                    smtp.Send(mail);
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Failed: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            lblStatus.Text = "Emails sent successfully!";

        }
    }
}