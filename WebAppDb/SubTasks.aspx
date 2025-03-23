<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubTasks.aspx.cs" Inherits="WebAppDb.SubTasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SubTasks - LS Corporation</title>
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
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ST_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn-custom" />
                        <asp:BoundField DataField="ST_ID" HeaderText="ST_ID" ReadOnly="True" SortExpression="ST_ID" />
                        <asp:BoundField DataField="ST_NAME" HeaderText="ST_NAME" SortExpression="ST_NAME" />
                        <asp:BoundField DataField="ST_SDT" HeaderText="ST_SDT" SortExpression="ST_SDT" />
                        <asp:BoundField DataField="ST_DDT" HeaderText="ST_DDT" SortExpression="ST_DDT" />
                        <asp:BoundField DataField="ST_STAT" HeaderText="ST_STAT" SortExpression="ST_STAT" />
                        <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                        <asp:TemplateField HeaderText="TaskName">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="taskkk" DataTextField="TASK_NAME" DataValueField="TASK_ID" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="taskkk" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;ST_ID&quot; = :ST_ID" InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;ST_ID&quot;, &quot;ST_NAME&quot;, &quot;ST_SDT&quot;, &quot;ST_DDT&quot;, &quot;ST_STAT&quot;, &quot;TASK_ID&quot;) VALUES (:ST_ID, :ST_NAME, :ST_SDT, :ST_DDT, :ST_STAT, :TASK_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ST_ID&quot;, &quot;ST_NAME&quot;, &quot;ST_SDT&quot;, &quot;ST_DDT&quot;, &quot;ST_STAT&quot;, &quot;TASK_ID&quot; FROM &quot;SUBTASKS&quot;" UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;ST_NAME&quot; = :ST_NAME, &quot;ST_SDT&quot; = :ST_SDT, &quot;ST_DDT&quot; = :ST_DDT, &quot;ST_STAT&quot; = :ST_STAT, &quot;TASK_ID&quot; = :TASK_ID WHERE &quot;ST_ID&quot; = :ST_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ST_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ST_ID" Type="Decimal" />
                        <asp:Parameter Name="ST_NAME" Type="String" />
                        <asp:Parameter Name="ST_SDT" Type="DateTime" />
                        <asp:Parameter Name="ST_DDT" Type="DateTime" />
                        <asp:Parameter Name="ST_STAT" Type="String" />
                        <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ST_NAME" Type="String" />
                        <asp:Parameter Name="ST_SDT" Type="DateTime" />
                        <asp:Parameter Name="ST_DDT" Type="DateTime" />
                        <asp:Parameter Name="ST_STAT" Type="String" />
                        <asp:Parameter Name="TASK_ID" Type="Decimal" />
                        <asp:Parameter Name="ST_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="new-button-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ST_ID" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn-custom" />
                    </ItemTemplate>
                    <InsertItemTemplate>
                        ST_ID:
                        <asp:TextBox ID="ST_IDTextBox" runat="server" Text='<%# Bind("ST_ID") %>' CssClass="form-control" />
                        <br />
                        ST_NAME:
                        <asp:TextBox ID="ST_NAMETextBox" runat="server" Text='<%# Bind("ST_NAME") %>' CssClass="form-control" />
                        <br />
                        ST_SDT:
                        <asp:TextBox ID="ST_SDTTextBox" runat="server" Text='<%# Bind("ST_SDT") %>' CssClass="form-control" />
                        <br />
                        ST_DDT:
                        <asp:TextBox ID="ST_DDTTextBox" runat="server" Text='<%# Bind("ST_DDT") %>' CssClass="form-control" />
                        <br />
                        ST_STAT:
                        <asp:TextBox ID="ST_STATTextBox" runat="server" Text='<%# Bind("ST_STAT") %>' CssClass="form-control" />
                        <br />
                        TASK_ID:
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
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