using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace alumniweb
{
    public partial class aboutus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string aboutContent = @"
                    <p>Welcome to the Alumni Portal of our institution. This platform is designed to celebrate the legacy of our graduates, foster meaningful connections, and support lifelong engagement with the alumni community.</p>
                    
                    <p>Our mission is to:</p>
                    <ul>
                        <li>Strengthen the bond between alumni and the institution</li>
                        <li>Highlight alumni achievements and milestones</li>
                        <li>Facilitate networking and mentorship opportunities</li>
                        <li>Promote collaboration in academic and career development</li>
                        <li>Organize reunions, events, and webinars</li>
                        <li>Encourage alumni to contribute to student success and innovation</li>
                    </ul>

                    <p>We believe that every alumnus is a part of our extended family. This portal serves as your gateway to stay informed, involved, and inspired—no matter where life takes you.</p>

                    <p><strong>Together, we build a legacy of excellence.</strong></p>
                ";

                litAboutContent.Text = aboutContent;
            }

        }
    }
}