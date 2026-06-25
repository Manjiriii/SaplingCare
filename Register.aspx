<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="SaplingCare.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register – SaplingCare</title>
    
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
    <link href="Content/forms-common.css" rel="stylesheet" />
    <link href="Content/register.css" rel="stylesheet" />
</head>

<body>

    <!-- Background Video -->
    <video autoplay muted loop playsinline id="bg-video">
        <source src="Videos/nature.mp4" type="video/mp4" />
    </video>

    <div class="app-content">

       <div id="screen-register" class="screen">

          

            <h2>Register</h2>
            <p>Create a new account to start caring for saplings.</p>

            <form id="form1" runat="server">

                <label>Full Name</label>
                <asp:TextBox ID="txtName" runat="server" />

                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

                <label>Register As</label>

                <asp:DropDownList ID="ddlRole" runat="server">
                <asp:ListItem Text="Select Role" Value="" />
                <asp:ListItem Text="Volunteer" Value="Volunteer" />
                <asp:ListItem Text="Coordinator" Value="Coordinator" />
                </asp:DropDownList>


                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" />

                <div class="button-row">

                    <asp:Button
                        ID="btnRegister"
                        runat="server"
                        Text="Register"
                        CssClass="ghost-outline"
                        OnClick="btnRegister_Click" />

                    <a href="Login.aspx">
                        <button type="button" class="ghost">
                            Back to Login
                        </button>
                    </a>

                </div>

                <asp:Label ID="lblMessage" runat="server" />

            </form>

        </div>

    </div>

</body>
</html>
