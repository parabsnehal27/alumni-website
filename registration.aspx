<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="alumniweb.registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Alumni Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            background-image: url('Images/cap.jpg');



            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }

        h3 {
            color: #3C2E80;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
            color: #333;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .radio-group {
            margin-top: 5px;
        }

        .radio-group input {
            margin-right: 8px;
        }

        .error {
            color: #ff3300;
            font-size: 0.85em;
        }

        .button {
            background-color: #3C2E80;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #3C2E80;
            text-decoration: none;
            font-weight: bold;
        }

        #customAlert {
            display: none;
            position: fixed;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 2px solid #3C2E80;
            padding: 20px;
            z-index: 1000;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
        }

        #customAlert button {
            background-color: #3C2E80;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h3>REGISTRATION</h3>

            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <!-- Full Name -->
            <label for="Uname">Full Name</label>
            <asp:TextBox ID="Uname" runat="server" />
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator1" runat="server" ControlToValidate="Uname" ErrorMessage="Please enter your name." />

            <!-- Gender -->
            <label>Gender</label>
            <asp:RadioButtonList ID="gender" runat="server" CssClass="radio-group" RepeatDirection="Horizontal" Width="325px">
                <asp:ListItem Value="male">Male</asp:ListItem>
                <asp:ListItem Value="female">Female</asp:ListItem>
                <asp:ListItem Value="others">Others</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator6" runat="server" ControlToValidate="gender" ErrorMessage="Please select your gender." />

            <!-- Email -->
            <label>Email</label>
            <asp:TextBox ID="email" runat="server" />
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" ErrorMessage="Please enter your email." />
            <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

            <!-- Mobile Number -->
            <label>Mobile Number</label>
            <asp:TextBox ID="mob" runat="server" />
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator4" runat="server" ControlToValidate="mob" ErrorMessage="Please enter mobile number." />
            <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator1" runat="server" ControlToValidate="mob" ErrorMessage="Invalid mobile number." ValidationExpression="^\d{10}$" />

            <!-- Passing Year -->
            <label>Passing Year</label>
            <asp:DropDownList ID="passDrop" runat="server" >
                <asp:ListItem>2010</asp:ListItem>
                <asp:ListItem>2011</asp:ListItem>
                <asp:ListItem>2012</asp:ListItem>
                <asp:ListItem>2013</asp:ListItem>
                <asp:ListItem>2014</asp:ListItem>
                <asp:ListItem>2015</asp:ListItem>
                <asp:ListItem>2016</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2019</asp:ListItem>
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
            </asp:DropDownList>
                    
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator7" runat="server" ControlToValidate="passDrop" ErrorMessage="Please select passing year." />

            <!-- Branch -->
            <label>Branch</label>
            <asp:DropDownList ID="branchDrop" runat="server" >
                <asp:ListItem Value="bcom">BACHELOR OF COMMERCE [(B.Com.)]</asp:ListItem>
                <asp:ListItem Value="bms">BACHELOR OF COMMERCE - MANAGEMENT STUDIES [B.Com.(M.S.)]</asp:ListItem>
                <asp:ListItem Value="baf">BACHELOR OF COMMERCE - ACCOUNTING AND FINANCE [B.Com.(A.F.)]</asp:ListItem>
                <asp:ListItem Value="bbi">BACHELOR OF COMMERCE - BANKING AND INSURANCE [B.Com.(B.I.)]</asp:ListItem>
                <asp:ListItem Value="bfm">BACHELOR OF COMMERCE - FINANCIAL MARKETS [B.Com.(F.M.)]</asp:ListItem>
                <asp:ListItem Value="bmm">BACHELOR OF ARTS - MULTIMEDIA AND MASS COMMUNICATION [B.A.M.M.C.]</asp:ListItem>
                <asp:ListItem Value="bscit">BACHELOR OF SCIENCE - INFORMATION TECHNOLOGY [B.Sc.(I.T.)]</asp:ListItem>
                <asp:ListItem Value="mscit">MASTER OF SCIENCE (INFORMATION TECHNOLOOGY) - [M.Sc.(I.T.)]</asp:ListItem>
                <asp:ListItem Value="mca">MASTER OF COMPUTER APPLICATION [M.C.A]</asp:ListItem>
                <asp:ListItem Value="mms">MASTER OF MANAGEMENT STUDIES [M.M.S]</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator8" runat="server" ControlToValidate="branchDrop" ErrorMessage="Please select branch." />

            <!-- Role -->
            <label>Role</label>
            <asp:RadioButtonList ID="role" runat="server" CssClass="radio-group" RepeatDirection="Horizontal" Width="351px">
                <asp:ListItem Value="student">Current Student</asp:ListItem>
                <asp:ListItem Value="alumni">Alumni</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator9" runat="server" ControlToValidate="role" ErrorMessage="Please select your role." />

            <!-- Password -->
            <label>Password</label>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator2" runat="server" ControlToValidate="pwd" ErrorMessage="Please enter a password." />

            <!-- Submit Button -->
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" OnClick="Button1_Click" />

            <!-- Login Link -->
            <div class="login-link">
                Already a User? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="login.aspx">LOGIN</asp:HyperLink>
            </div>

            <!-- Custom Alert -->
            <div id="customAlert">
                <p id="alertMessage"></p>
                <button onclick="hideAlert()">OK</button>
            </div>

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
