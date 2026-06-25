<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SaplingCare.About" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About – SaplingCare</title>
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/about.css" rel="stylesheet" />
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
    <link href="Content/navbar.css" rel="stylesheet" />
    <link href="Content/contact-tooltip.css" rel="stylesheet" />
    <link href="Content/forms-common.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <!-- Background Video -->
    <video autoplay muted loop playsinline id="bg-video">
        <source src="Videos/nature.mp4" type="video/mp4" />
    </video>

    <div class="app-content">
        <div id="screen-app" class="screen">

<!-- NAV -->
<nav class="top-nav">
    <div class="nav-left">
        <div class="logo-circle">🌿</div>
        <span class="nav-logo-text">SaplingCare</span>
    </div>

    <div class="nav-links">
        <a href="Landing.aspx" class="nav-link">Home</a>
        <a href="About.aspx" class="nav-link active-link">About</a>
        <a href="Features.aspx" class="nav-link">Features</a>
        <div class="nav-link contact-item">
            Contact
            <a href="mailto:saplingcarespace@gmail.com" class="contact-email">
                saplingcarespace@gmail.com
            </a>
        </div>

    </div>

    <div class="nav-actions">
        <a href="Login.aspx"><button type="button" class="nav-btn ghost">Login</button></a>
        <a href="Register.aspx"><button type="button" class="nav-btn solid">Get Started</button></a>
    </div>
</nav>

            <!-- ABOUT SECTION -->
            <section class="about-section">

                <h2>About SaplingCare</h2>

                <p class="about-intro">
                    SaplingCare is a plantation monitoring system developed to
                    ensure long-term care of planted saplings by tracking
                    watering schedules, health status, and maintenance history.
                </p>

                <div class="about-cards">

                    <div class="about-card">
                        <img src="Images/mission.jpg" alt="Mission of SaplingCare" />
                        <h3>Our Mission</h3>
                        <p>
                            To promote responsible plantation by ensuring that
                            every sapling planted is properly cared for and
                            regularly monitored.
                        </p>
                    </div>

                    <div class="about-card">
                        <img src="Images/monitor.jpg" alt="Monitoring System" />
                        <h3>What We Do</h3>
                        <p>
                            The system provides an easy-to-use dashboard where
                            sapling details, watering records, and health
                            updates can be maintained efficiently.
                        </p>
                    </div>

                    <div class="about-card">
                        <img src="Images/impact.jpg" alt="Environmental Impact" />
                        <h3>Why SaplingCare</h3>
                        <p>
                            Many plantation drives fail due to lack of follow-up.
                            SaplingCare focuses on accountability and
                            sustainability to improve survival rates.
                        </p>
                    </div>

                    <div class="about-card">
    <img src="Images/users.jpeg" class="about-img" />
    <h3> Who Can Use It?</h3>
    <p>
        SaplingCare can be used by volunteers, coordinators,
        schools, colleges, and organizations involved in
        plantation and green initiatives.
    </p>
</div>


                </div>

            </section>

        </div>
    </div>

</form>

</body>
</html>
