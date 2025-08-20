<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="alumniweb.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Alumni Login</title>
    <style>
        html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
        #form1 {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f1f1f1;
            background-image: url('Images/login.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .login-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 40px 32px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .login-container h2 {
            color: #3E276B; /* Deep purple */
            margin-bottom: 24px;
            font-weight: 700;
            font-size: 24px;
            letter-spacing: 0.5px;
        }

/* Label styling */
        label, .aspNetLabel {
            display: block;
            margin-bottom: 6px;
            color: #3E276B;
            font-weight: 500;
            text-align: left;
        }

/* Input fields */
        input[type="text"], input[type="password"], .aspNetTextBox {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #dcdcdc;
            border-radius: 6px;
            background: #fefefe;
            font-size: 15px;
            color: #333;
            transition: 0.2s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        .aspNetTextBox:focus {
            border-color: #3E276B;
            box-shadow: 0 0 5px rgba(62, 39, 107, 0.3);
            outline: none;
        }

/* Login button */
        .aspNetButton,
        input[type="submit"] {
            background-color: #3E276B;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        .aspNetButton:hover,
        input[type="submit"]:hover {
            background-color: #5b3abf;
        }

/* Link styling */
        .aspNetHyperLink {
            color: #3E276B;
            text-decoration: underline;
            font-weight: 500;
        }

       .aspNetHyperLink:hover {
            color: #5b3abf;
            text-decoration: none;
        }

/* Validator message */
        .aspNetValidator {
            display: block;
            color: #e74c3c;
            font-size: 13px;
            margin-bottom: 8px;
        }

/* Custom Alert Box */
        #customAlert {
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            border: 2px solid #3E276B;
            padding: 20px;
            z-index: 1000;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: none;
            text-align: center;
            width: 300px;
        }

        #customAlert p {
            color: #3E276B;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #customAlert button {
            padding: 8px 16px;
            background-color: #3E276B;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        #customAlert button:hover {
            background-color: #5b3abf;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>           
            <div id="customAlert" style="display:none; position:fixed; top:30%; left:50%; transform:translate(-50%, -50%); background-color:white; border:2px solid #007bff; padding:20px; z-index:1000; border-radius:10px; box-shadow: 0px 0px 10px gray;">
    <p id="alertMessage" style="margin:0; font-weight:bold;"></p>
    <button onclick="hideAlert()" style="margin-top:10px; padding:5px 10px; background-color:#007bff; color:white; border:none; border-radius:5px;">OK</button>
</div>
        </div>
<div class="login-container">
    <h2>LOGIN</h2>
    <asp:Label ID="Label1" runat="server" Text="Enter your Username:" CssClass="aspNetLabel"></asp:Label>
    <asp:TextBox ID="Uname" runat="server" CssClass="aspNetTextBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Uname" ErrorMessage="* Kindly fill the username" ForeColor="Red" CssClass="aspNetValidator"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Enter your Password:" CssClass="aspNetLabel"></asp:Label>
    <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="aspNetTextBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password" ErrorMessage="* Kindly fill the password" ForeColor="Red" CssClass="aspNetValidator"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="LOGIN" CssClass="aspNetButton" />
    <br />
    <asp:Label ID="Label5" runat="server" Text="New User? "></asp:Label>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="registration.aspx" CssClass="aspNetHyperLink">Sign up</asp:HyperLink>
</div>        
       
                        <script type="text/javascript">
                            function showAlert(msg) {
                                document.getElementById("alertMessage").innerText = msg;
                                document.getElementById("customAlert").style.display = "block";
                            }

                            function hideAlert() {
                                document.getElementById("customAlert").style.display = "none";
                            }
                        </script>
        
    </form>
</body>
</html>
