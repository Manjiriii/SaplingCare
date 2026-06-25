<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="SaplingCare.Landing" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>SaplingCare - Plantation Monitoring App</title>
    <link rel="stylesheet" href="Content/style.css" />
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
    <link href="Content/navbar.css" rel="stylesheet" />
    <link href="Content/landing.css" rel="stylesheet" />
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

                <!-- Top navigation bar -->
                <nav class="top-nav">
                    <div class="nav-left">
                        <div class="logo-circle">🌿</div>
                        <span class="nav-logo-text">SaplingCare</span>
                    </div>
                    <!-- Navigation links to different pages-->
                    <div class="nav-links">
                        <a href="Landing.aspx" class="nav-link active-link">Home</a>
                        <a href="About.aspx" class="nav-link">About</a>
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

                <!-- HERO -->
                <div class="hero hero-pro">

                    <!-- LEFT -->
                    <div class="hero-left">
                        <p class="eyebrow">Community Engagement Project • Plantation & Care</p>

                        <h1 class="hero-main-title">Monitor Your<br>Green Impact</h1>

                        <p class="hero-description">
                            SaplingCare Monitor helps volunteers track watering, health status,
                            and survival of planted saplings—turning <strong>plant & forget</strong>
                            into <strong>plant & care</strong>.
                        </p>

                        <!-- BUTTONS -->
                        <div class="hero-cta-row">
                            <a href="Register.aspx"><button type="button" class="hero-cta primary">Start as Volunteer</button></a>
                            <a href="Login.aspx"><button type="button" class="hero-cta secondary">I’m a Coordinator</button></a>
                        </div>

                        <!-- STATS -->
                        <div class="hero-stats">

                            <div class="stat-card">
                                <asp:Label ID="lblTracked" runat="server" CssClass="stat-number" />
                                <span class="stat-label">Saplings Tracked</span>
                            </div>

                            <div class="stat-card">
                                <asp:Label ID="lblSurvival" runat="server" CssClass="stat-number" />
                                <span class="stat-label">Survival Focus</span>
                            </div>

                            <div class="stat-card">
                                <asp:Label ID="lblWeeks" runat="server" CssClass="stat-number" />
                                <span class="stat-label">Care Monitoring</span>
                            </div>

                        </div>
                    </div>

                    <!-- RIGHT -->
                    <div class="hero-right">

                        <!-- TODAY'S SNAPSHOT -->
                        <div class="hero-card glass">
                            <p class="mini-title">Today's Snapshot</p>

                            <div class="mini-row">
                                <span class="mini-label">Saplings</span>
                                <asp:Label ID="lblSaplings" runat="server" CssClass="mini-value" />
                            </div>

                            <div class="mini-row">
                                <span class="mini-label">Watered Today</span>
                                <asp:Label ID="lblWatered" runat="server" CssClass="mini-value success" />
                            </div>

                            <div class="mini-row">
                                <span class="mini-label">Need Attention</span>
                                <asp:Label ID="lblAttention" runat="server" CssClass="mini-value alert" />
                            </div>

                            <div class="mini-progress">
                                <div class="mini-progress-bar"></div>
                            </div>

                            <p class="mini-footnote">Data from volunteer updates</p>
                        </div>

                    </div>
                </div>

                <section id="about-section" style="margin-top:24px;">
                    <h3>Plant • Track • Care</h3>
                </section>

            </div>
        </div>

    </div>

</form>
</body>
</html>
