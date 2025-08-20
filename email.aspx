<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="alumniweb.email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Email Sender</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 40px;
        }

        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 700px;
            margin: auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        textarea,
        asp\:TextBox {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"],
        .aspNet-Button,
        asp\:Button {
            background-color: #4B286D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover,
        .aspNet-Button:hover {
            background-color: #3a2055;
        }

        asp\:Label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: green;
        }

        ::placeholder {
            color: #888;
        }
         h1 {
     text-align: center;
     margin-top: 40px;
     font-weight: bold;
     color: #4B286D;
     font-size: 42px;
 }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <a href="admin_panel.aspx" class="back-button">← Back to Admin Panel</a>
        <div>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#4B286D" Text="Email " Font-Bold="true" Font-Size="XX-Large"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtBatchYear" runat="server" Placeholder="Enter Batch Year"></asp:TextBox><br />
<asp:TextBox ID="txtSubject" runat="server" Placeholder="Subject"></asp:TextBox><br />
<asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Email Body" Height="214px" Width="664px"></asp:TextBox><br />
<asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="btnSend_Click" />
<asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>

        </div>
    </form>
</body>
</html>

