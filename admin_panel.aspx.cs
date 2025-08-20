using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace alumniweb
{
    public partial class admin_panel : System.Web.UI.Page
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserGrid();
                BindEventGrid();
                BindRegistrationGrid();
            }
        }

        // User Grid
        private void BindUserGrid()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Users", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                lblUserCount.Text = dt.Rows.Count.ToString();
            }
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindUserGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindUserGrid();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string name = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtFullName")).Text;
            string email = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtEmail")).Text;
            string password = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtPassword")).Text;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "UPDATE Users SET FullName=@FullName, Email=@Email, Password=@Password WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@UserID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1;
            BindUserGrid();
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserID=@UserID", con);
                cmd.Parameters.AddWithValue("@UserID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindUserGrid();
        }

        // Events Grid
        private void BindEventGrid()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Event" +
                    "", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewEvents.DataSource = dt;
                GridViewEvents.DataBind();
                lblEventCount.Text = dt.Rows.Count.ToString();
            }
        }

        // Registrations Grid
        private void BindRegistrationGrid()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Registration", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRegistrations.DataSource = dt;
                GridViewRegistrations.DataBind();
                lblRegistrationCount.Text = dt.Rows.Count.ToString();
            }
        }

        protected void GridViewRegistrations_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridViewRegistrations.EditIndex = e.NewEditIndex;
            BindRegistrationGrid();
        }

        protected void GridViewRegistrations_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewRegistrations.EditIndex = -1;
            BindRegistrationGrid();
        }

        protected void GridViewRegistrations_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewRegistrations.Rows[e.RowIndex];
            string id = GridViewRegistrations.DataKeys[e.RowIndex].Value.ToString();
            string name = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtStudentName")).Text;
            string eventName = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtEventName")).Text;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "UPDATE EventRegistrations SET StudentName=@FullName, EventName=@EventName WHERE RegistrationID=@RegistrationID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FullName", name);
                cmd.Parameters.AddWithValue("@EventName", eventName);
                cmd.Parameters.AddWithValue("@RegistrationID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            GridViewRegistrations.EditIndex = -1;
            BindRegistrationGrid();
        }

        // Toggle views
        protected void btnTotalUsers_Click(object sender, EventArgs e)
        {
            UserCard.Visible = true;
            EventCard.Visible = false;
            RegistrationCard.Visible = false;
        }

        protected void btnTotalEvents_Click(object sender, EventArgs e)
        {
            UserCard.Visible = false;
            EventCard.Visible = true;
            RegistrationCard.Visible = false;
        }

        protected void btnTotalRegistrations_Click(object sender, EventArgs e)
        {
            UserCard.Visible = false;
            EventCard.Visible = false;
            RegistrationCard.Visible = true;
        }

        protected void btnEventRegistrationsNav_Click(object sender, EventArgs e)
        {
            UserCard.Visible = false;
            EventCard.Visible = false;
            RegistrationCard.Visible = true;
        }

    }
}
