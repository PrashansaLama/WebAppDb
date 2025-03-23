<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebAppDb.Dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - LS Corporation</title>
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
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            background-color: #C0CFB2; 
            padding: 20px;
            border-radius: 8px;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            width: 100%;
        }

        .table-container, .chart-container {
            background-color: #F1EBE1; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex: 1; 
            display: flex;
            flex-direction: column;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
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

        .page-title {
            font-size: 24px;
            font-weight: bold;
            color: #000000; 
            margin-bottom: 20px;
        }

        .chart {
            width: 100%;
            height: 300px; 
            align-items: center; 
            justify-content: center; 
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
            <div class="container">
                <!-- Tables -->
                <div class="flex-container">
                    <div class="table-container">
                        <h3 class="page-title">Project Overview</h3>
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJ_ID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="PROJ_ID" HeaderText="Project ID" SortExpression="PROJ_ID" />
                                <asp:BoundField DataField="PROJ_NAME" HeaderText="Project Name" SortExpression="PROJ_NAME" />
                                <asp:BoundField DataField="P_SDATE" HeaderText="Start Date" SortExpression="P_SDATE" />
                                <asp:BoundField DataField="P_DDATE" HeaderText="End Date" SortExpression="P_DDATE" />
                                <asp:BoundField DataField="PROJ_STAT" HeaderText="Status" SortExpression="PROJ_STAT" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJ_ID, PROJ_NAME, P_SDATE, P_DDATE, PROJ_STAT FROM PROJECTS WHERE ROWNUM &lt;= 5 ORDER BY PROJ_ID DESC"></asp:SqlDataSource>
                    </div>

                    <div class="table-container">
                        <h3 class="page-title">Milestone Tracking</h3>
                        <asp:GridView ID="GridView2" CssClass="table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="MILE_NAME" HeaderText="Milestone Name" SortExpression="MILE_NAME" />
                                <asp:BoundField DataField="MILE_STAT" HeaderText="Status" SortExpression="MILE_STAT" />
                                <asp:BoundField DataField="MILE_DDT" HeaderText="Due Date" SortExpression="MILE_DDT" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MILE_NAME, MILE_STAT, MILE_DDT FROM MILESTONES WHERE ROWNUM &lt;= 5 ORDER BY MILE_DDT"></asp:SqlDataSource>
                    </div>
                </div>

                <!-- Charts -->
                <div class="flex-container">
                    <div class="chart-container">
                        <h3 class="page-title">Project Status</h3>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3" CssClass="chart">
                            <series>
                                <asp:Series Name="Series1" XValueMember="PROJ_STAT" YValueMembers="PROJ_COUNT">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </chartareas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT proj_stat, COUNT(*) AS proj_count FROM projects GROUP BY proj_stat"></asp:SqlDataSource>
                    </div>

                    <div class="chart-container">
                        <h3 class="page-title">Task Status</h3>
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource4" CssClass="chart">
                            <series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="TASK_STAT" YValueMembers="PROJ_COUNT">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </chartareas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT task_stat, COUNT(*) AS proj_count FROM user_proj_task GROUP BY task_stat"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>