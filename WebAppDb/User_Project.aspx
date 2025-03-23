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

        .page-title {
            font-size: 24px;
            font-weight: bold;
            color: #000000;
            margin-bottom: 20px;
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
            <!-- Title for User Project Page -->
            <div class="page-title">
                User Project
            </div>

            <!-- User Project Table -->
            <div class="table-container">
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJ_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="btn-custom" />
                        <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="PROJ_ID" HeaderText="PROJ_ID" ReadOnly="True" SortExpression="PROJ_ID" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USER_PROJ&quot; WHERE &quot;USER_ID&quot; = :USER_ID AND &quot;PROJ_ID&quot; = :PROJ_ID" InsertCommand="INSERT INTO &quot;USER_PROJ&quot; (&quot;USER_ID&quot;, &quot;PROJ_ID&quot;) VALUES (:USER_ID, :PROJ_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;PROJ_ID&quot; FROM &quot;USER_PROJ&quot;">
                    <DeleteParameters>
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>

            <!-- FormView for Insert/Edit -->
            <div class="table-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID,PROJ_ID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        USER_ID:
                        <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' />
                        <br />
                        PROJ_ID:
                        <asp:Label ID="PROJ_IDLabel1" runat="server" Text='<%# Eval("PROJ_ID") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn-custom" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-custom-secondary" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        USER_ID:
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                        <br />
                        PROJ_ID:
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceProjects" DataTextField="PROJ_NAME" DataValueField="PROJ_ID" SelectedValue='<%# Bind("PROJ_ID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJ_ID&quot;, &quot;PROJ_NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn-custom" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-custom-secondary" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        USER_ID:
                        <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_ID") %>' />
                        <br />
                        PROJ_ID:
                        <asp:Label ID="PROJ_IDLabel" runat="server" Text='<%# Eval("PROJ_ID") %>' />
                        <br />
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn-custom" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn-custom-secondary" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
</body>
</html>