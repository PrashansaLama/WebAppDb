<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Proj_Details.aspx.cs" Inherits="WebAppDb.User_Proj_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Project Details - LS Corporation</title>
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

        .dropdown-container {
            margin-bottom: 20px;
        }

        .dropdown-container label {
            font-weight: bold;
            margin-right: 10px;
        }

        .dropdown-container .form-control {
            width: 200px;
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
            <div class="dropdown-container">
                <label for="DropDownList1">Select User:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="table-container">
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJ_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                        <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                        <asp:BoundField DataField="USER_NUM" HeaderText="USER_NUM" SortExpression="USER_NUM" />
                        <asp:BoundField DataField="PROJ_ID" HeaderText="PROJ_ID" ReadOnly="True" SortExpression="PROJ_ID" />
                        <asp:BoundField DataField="PROJ_NAME" HeaderText="PROJ_NAME" SortExpression="PROJ_NAME" />
                        <asp:BoundField DataField="PROJ_STAT" HeaderText="PROJ_STAT" SortExpression="PROJ_STAT" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT U.User_Id, U.User_Name, U.User_Email, U.User_Num, P.Proj_Id, P.Proj_Name, P.Proj_Stat FROM User_Proj_Task UPT JOIN Users U ON UPT.User_Id = U.User_Id JOIN Projects P ON UPT.Proj_Id = P.Proj_Id WHERE U.User_Id = :Users">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Users" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>