<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="alumniweb.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Alumni Network</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>

        .hero {
    background-color: #4B286D;
    color: white;
    padding: 60px 30px;
}
.hero h1 {
    font-size: 3rem;
    font-weight: bold;
}
.event-card, .news-card {
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 15px;
}
.btn-custom {
    background-color: #4B286D;
    color: white;
}
.section-title {
    margin-top: 40px;
    margin-bottom: 20px;
}
.navbar .nav-link, .navbar .navbar-brand {
    color: #4B286D !important;
    font-weight: 600;
 }
.navbar .nav-link:hover {
    color: #2e1b47 !important;
}
.navbar .nav-link {
    position: relative;
    padding-bottom: 5px; /* little space for the underline */
}

.navbar .nav-link::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 0%;
    height: 2px;
    background-color: #4B286D; /* purple underline */
    transition: width 0.3s ease; /* smooth animation */
}

.navbar .nav-link:hover::after,
.navbar .nav-link.active::after {
     width: 100%;
}
.navbar .nav-link.active {
    color: #2e1b47 !important; /* darker purple text */
}
/*.fade-in-text {
    opacity: 0;
    animation: fadeIn 2s ease-in forwards;
    animation-delay: 1s;*/ /* Optional: delay before animation starts */
/*}

@keyframes fadeIn {
    to {
        opacity: 1;
    }
}*/
@keyframes fadeLetter {
to {
    opacity: 1;
    transform: translateY(0);
    }
}

#animated-paragraph span {
    display: inline-block;
    transform: translateY(10px);
}
       
    body {
        font-family: Arial, sans-serif;
        background: #f7f7f7;
        margin: 0;
        padding: 0;
    }
    h2 {
    color: #4B286D !important;
    margin-top: 30px;
    font-weight: 800;
}
    .events-container {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        justify-content: center;
        margin-top: 30px;
        padding: 20px;
    }
    .event-card {
        background: #fff;
        padding: 50px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .event-card:hover {
        transform: translateY(-10px) scale(1.02);
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }
    .event-date {
        color: #777;
        font-size: 14px;
        margin-bottom: 8px;
    }
    .event-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
        
        color: #4B286D !important;
    }
    .event-description {
        font-size: 14px;
        color: #555;
        margin-bottom: 10px;
    }
    .event-details {
        font-size: 13px;
        color: #444;
        display: none; /* hidden by default */
        margin-top: 10px;
    }
    .event-card.active .event-details {
        display: block;
        animation: fadeIn 0.5s ease;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px);}
        to { opacity: 1; transform: translateY(0);}
    }
   
    .view-all-button {
    background-color: #4B286D;
    color: white;
    padding: 12px 30px;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s, border 0.3s;
}
.view-all-button:hover {
   background-color: white;
    color: #4B286D;
    
}



    </style>
    <script>
        function toggleCard(el) {
            el.classList.toggle('active');
        }
    </script>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-white">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Alumni</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link " href="aboutus.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link " href="AllEvents.aspx">Events</a></li>
                    <li class="nav-item"><a class="nav-link " href="cs.aspx">Notes</a></li>
                    <li class="nav-item"><a class="nav-link " href="link.aspx">Project</a></li>
                    <li class="nav-item"><a class="nav-link " href="members.aspx">Members</a></li>
                    <li class="nav-item"><a class="nav-link " href="contactus.aspx">Contact</a></li>
                    <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <%= Session["username"] %>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                    <li>
                    <div class="card" style="width: 18rem;">
                    <div class="card-body">
                    <h5 class="card-title"><%= Session["username"] %></h5>
                    <p class="card-text">
                        <strong>Email:</strong> <%= Session["email"] %><br />
                        <strong>Phone:</strong> <%= Session["mobile"] %>
                    </p>
                    <a href="logout.aspx" class="btn btn-custom">Logout</a>
                </div>
            </div>
        </li>
    </ul>
