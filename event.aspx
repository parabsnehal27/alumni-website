<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="alumniweb._event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Event Registrations</title>
    <style>
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 40px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <a href="admin_panel.aspx" class="back-button">← Back to Admin Panel</a>
        <h2 style="text-align:center;">All Event Registrations</h2>
        <asp:GridView ID="gvRegistrations" runat="server" AutoGenerateColumns="True" GridLines="None" />
    </form>
</body>
</html>