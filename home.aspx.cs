using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class home : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("login.aspx");
                // important to stop further code after redirect
            }

            // THEN: Continue only if first time page loads
            if (!IsPostBack)
            {

                if (Request.QueryString["loginSuccess"] == "true")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login Successful!');", true);
                }

                LoadUpcomingEvents(); // Load event data
            }
        }
        private void LoadUpcomingEvents()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 2 Title, Description, Location, [Event Date],  Time, Batch , branch FROM Event WHERE Status = 'upcoming' ORDER BY [Event Date] ASC";
                //SELECT[Event ID], Title, Description, Location, [Event Date], Time, Batch , branch FROM Event
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptEvents.DataSource = dt;
                rptEvents.DataBind();
            }
        }
        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllEvents.aspx");
        }
    }
}