</li>

                </ul>
            </div>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <div class="hero d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Welcome to the DES's NMITD Alumni Association</h1>
                    <p id="animated-paragraph">Our alumni community is more than a network — it's a lifelong connection. This platform serves as a bridge between the past and the future, bringing together graduates from all walks of life who once shared the same classrooms, dreams, and aspirations.

Here, you can reconnect with old friends, discover inspiring stories of fellow alumni, and stay updated with the latest happenings at your alma mater. Whether you're looking to mentor current students, explore career opportunities, attend events, or simply reminisce about your college days, this space is built for you.

Join us in celebrating the legacy we’ve built together — because while your journey may have started here, it doesn’t end at graduation. Once a part of the  family, always a part of it</p>
                </div>
                <div class="col-md-6">
                   
    <div id="alumniCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner rounded">
            <div class="carousel-item active">
                <img src="Images/alumni1.jpg" class="d-block w-100" alt="Alumni Image 1" />
            </div>
            <div class="carousel-item">
                <img src="Images/alumni2.jpg" class="d-block w-100" alt="Alumni Image 2" />
            </div>
            <div class="carousel-item">
                <img src="Images/alumni3.jpg" class="d-block w-100" alt="Alumni Image 3" />
            </div>
        </div>
        <!-- Carousel Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#alumniCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#alumniCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
             
            </div>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="container">
        <!-- Upcoming Events -->
        <form id="form1" runat="server">
    <div style="text-align:center;">
        <h2>Upcoming Events</h2>

        <div class="events-container">
            <asp:Repeater ID="rptEvents" runat="server">
                <ItemTemplate>
                    <div class="event-card" onclick="toggleCard(this)">
                        <div class="event-date">
                            <%# Eval("Event Date", "{0:MMM dd yyyy}") %>
                        </div>
                        <div class="event-title">
                            <%# Eval("Title") %>
                        </div>
                        <div class="event-description">
                            <%# Eval("Description") %>
                        </div>

                        <div class="event-details">
                            <strong>Location:</strong> <%# Eval("Location") %><br />
                            <strong>Time:</strong> <%# Eval("Time") %><br />
                            <strong>Branch:</strong> <%# Eval("branch") %><br />
                            <strong>Batch:</strong> <%# Eval("Batch") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:Button  ID="btnViewAll" runat="server" Text="View All Events" CssClass="view-all-button" OnClick="btnViewAll_Click" />
    </div>
</form>

        <!-- Stay Connected -->
        <div class="row mt-5 align-items-center">
            <div class="col-md-6">
                <img src="Images/alumni1.jpg" class="img-fluid rounded" />
            </div>
            <div class="col-md-6">
                <h3>Stay Connected</h3>
                <p>Lorem ipsum dolor udia rising elit, sed diam anuimma.</p>
                <!--<a class="btn btn-custom" href="#">Learn More</a>-->
            </div>
        </div>

        <!-- Alumni News 
        <h2 class="section-title">Alumni News</h2>
        <div class="row">
            <div class="col-md-4">
                <img src="Images/person.jpg" class="img-fluid rounded" />
            </div>
            <div class="col-md-8">
                <div class="news-card">
                    <h5>Alumni Success Story</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam anuimma.</p>
                </div>
                <div class="news-card">
                    <h5>Campus Update</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam anuimma.</p>
                </div>
            </div>
        </div>
    </div>-->
    <script>
        const paragraph = document.getElementById('animated-paragraph');
        const text = paragraph.innerText;
        paragraph.innerHTML = '';

        text.split('').forEach((char, index) => {
            const span = document.createElement('span');
            if (char === ' ') {
                span.innerHTML = '&nbsp;'; // if it's a space, use non-breaking space
            } else {
                span.innerText = char;
            }
            span.style.opacity = 0;
            span.style.animation = `fadeLetter 0.05s forwards`;
            span.style.animationDelay = `${index * 0.05}s`;
            paragraph.appendChild(span);
        });
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
