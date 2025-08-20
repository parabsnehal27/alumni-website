using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string paymentId = Request.QueryString["paymentId"];
                string datetime = Request.QueryString["datetime"];

                lblPaymentID.Text = "Payment ID: " + paymentId;
                lblDateTime.Text = "Payment Date & Time: " + datetime;
            }
        }
    }
}