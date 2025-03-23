<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="WebAppDb.Projects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Projects - LS Corporation</title>
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
        <!-- Upper Navigation Bar -->
        <div class="upper-navbar">
            <div class="logo">
                LS Corporation
            </div>
        </div>

        <!-- Side Navigation Bar -->
        <div class="side-navbar">
            <a href="Dashboard.aspx" class="nav-item">Dashboard</a>
            <a href="Users.aspx" class="nav-item">Users</a>
            <a href="Projects.aspx" class="nav-item">Projects</a>
            <a href="UserProject.aspx" class="nav-item">User Project</a>
            <a href="Tasks.aspx" class="nav-item">Task</a>
            <a href="SubTasks.aspx" class="nav-item">Sub Tasks</a>
            <a href="UserProjectTask.aspx" class="nav-item">User Project Task</a>
            <a href="Milestone.aspx" class="nav-item">Milestone</a>
            <a href="Resources.aspx" class="nav-item">Resources</a>
            <a href="Communication.aspx" class="nav-item">Communication</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="table-container">
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJ_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn-custom" />
                        <asp:BoundField DataField="PROJ_ID" HeaderText="PROJ_ID" ReadOnly="True" SortExpression="PROJ_ID" />
                        <asp:BoundField DataField="PROJ_NAME" HeaderText="PROJ_NAME" SortExpression="PROJ_NAME" />
                        <asp:BoundField DataField="P_SDATE" HeaderText="P_SDATE" SortExpression="P_SDATE" />
                        <asp:BoundField DataField="P_DDATE" HeaderText="P_DDATE" SortExpression="P_DDATE" />
                        <asp:BoundField DataField="PROJ_STAT" HeaderText="PROJ_STAT" SortExpression="PROJ_STAT" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJ_ID&quot; = :PROJ_ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJ_ID&quot;, &quot;PROJ_NAME&quot;, &quot;P_SDATE&quot;, &quot;P_DDATE&quot;, &quot;PROJ_STAT&quot;) VALUES (:PROJ_ID, :PROJ_NAME, :P_SDATE, :P_DDATE, :PROJ_STAT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJ_ID&quot;, &quot;PROJ_NAME&quot;, &quot;P_SDATE&quot;, &quot;P_DDATE&quot;, &quot;PROJ_STAT&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJ_NAME&quot; = :PROJ_NAME, &quot;P_SDATE&quot; = :P_SDATE, &quot;P_DDATE&quot; = :P_DDATE, &quot;PROJ_STAT&quot; = :PROJ_STAT WHERE &quot;PROJ_ID&quot; = :PROJ_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJ_NAME" Type="String" />
                        <asp:Parameter Name="P_SDATE" Type="DateTime" />
                        <asp:Parameter Name="P_DDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJ_STAT" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJ_NAME" Type="String" />
                        <asp:Parameter Name="P_SDATE" Type="DateTime" />
                        <asp:Parameter Name="P_DDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJ_STAT" Type="String" />
                        <asp:Parameter Name="PROJ_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <!-- FormView for Insert/Edit -->
            <div class="new-button-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJ_ID" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn-custom" />
                    </ItemTemplate>
                    <InsertItemTemplate>
                        PROJ_ID:
                        <asp:TextBox ID="PROJ_IDTextBox" runat="server" Text='<%# Bind("PROJ_ID") %>' CssClass="form-control" />
                        <br />
                        PROJ_NAME:
                        <asp:TextBox ID="PROJ_NAMETextBox" runat="server" Text='<%# Bind("PROJ_NAME") %>' CssClass="form-control" />
                        <br />
                        P_SDATE:
                        <asp:TextBox ID="P_SDATETextBox" runat="server" Text='<%# Bind("P_SDATE") %>' CssClass="form-control" />
                        <br />
                        P_DDATE:
                        <asp:TextBox ID="P_DDATETextBox" runat="server" Text='<%# Bind("P_DDATE") %>' CssClass="form-control" />
                        <br />
                        PROJ_STAT:
                        <asp:TextBox ID="PROJ_STATTextBox" runat="server" Text='<%# Bind("PROJ_STAT") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn-custom" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-custom-secondary" />
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
</body>
</html>