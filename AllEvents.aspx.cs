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
    public partial class AllEvents : System.Web.UI.Page
    {
        string connectionString =System.Configuration.ConfigurationManager .ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT [EventID], Title, Description, Location, Time, Branch, Batch, [Event Date]
            FROM Event 
            WHERE TRY_CAST([Event Date] AS DATETIME) > GETDATE()
            ORDER BY TRY_CAST([Event Date] AS DATETIME) ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptEvents.DataSource = dt;
                rptEvents.DataBind();
            }
        }

        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Register")
            {
                string eventId = e.CommandArgument.ToString();  // <-- treat Event ID as string

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT [Event Date] FROM Event WHERE [EventID] = @EventID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EventID", eventId);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    con.Close();

                    if (result != null)
                    {
                        DateTime eventDate = Convert.ToDateTime(result);
                        if (eventDate > DateTime.Now.Date)
                        {
                            // Redirect to RegisterEvent page, pass EventID in query string
                            Response.Redirect("RegisterEvent.aspx?eventid=" + eventId);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Registration Closed or Event Already Passed!')", true);
                        }
                    }
                }
            }
        }
    }
}