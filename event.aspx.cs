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
    public partial class _event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRegistrations();
            }
        }

        private void LoadRegistrations()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = @"
            SELECT 
                RegistrationID,
                UserID,
                EventID,
                PaymentID,
                PaymentDate
            FROM 
                Registration
            ORDER BY 
                PaymentDate DESC";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvRegistrations.DataSource = dt;
                        gvRegistrations.DataBind();
                    }
                }
            }
        }
    }
}