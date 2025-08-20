<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="link.aspx.cs" Inherits="alumniweb.link" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Student Project Upload</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 40px;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 1000px;
            margin: auto;
        }

        h2 {
            color: #4B286D;
            text-align: center;
            margin-bottom: 30px;
        }

        label, asp\:Label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        textarea,
        asp\:TextBox {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        asp\:FileUpload {
            margin-bottom: 20px;
        }

        asp\:Button,
        input[type="submit"] {
            background-color: #4B286D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        asp\:Button:hover {
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
            padding: 12px;
            text-align: left;
        }

        table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        a, asp\:LinkButton {
            color: #4B286D;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover, asp\:LinkButton:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <a href="home.aspx" class="back-button">← Back to Home Page</a>
        <div style="font-family:Arial; padding:20px;">
            <h2>Upload Student Project</h2>

            <asp:Label ID="lblTitle" runat="server" Text="Project Title:" /><br />
            <asp:TextBox ID="txtTitle" runat="server" Width="300px" /><br /><br />

            <asp:Label ID="lblDescription" runat="server" Text="Project Description:" /><br />
            <asp:TextBox ID="txtDescription" runat="server" Width="500px" TextMode="MultiLine" Rows="4" /><br /><br />

            <asp:Label ID="lblLink" runat="server" Text="Project Link (GitHub/YouTube):" /><br />
            <asp:TextBox ID="txtLink" runat="server" Width="500px" /><br /><br />

            <asp:Label ID="lblFile" runat="server" Text="Upload Image/Video:" /><br />
            <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />

            <asp:Button ID="btnUpload" runat="server" Text="Submit Project" OnClick="btnUpload_Click" />

            <br /><br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" /><br />

            <hr />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />

                    
                    <asp:TemplateField HeaderText="Link">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkProject" runat="server"
                                           NavigateUrl='<%# Eval("Link") %>'
                                           Text='<%# Eval("Link") %>'
                                           Target="_blank"
                                           Visible='<%# !string.IsNullOrEmpty(Eval("Link").ToString()) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewFile" runat="server" Text="View" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            OnClick="ViewFile_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>