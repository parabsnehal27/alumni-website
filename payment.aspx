<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="alumniweb.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 100px;
            background-color: #f7f7f7;
        }
        .message {
            background: #ffffff;
            display: inline-block;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .message h1 {
            color: #4CAF50;
        }
        .message p {
            font-size: 18px;
            margin-top: 20px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #4B286D; /* Updated button color */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .back-btn:hover {
            background-color: #3a1f56; /* Slightly darker on hover */
        }
        .thankyou-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .label {
            font-size: 18px;
            margin: 15px 0;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="thankyou-box">
             <h1>Payment Successful!</h1>
            <h2>🎉 Thank You for Registering!</h2>
            <asp:Label ID="lblPaymentID" runat="server" CssClass="label"></asp:Label><br />
            <asp:Label ID="lblDateTime" runat="server" CssClass="label"></asp:Label>

             <br />
             <br />

            <a href="AllEvents.aspx" class="back-btn">Back to Events</a>
        </div>
    </form>
</body>
</html>