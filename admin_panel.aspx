<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_panel.aspx.cs" Inherits="alumniweb.admin_panel" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            background-color: #0d6efd;
            min-height: 100vh;
            padding: 1rem;
            color: white;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 0.5rem;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .card {
            margin-top: 1rem;
        }
        .navbar {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <h3>Admin Panel</h3>
                    <a href="#">Dashboard</a>
                    <a href="admin_panel.aspx">Manage Users</a>
                    <a href="Addevent.aspx">Manage Events</a>
                    <a href="event.aspx">Event Registrations</a>
                    

                    <a href="email.aspx">Send Email</a>
                    
                </div>

                <!-- Main Content -->
                <div class="col-md-10">
                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid">
                            <span class="navbar-brand mb-0 h1">Welcome Admin</span>
                            <!--<div class="d-flex">
                                <img src="" class="rounded-circle" alt="Admin" />
                            </div>-->
                        </div>
                    </nav>

                    <div class="container">
                        <div class="row">
                            <!-- Total Users Card -->
                            <div class="col-md-4">
                                <div class="card text-white bg-primary">
                                    <div class="card-body text-center">
                                        <asp:LinkButton 
                                            ID="btnTotalUsers" 
                                            runat="server" 
                                            OnClick="btnTotalUsers_Click"
                                            CssClass="stretched-link text-white text-decoration-none"
                                            Style="font-size:24px;">
                                            Total Users
                                        </asp:LinkButton>
                                        <br />
                                        <asp:Label 
                                            ID="lblUserCount" 
                                            runat="server" 
                                            Font-Size="XX-Large" 
                                            Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>

                            </div>

                            <!-- Total Events Card -->
                            <div class="col-md-4">
                                <div class="card text-white bg-success">
                                    <div class="card-body text-center">
                                        <asp:LinkButton 
                                            ID="btnTotalEvents" 
                                            runat="server" 
                                            OnClick="btnTotalEvents_Click"
                                            CssClass="stretched-link text-white text-decoration-none"
                                            Style="font-size:24px;">
                                            Total Events
                                        </asp:LinkButton>
                                        <br />
                                        <asp:Label 
                                            ID="lblEventCount" 
                                            runat="server" 
                                            Font-Size="XX-Large" 
                                            Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <!-- Total Registrations Card -->
                            <div class="col-md-4">
                                <div class="card text-white bg-warning">
                                    <div class="card-body text-center">
                                        <asp:LinkButton 
                                            ID="btnTotalRegistrations" 
                                            runat="server" 
                                            OnClick="btnTotalRegistrations_Click"
                                            CssClass="stretched-link text-white text-decoration-none"
                                            Style="font-size:24px;">
                                            Total Registrations
                                        </asp:LinkButton>
                                        <br />
                                        <asp:Label 
                                            ID="lblRegistrationCount" 
                                            runat="server" 
                                            Font-Size="XX-Large" 
                                            Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Total Users Table -->
                        <div class="card mt-4" runat="server" id="UserCard">
                            <div class="card-header">
                                Manage Users
                            </div>
                            <div class="card-body">
                                <asp:GridView 
                                    ID="GridView1" 
                                    runat="server" 
                                    AutoGenerateColumns="False" 
                                    DataKeyNames="UserID"
                                    CssClass="table table-bordered"
                                    OnRowEditing="GridView1_RowEditing"
                                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                    OnRowUpdating="GridView1_RowUpdating"
                                    OnRowDeleting="GridView1_RowDeleting">
                                    <Columns>
                                        <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="true" />
                                        <asp:TemplateField HeaderText="Username">
                                            <ItemTemplate>
                                                <%# Eval("FullName") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("FullName") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <%# Eval("Email") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password">
                                            <ItemTemplate>
                                                <%# Eval("Password") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>

                        <!-- Total Events Table -->
                        <div class="card mt-4" runat="server" id="EventCard" visible="false">
                            <div class="card-header">
                                Events Details
                            </div>
                            <div class="card-body">
                                <asp:GridView 
                                    ID="GridViewEvents" 
                                    runat="server" 
                                    AutoGenerateColumns="False" 
                                    CssClass="table table-bordered">
                                    <Columns>
                                        <asp:BoundField DataField="Title" HeaderText="Title" />
                                        <asp:BoundField DataField="Location" HeaderText="Location" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <!-- Event Registrations Table -->
                        <!--<div class="card mt-4" runat="server" id="RegistrationCard" visible="false">
                            <div class="card-header">
                                Manage Event Registrations
                            </div>
                            <div class="card-body">
                                <asp:GridView 
                                    ID="GridViewRegistrations" 
                                    runat="server" 
                                    AutoGenerateColumns="False" 
                                    DataKeyNames="RegistrationID"
                                    CssClass="table table-bordered"
                                    OnRowEditing="GridViewRegistrations_RowEditing"
                                    OnRowCancelingEdit="GridViewRegistrations_RowCancelingEdit"
                                    OnRowUpdating="GridViewRegistrations_RowUpdating">
                                    <Columns>
                                        <asp:BoundField DataField="RegistrationID" HeaderText="Registration ID" ReadOnly="true" />
                                        <asp:TemplateField HeaderText="Student Name">
                                            <ItemTemplate>
                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtStudentName" runat="server" Text='<%# Bind("StudentName") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Event Name">
                                            <ItemTemplate>
                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEventName" runat="server" Text='<%# Bind("EventName") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>-->

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
