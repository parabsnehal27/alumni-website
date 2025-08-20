<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="alumniweb.RegisterEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            padding: 50px;
            text-align: center;
        }
        .container {
            background-color: #fff;
            display: inline-block;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #4B286D;
            margin-bottom: 30px;
        }
        .label-text {
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
            display: block;
        }
        #btnPay {
            background-color: #4B286D;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }
        #btnPay:hover {
            background-color: #3a1f56;
        }
        #lblError {
            color: red;
            margin-top: 15px;
            display: block;
        }
        .label-text {
        font-size: 18px;
        color: #333;
        margin-bottom: 10px;
        display: inline-block;
        text-align: left;
        font-weight: bold;
    }

    /* Optional: Style labels with a specific ID */
    #StudentName,
    #lblStudentEmail,
    #lblStudentMobile,
    #lblEventName {
        font-size: 18px;
        color: #4B286D;
        margin-bottom: 15px;
        font-weight: normal;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="StudentName" runat="server" />
            <br />
            <asp:Label ID="lblStudentEmail" runat="server" />
            <br />
            <asp:Label ID="lblStudentMobile" runat="server" />

            <br />

            <asp:Label ID="lblEventName" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnPay" runat="server" Text="Pay & Register" OnClientClick="payNow(); return false;"  />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            
<asp:HiddenField ID="hdnAmount" runat="server" Value="500" />
<asp:HiddenField ID="hdnEventID" runat="server" />
<asp:HiddenField ID="hdnStudentID" runat="server" />
            <asp:HiddenField ID="hdnPaymentID" runat="server" />
<asp:Button ID="btnHiddenSubmit" runat="server" Text="Submit Payment" Style="display:none;" OnClick="btnHiddenSubmit_Click" />
        </div>
    </form>
</body>
</html>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script type="text/javascript">
    function payNow() {
        var amount = document.getElementById('<%= hdnAmount.ClientID %>').value * 100; // Razorpay accepts amount in paise
        var studentId = document.getElementById('<%= hdnStudentID.ClientID %>').value;
        var eventId = document.getElementById('<%= hdnEventID.ClientID %>').value;

        var options = {
            "key": "Enter_your_key",// Replace with your Razorpay key <asp:Label ID="lblStudentName" runat="server"></asp:Label><br />
            "amount": 50000,
            "currency": "INR",
            "name": "Alumni Event",
            "description": "Event Registration Fee",
            "handler": function (response) {
                // Payment Successful
                var paymentId = response.razorpay_payment_id;

                // After successful payment, submit hidden form or call Ajax to save in DB
                document.getElementById('<%=hdnPaymentID.ClientID%>').value = paymentId;
                document.getElementById('btnHiddenSubmit').click();  // Hidden button to postback
            },
            "theme": {
                "color": "#4B286D"
            }
        };
        var rzp = new Razorpay(options);
        rzp.open();
    }
</script>
