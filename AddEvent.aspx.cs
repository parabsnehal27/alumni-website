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
    public partial class AddEvent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }

        }
        private void LoadGrid()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlDataAdapter da = new SqlDataAdapter("SELECT [EventID], Title, Description, Location, [Event Date], Time, Batch , branch FROM Event", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "reg");

            if (ds.Tables[0].Rows.Count == 0)
            {
                GridView1.DataSource = null;
            }
            else
            {
                GridView1.DataSource = ds;
            }

            GridView1.DataBind();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }


        protected void btnadd_Click(object sender, EventArgs e)
        {
            con.Open();

            // Step 1: Find max EventID
            SqlCommand cmdGetMax = new SqlCommand("SELECT ISNULL(MAX(EventID), 0) FROM Event", con);
            int newEventId = (int)cmdGetMax.ExecuteScalar() + 1;

            // Step 2: Now Insert with newEventId
            if (string.IsNullOrEmpty(txttitle.Text) || string.IsNullOrEmpty(txtdescrip.Text) ||
                string.IsNullOrEmpty(txtloc.Text) || string.IsNullOrEmpty(txtdate.Text) ||
                string.IsNullOrEmpty(txttime.Text) || string.IsNullOrEmpty(txtBatch.Text) || string.IsNullOrEmpty(txtdepartment.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter all details...');", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Event (EventID, Title, Description, Location, [Event Date], Time, Status, Batch, Branch) VALUES(@id, @title, @desc, @loc, @date, @time, @status, @Batch, @department)", con);

                cmd.Parameters.AddWithValue("@id", newEventId);
                cmd.Parameters.AddWithValue("@title", txttitle.Text);
                cmd.Parameters.AddWithValue("@desc", txtdescrip.Text);
                cmd.Parameters.AddWithValue("@loc", txtloc.Text);
                cmd.Parameters.AddWithValue("@date", DateTime.Parse(txtdate.Text));
                cmd.Parameters.AddWithValue("@time", txttime.Text);
                cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Batch", txtBatch.Text);
                cmd.Parameters.AddWithValue("@department", txtdepartment.Text);

                cmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New Event Added...');", true);

                ClearFields();
                LoadGrid();
            }

            con.Close();
        }


        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null || string.IsNullOrEmpty(txttitle.Text) ||
        string.IsNullOrEmpty(txtdescrip.Text) || string.IsNullOrEmpty(txtloc.Text) ||
        string.IsNullOrEmpty(txtdate.Text) || string.IsNullOrEmpty(txttime.Text) ||
        string.IsNullOrEmpty(txtBatch.Text) || string.IsNullOrEmpty(txtdepartment.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select values through grid and fill all fields.');", true);
                return;
            }

            con.Open();

            SqlCommand cmd = new SqlCommand("UPDATE Event SET Title=@title, Description=@desc, Location=@loc, [Event Date]=@date, Time=@time, Status=@status, Branch=@department, Batch=@Batch WHERE [EventID]=@id", con);
            cmd.Parameters.AddWithValue("@title", txttitle.Text);
            cmd.Parameters.AddWithValue("@desc", txtdescrip.Text);
            cmd.Parameters.AddWithValue("@loc", txtloc.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Parse(txtdate.Text).ToString("MMM dd yyyy"));
            cmd.Parameters.AddWithValue("@time", txttime.Text);
            cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@department", txtdepartment.Text);
            cmd.Parameters.AddWithValue("@Batch", txtBatch.Text);
            cmd.Parameters.AddWithValue("@id", GridView1.SelectedRow.Cells[1].Text);

            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Event Updated...');", true);

            ClearFields();
            LoadGrid();
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            ClearFields();
        }
        private void ClearFields()
        {
            txttitle.Text = string.Empty;
            txtdescrip.Text = string.Empty;
            txtloc.Text = string.Empty;
            txttime.Text = string.Empty;
            txtdate.Text = string.Empty;
            txtBatch.Text = string.Empty;
            txtdepartment.Text = string.Empty;
            ddlstatus.SelectedIndex = -1;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Event WHERE [EventID] = @id", con);
            cmd.Parameters.AddWithValue("@id", GridView1.SelectedRow.Cells[1].Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txttitle.Text = dr["Title"].ToString();
                txtdescrip.Text = dr["Description"].ToString();
                txtloc.Text = dr["Location"].ToString();
                txttime.Text = dr["Time"].ToString();
                txtdate.Text = dr["Event Date"].ToString();
                txtdepartment.SelectedValue = dr["Branch"].ToString(); // Assuming ddlbranch is a DropDownList
                txtBatch.SelectedValue = dr["Batch"].ToString();
                ddlstatus.Text = dr["Status"].ToString();
            }
            dr.Close();
            con.Close();
        }
    }
}