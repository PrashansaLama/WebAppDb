<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Project.aspx.cs" Inherits="WebAppDb.User_Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Project - LS Corporation</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #F1EBE1;
            font-family: Arial, sans-serif;
            color: #000000;
            margin: 0;
            padding: 0;
        }

        .upper-navbar {
            background-color: #C0CFB2;
            height: 60px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            display: flex;
            align-items: center;
            padding-left: 20px;
        }

        .upper-navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: #F1EBE1;
        }

        .side-navbar {
            background-color: #C0CFB2;
            height: 100vh;
            width: 250px;
            padding: 20px;
            position: fixed;
            top: 60px;
            left: 0;
        }

        .side-navbar a {
            display: block;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            cursor: pointer;
            color: #000000;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .side-navbar a:hover {
            background-color: #F1EBE1;
            color: #C0CFB2;
        }

        .main-content {
            margin-left: 270px;
            padding: 20px;
            margin-top: 80px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #FFFFFF;
            border: 1px solid #DDDDDD;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #DDDDDD;
        }

        .table th {
            background-color: #C0CFB2;
            color: #F1EBE1;
        }

        .table tr:hover {
            background-color: #F5F5F5;
        }

        .btn-custom {
            background-color: #C0CFB2;
            color: #F1EBE1;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #F1EBE1;
            color: #C0CFB2;
        }

        .btn-custom-secondary {
            background-color: #F1EBE1;
            color: #C0CFB2;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-custom-secondary:hover {
            background-color: #C0CFB2;
            color: #F1EBE1;
        }

        .table-container {
            margin: 20px;
            padding: 20px;
            background-color: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .new-button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="upper-navbar">
            <div class="logo">
                LS Corporation
            </div>
        </div>

        <div class="side-navbar">
            <a href="Dashboard.aspx" class="nav-item">Dashboard</a>
            <a href="Users.aspx" class="nav-item">Users</a>
            <a href="Projects.aspx" class="nav-item">Projects</a>
            <a href="User_Project.aspx" class="nav-item">User Project</a>
            <a href="Tasks.aspx" class="nav-item">Task</a>
            <a href="SubTasks.aspx" class="nav-item">Sub Tasks</a>
            <a href="User_Project_Task.aspx" class="nav-item">User Project Task</a>
            <a href="Milestones.aspx" class="nav-item">Milestone</a>
            <a href="Resources.aspx" class="nav-item">Resources</a>
            <a href="Communications.aspx" class="nav-item">Communication</a>
        </div>

        <div class="main-content">
            <div class="table-container">
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="RES_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="RES_ID" HeaderText="RES_ID" ReadOnly="True" SortExpression="RES_ID" />
                        <asp:BoundField DataField="RES_NAME" HeaderText="RES_NAME" SortExpression="RES_NAME" />
                        <asp:BoundField DataField="RES_DESC" HeaderText="RES_DESC" SortExpression="RES_DESC" />
                        <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
                        <asp:BoundField DataField="PROJ_ID" HeaderText="PROJ_ID" SortExpression="PROJ_ID" />
                        <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;RESOURCES&quot; WHERE &quot;RES_ID&quot; = :RES_ID" InsertCommand="INSERT INTO &quot;RESOURCES&quot; (&quot;RES_ID&quot;, &quot;RES_NAME&quot;, &quot;RES_DESC&quot;, &quot;USER_ID&quot;, &quot;PROJ_ID&quot;, &quot;TASK_ID&quot;) VALUES (:RES_ID, :RES_NAME, :RES_DESC, :USER_ID, :PROJ_ID, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;RESOURCES&quot;" UpdateCommand="UPDATE &quot;RESOURCES&quot; SET &quot;RES_NAME&quot; = :RES_NAME, &quot;RES_DESC&quot; = :RES_DESC, &quot;USER_ID&quot; = :USER_ID, &quot;PROJ_ID&quot; = :PROJ_ID, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;RES_ID&quot; = :RES_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="RES_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RES_ID" Type="Decimal" />
                        <asp:Parameter Name="RES_NAME" Type="String" />
                        <asp:Parameter Name="RES_DESC" Type="String" />
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                        <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RES_NAME" Type="String" />
                        <asp:Parameter Name="RES_DESC" Type="String" />
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                        <asp:Parameter Name="TASK_ID" Type="Decimal" />
                        <asp:Parameter Name="RES_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="new-button-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="RES_ID" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        RES_ID:
                        <asp:Label ID="RES_IDLabel" runat="server" Text='<%# Eval("RES_ID") %>' />
                        <br />
                        RES_NAME:
                        <asp:Label ID="RES_NAMELabel" runat="server" Text='<%# Bind("RES_NAME") %>' />
                        <br />
                        RES_DESC:
                        <asp:Label ID="RES_DESCLabel" runat="server" Text='<%# Bind("RES_DESC") %>' />
                        <br />
                        USER_ID:
                        <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Bind("USER_ID") %>' />
                        <br />
                        PROJ_ID:
                        <asp:Label ID="PROJ_IDLabel" runat="server" Text='<%# Bind("PROJ_ID") %>' />
                        <br />
                        TASK_ID:
                        <asp:Label ID="TASK_IDLabel" runat="server" Text='<%# Bind("TASK_ID") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        RES_ID:
                        <asp:Label ID="RES_IDLabel1" runat="server" Text='<%# Eval("RES_ID") %>' />
                        <br />
                        RES_NAME:
                        <asp:TextBox ID="RES_NAMETextBox" runat="server" Text='<%# Bind("RES_NAME") %>' />
                        <br />
                        RES_DESC:
                        <asp:TextBox ID="RES_DESCTextBox" runat="server" Text='<%# Bind("RES_DESC") %>' />
                        <br />
                        USER_ID:
                        <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                        <br />
                        PROJ_ID:
                        <asp:TextBox ID="PROJ_IDTextBox" runat="server" Text='<%# Bind("PROJ_ID") %>' />
                        <br />
                        TASK_ID:
                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        RES_ID:
                        <asp:TextBox ID="RES_IDTextBox" runat="server" Text='<%# Bind("RES_ID") %>' />
                        <br />
                        RES_NAME:
                        <asp:TextBox ID="RES_NAMETextBox" runat="server" Text='<%# Bind("RES_NAME") %>' />
                        <br />
                        RES_DESC:
                        <asp:TextBox ID="RES_DESCTextBox" runat="server" Text='<%# Bind("RES_DESC") %>' />
                        <br />
                        USER_ID:
                        <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                        <br />
                        PROJ_ID:
                        <asp:TextBox ID="PROJ_IDTextBox" runat="server" Text='<%# Bind("PROJ_ID") %>' />
                        <br />
                        TASK_ID:
                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
</body>
</html>