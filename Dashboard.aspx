
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SaplingCare.Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>SaplingCare Monitor – Dashboard</title>
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/base.css" rel="stylesheet" />
    <link href="Content/navbar.css" rel="stylesheet" />
    <link href="Content/layout.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">
    

    <!-- Background Video -->
    <video autoplay muted loop playsinline id="bg-video">
        <source src="Videos/nature.mp4" type="video/mp4" />
    </video>

    <div class="app-content">

        <div id="screen-app" class="screen">


       <header class="main-header">
            <div class="nav-left">
     <div class="logo-circle">🌿</div>
     <span class="nav-logo-text">SaplingCare</span><br /><br />
    
     <br>
 </div>

    <div class="header-right">
        <asp:Button 
            ID="btnLogout" 
            runat="server" 
            Text="Logout"
            CssClass="logout-btn"
            OnClick="btnLogout_Click" />
    </div>
</header>



            <!-- CURRENT SAPLINGS -->
            <section>
             <!--GridView Displays saplings in tabular format-->  
      <asp:GridView ID="gvSaplings" runat="server" AutoGenerateColumns="False" CssClass="grid" DataKeyNames="SaplingCode">
    <Columns>
        <asp:BoundField DataField="SaplingCode" HeaderText="Sapling ID" />
        <asp:BoundField DataField="SaplingName" HeaderText="Plant Name" />
        <asp:BoundField DataField="Location" HeaderText="Location" />
        <asp:BoundField DataField="LastWatered" HeaderText="Planted On" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="Health" HeaderText="Health" />
    </Columns>
</asp:GridView>
                <br />

            <!-- UPDATE SAPLING STATUS -->
            <section>
         
    <h2>Update Sapling Status</h2>

    <div class="update-form">

    <div class="form-row">
        <label>Sapling ID</label><br /><br />
        <asp:DropDownList ID="ddlSapling" runat="server"></asp:DropDownList>
    </div>
        <br />
    <div class="form-row">
        <label>Date</label><br /><br />
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />
    </div>
        <br />
<div class="form-row checkbox-row">
    <span class="checkbox-text">Watered Today</span>
    <input type="checkbox" id="chkWatered" runat="server" />
</div>
        <br />
    <div class="form-row">
        <label>Health</label><br /><br />
        <asp:DropDownList ID="ddlHealth" runat="server">
            <asp:ListItem>Good</asp:ListItem>
            <asp:ListItem>Average</asp:ListItem>
            <asp:ListItem>Poor</asp:ListItem>
        </asp:DropDownList>
    </div>
        <br />
    <div class="form-row">
        <label>Remarks (optional)</label><br /><br>
        <asp:TextBox ID="txtRemarks" runat="server"
            TextMode="MultiLine" Rows="3" />
    </div>
        <br />
    <div class="form-row">
        <asp:Button ID="btnUpdate" runat="server" 
    Text="Update" OnClick="btnUpdate_Click" />

    </div>

</div>

</section>

            <!-- UPDATE HISTORY -->
            <section>
                <h2>Update History</h2>
      <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False" CssClass="grid" DataKeyNames="HistoryId" AutoGenerateEditButton="True" OnRowEditing="gvHistory_RowEditing" OnRowCancelingEdit="gvHistory_RowCancelingEdit" OnRowUpdating="gvHistory_RowUpdating">

    <Columns>
        <asp:BoundField DataField="SaplingCode"
            HeaderText="Sapling ID"
            ReadOnly="True" />

        <asp:BoundField DataField="UpdateDate"
            HeaderText="Date"
            
            DataFormatString="{0:yyyy-MM-dd}" />

        <asp:BoundField DataField="Watered"
            HeaderText="Watered" />

        <asp:BoundField DataField="Health"
            HeaderText="Health" />

        <asp:BoundField DataField="Remarks"
            HeaderText="Remarks" />
    </Columns>
</asp:GridView>
            </section>

        </div>

    </div>

</form>

</body>
</html>
