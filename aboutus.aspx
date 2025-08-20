<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="alumniweb.aboutus" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Alumni Portal</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        .about-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #4B286D;
            margin-bottom: 20px;
        }
        p, li {
            font-size: 16px;
            line-height: 1.7;
            color: #333333;
        }
        ul {
            margin-top: 10px;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <a href="home.aspx" class="back-button">← Back to Home Page</a>
        <div class="about-container">
            <h2>About Our Alumni Portal</h2>
            <asp:Literal ID="litAboutContent" runat="server" />
        </div>
    </form>
</body>
</html>