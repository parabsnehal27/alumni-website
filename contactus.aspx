<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="alumniweb.contactus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="feedback-form">
         <a href="home.aspx" class="back-button">← Back to Home Page</a>
        <div class="container">
            <h2>Contact Us Form</h2>

            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input" />
                <asp:RequiredFieldValidator ControlToValidate="txtName" ErrorMessage="* Required" CssClass="validator" ForeColor="Red" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email" />
                <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="* Required" CssClass="validator" ForeColor="Red" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblBatch" runat="server" Text="Passing Year"></asp:Label>
                <asp:DropDownList ID="ddlBatch" runat="server" CssClass="input" />
                <asp:RequiredFieldValidator 
                    ID="rfvBatch" 
                    ControlToValidate="ddlBatch" 
                    InitialValue="" 
                    ErrorMessage="* Please select a year" 
                    CssClass="validator" 
                    ForeColor="Red" 
                    runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblComments" runat="server" Text="Your Feedback"></asp:Label>
                <asp:TextBox ID="txtFeedback" runat="server" CssClass="input" TextMode="MultiLine" Rows="5" />
                <asp:RequiredFieldValidator ControlToValidate="txtFeedback" ErrorMessage="* Required" CssClass="validator" ForeColor="Red" runat="server" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="submit-btn" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
