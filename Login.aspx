<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SaplingCare.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login – SaplingCare</title>

    <!-- Link CSS -->
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
    <link href="Content/forms-common.css" rel="stylesheet" />
      <link href="Content/login.css" rel="stylesheet" />
</head>
<body>

    <!-- Background Video -->
    <video autoplay muted loop playsinline id="bg-video">
        <source src="Videos/nature.mp4" type="video/mp4" />
    </video>

    <div class="app-content">

        <div id="screen-login" class="screen">

            <h2>Login</h2>
            <p>Login with your registered email and password.</p>

            <form id="form1" runat="server">

                <label>Email</label>
                <asp:TextBox 
                    ID="txtEmail" 
                    runat="server" 
                    TextMode="Email"
                    CssClass="login-input" />
                
                <label>Password</label>
                <asp:TextBox 
                    ID="txtPassword" 
                    runat="server" 
                    TextMode="Password"
                    CssClass="login-input" />

                <div class="button-row">

                    <asp:Button 
                        ID="btnLogin" 
                        runat="server" 
                        Text="Login"
                        CssClass="ghost-outline"
                        OnClick="btnLogin_Click" />

                    <a href="Landing.aspx">
                       <button type="button" class="ghost">
                            Back to Home
                        </button>
                    </a>

                </div>

                <asp:Label ID="lblMessage" runat="server" />

            </form>

        </div>

    </div>

</body>
</html>
