<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="alumniweb.AddEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            padding: 30px;
        }

        label, .form-group label, asp\:Label {
            color: #4B286D;
            font-weight: bold;
        }

        .form-group, form {
            margin-bottom: 15px;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea,
        select {
            padding: 8px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-control {
            width: 300px;
        }

        asp\:Button {
            margin-right: 10px;
        }

        input[type="submit"],
        .aspNet-Button {
            background-color: #4B286D;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        .aspNet-Button:hover {
            background-color: #3a2055;
        }

        #GridView1 {
            margin-top: 30px;
            border: 1px solid #4B286D;
            width: 100%;
        }

        #GridView1 th, #GridView1 td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        #GridView1 th {
            background-color: #4B286D;
            color: white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" ForeColor="#4B286D" Height="51px" Text="Event" Width="154px" Font-Size="XX-Large" text-align="center" Font-Bold="true" ></asp:Label>
        <br />
        <br />
        <br />
       <asp:Label ID="lbltitle" runat="server" Text="Title:"></asp:Label>
<asp:TextBox ID="txttitle" runat="server"></asp:TextBox><br />

<asp:Label ID="lbldesc" runat="server" Text="Description:"></asp:Label>
<asp:TextBox ID="txtdescrip" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox><br />

<asp:Label ID="lblloc" runat="server" Text="Location:"></asp:Label>
<asp:TextBox ID="txtloc" runat="server"></asp:TextBox><br />

<asp:Label ID="lbldate" runat="server" Text="Event Date:"></asp:Label>
<asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox><br />

<asp:Label ID="lbltime" runat="server" Text="Time:"></asp:Label>
<asp:TextBox ID="txttime" runat="server" TextMode="Time"></asp:TextBox>
        <br />
        <br />
<div class="form-group">
    <label for="ddlBatch">Select Batch</label>
    <asp:DropDownList ID="txtBatch" runat="server" CssClass="form-control">
        <asp:ListItem Text="Select Batch" Value="" />
        <asp:ListItem Text="2018" Value="2018" />
        <asp:ListItem Text="2019" Value="2019" />
        <asp:ListItem Text="2020" Value="2020" />
        <asp:ListItem Text="2021" Value="2021" />
        <asp:ListItem Text="2022" Value="2022" />
        <asp:ListItem Text="2023" Value="2023" />
        <asp:ListItem Text="2024" Value="2024" />
    </asp:DropDownList>
    <br />
</div>

        <br />
        <asp:Label ID="Label7" runat="server" Text="department"></asp:Label>
&nbsp;:
        <asp:DropDownList ID="txtdepartment" runat="server">
            <asp:ListItem Text="Select Department" Value="" />
            <asp:ListItem Text="MCA" Value="MCA" />
            <asp:ListItem Text="MMS" Value="MMS" />
        </asp:DropDownList>
        <br />

        <br />

<asp:Label ID="lblstatus" runat="server" Text="Status:"></asp:Label>
<asp:DropDownList ID="ddlstatus" runat="server">
    <asp:ListItem Text="Upcoming" />
    <asp:ListItem Text="Completed" />
</asp:DropDownList><br /><br />

<asp:Button ID="btnadd" runat="server" Text="Add Event" OnClick="btnadd_Click" />
<asp:Button ID="btnupdate" runat="server" Text="Update Event" OnClick="btnupdate_Click" />
<asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" />

<br /><br />

<asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" SelectedIndex="0" AutoGenerateSelectButton="True">
</asp:GridView>
        <a href="admin_panel.aspx" class="back-button">← Back to Admin Panel</a>
    </form>
</body>
</html>
