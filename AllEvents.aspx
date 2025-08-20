<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllEvents.aspx.cs" Inherits="alumniweb.AllEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <title>All Events</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f6fa;
            background-image: url('https://www.transparenttextures.com/patterns/cubes.png'); /* Light subtle pattern */
            background-repeat: repeat;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        h1 {
            text-align: center;
            margin-top: 40px;
            font-weight: bold;
            color: #4B286D;
            font-size: 42px;
        }
        .events-container {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
            margin: 40px 20px;
        }
        .event-card {
            background: #ffffff;
            padding: 25px;
            width: 300px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(75, 40, 109, 0.1);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            position: relative;
            overflow: hidden;
        }
        .event-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 24px rgba(75, 40, 109, 0.2);
        }
        .event-date {
            color: #888;
            font-size: 14px;
            margin-bottom: 8px;
            text-align: center;
        }
        .event-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #4B286D;
            text-align: center;
        }
        .event-description {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            text-align: center;
        }
        .event-details {
            font-size: 14px;
            color: #333;
            margin-top: 15px;
            border-top: 1px solid #eee;
            padding-top: 12px;
            line-height: 1.6;
        }
        .back-button {
            display: block;
            margin: 50px auto 30px auto;
            background: #4B286D;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            text-align: center;
            text-decoration: none;
            transition: background 0.4s;
        }
        .back-button:hover {
            background: #341e4b;
        }
    </style>
    <script>
        function checkAndRedirect(eventId, eventDate) {
            const today = new Date();
            const event = new Date(eventDate);

            if (today <= event) {
                // Redirect to registration form with Event ID
                window.location.href = 'EventRegistrationForm.aspx?eventid=' + eventId;
            } else {
                alert('Registration closed for this event.');
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>All Events</h1>

        <div class="events-container">
           <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkCard" runat="server" CommandName="Register" CommandArgument='<%# Eval("[EventID]") %>' style="text-decoration:none;">
                    <div class="event-card">
                        <div class="event-date">
                            <%# Eval("Event Date", "{0:MMM dd yyyy}") %>
                        </div>
                        <div class="event-title">
                            <%# Eval("Title") %>
                        </div>
                        <div class="event-description">
                            <%# Eval("Description") %>
                        </div>
                        <div class="event-details">
                            <strong>Location:</strong> <%# Eval("Location") %><br />
                            <strong>Time:</strong> <%# Eval("Time") %><br />
                            <strong>Branch:</strong> <%# Eval("branch") %><br />
                            <strong>Batch:</strong> <%# Eval("Batch") %>
                        </div>
                    </div>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>


        <a href="home.aspx" class="back-button">← Back to Home Page</a>
    </form>

</body>
</html>