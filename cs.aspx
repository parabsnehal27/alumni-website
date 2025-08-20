<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cs.aspx.cs" Inherits="alumniweb.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            font-size: 14px;
            background-color: #f9f9f9;
            padding: 40px;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        input[type="file"],
        .aspNet-FileUpload {
            margin-bottom: 20px;
        }

        .aspNet-Button,
        input[type="submit"],
        asp\:Button {
            background-color: #4B286D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .aspNet-Button:hover {
            background-color: #3a2055;
        }

        hr {
            margin: 30px 0;
            border: none;
            height: 1px;
            background-color: #ddd;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th {
            background-color: #4B286D;
            color: white;
            padding: 10px;
            text-align: left;
        }

        table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        a, .aspNet-LinkButton {
            color: #4B286D;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover, .aspNet-LinkButton:hover {
            text-decoration: underline;
        }
    </style>
    <style type="text/css">
        body { font-family: Arial; font-size: 10pt; }
        table { border: 1px solid #ccc; border-collapse: collapse; }
        table th { background-color: #F7F7F7; color: #333; font-weight: bold; }
        table th, table td { padding: 5px; border: 1px solid #ccc; }
        table, table table td { border: 0px solid #ccc; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <a href="home.aspx" class="back-button">← Back to Home Page</a>
        <div>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Font-Bold="true" ForeColor="#4B286D" Text="Add Assignments or Notes"></asp:Label>
            <br />
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
            <br />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <hr />
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="File Name" />

        <asp:TemplateField HeaderText="Download">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download"
                    CommandArgument='<%# Eval("Id") %>' OnClick="DownloadFile" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="View">
            <ItemTemplate>
                <asp:LinkButton ID="lnkView" runat="server" Text="View"
                    CommandArgument='<%# Eval("Id") %>' OnClick="ViewFile" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
    </form>
</body>
</html>
