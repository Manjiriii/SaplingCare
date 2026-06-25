<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="SaplingCare.Features" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Features – SaplingCare</title>
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/features.css" rel="stylesheet" />
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
    <link href="Content/navbar.css" rel="stylesheet" />
    <link href="Content/forms-common.css" rel="stylesheet" />
    <link href="Content/contact-tooltip.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <!-- Background Video -->
<video autoplay muted loop playsinline id="bg-video">
    <source src="Videos/nature.mp4" type="video/mp4">
</video>

<div class="app-content">

    <div class="screen screen-landing">
        <div class="landing-overlay">

 <!-- NAV -->
 <nav class="top-nav">
     <div class="nav-left">
         <div class="logo-circle">🌿</div>
         <span class="nav-logo-text">SaplingCare</span>
     </div>

     <div class="nav-links">
         <a href="Landing.aspx" class="nav-link">Home</a>
         <a href="About.aspx" class="nav-link">About</a>
         <a href="Features.aspx" class="nav-link active-link">Features</a>
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

            <!-- FEATURES SECTION -->
            <section class="features-section">
                <h2>Our Features</h2>

                <div class="coverflow">

                    <!-- LEFT ARROW -->
                    <button type="button" class="arrow left" onclick="moveSlide(-1)">
                        &#10094;
                    </button>

                    <!-- CARD TRACK -->
                    <div class="coverflow-track">

                        <!-- CARD 1 -->
                        <div class="feature-card active">
                            <img src="Images/monitoring.jpg" class="feature-img" />
                            <h3>Smart Monitoring</h3>
                            <p>
                                Track sapling health, growth and status in real time
                                using a simple and clean dashboard.
                            </p>
                        </div>

                        <!-- CARD 2 -->
                        <div class="feature-card">
                            <img src="Images/watering.jpg" class="feature-img" />
                            <h3>Watering Records</h3>
                            <p>
                                Keep daily watering records to ensure no sapling
                                is neglected or forgotten.
                            </p>
                        </div>

                        <!-- CARD 3 -->
                        <div class="feature-card">
                            <img src="Images/analytics.png" class="feature-img" />
                            <h3>Data & Analytics</h3>
                            <p>
                                View plantation statistics and reports that help
                                improve green initiatives.
                            </p>
                        </div>

                        <!-- CARD 4 -->
                        <div class="feature-card">
                            <img src="Images/community.jpg" class="feature-img" />
                            <h3>Community Participation</h3>
                            <p>
                                Encourage students, staff, and volunteers to actively
                                participate in plantation and sapling care activities.
                            </p>
                        </div>

                    </div>

                    <!-- RIGHT ARROW -->
                    <button type="button" class="arrow right" onclick="moveSlide(1)">
                        &#10095;
                    </button>

                </div>
            </section>

        </div>
    </div>

</form>

<!-- JAVASCRIPT (Client side) -->
<script>
    let currentIndex = 0;   //Tracks active card
    //DOM - Document Object Model-- allows JavaScript to access and modify the elements.
    function moveSlide(direction) {
        const cards = document.querySelectorAll(".feature-card");

        cards[currentIndex].classList.remove("active");

        currentIndex += direction;

        if (currentIndex < 0) {
            currentIndex = cards.length - 1;
        }
        if (currentIndex >= cards.length) {
            currentIndex = 0;
        }

        cards[currentIndex].classList.add("active");
    }
</script>

</body>
</html>
