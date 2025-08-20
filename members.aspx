<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="members.aspx.cs" Inherits="alumniweb.members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card-custom {
            margin: 10px;
            width: 18rem;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <a href="home.aspx" class="back-button">← Back to Home Page</a>
    <div class="mb-4">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control d-inline-block w-auto" Placeholder="Search by Name"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="Button1_Click" Color="#4B286D"/>
    </div>

    <div id="cardSection" runat="server" class="card-container">
        <asp:Repeater ID="rptResults" runat="server">
            <ItemTemplate>
                <div class="card card-custom shadow-sm text-center">
                    <img src="Images/profile.jpg" alt="Profile Image" class="rounded-circle mx-auto d-block mt-3" style="width: 100px; height: 100px; object-fit: cover;">
                    <div class="card-body">
                <h5 class="card-title"><%# Eval("FullName") %></h5>
                <h6 class="card-subtitle mb-2 text-muted"><%# Eval("Branch") %> | Batch of <%# Eval("PassingYear") %></h6>
                <p class="card-text">
                    <strong>Email:</strong> <%# Eval("Email") %><br />
                </p>
            </div>
        </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>