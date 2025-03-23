<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTask.aspx.cs" Inherits="WebAppDb.UserTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT User_Id, User_Name, Task_Id, Task_Name, CompletedTaskCount 
FROM (
    SELECT 
        U.User_Id, 
        U.User_Name, 
        T.Task_Id, 
        T.Task_Name, 
        COUNT(CASE WHEN UPT.Task_Stat = 'completed' THEN 1 END) AS CompletedTaskCount  
    FROM Users U
    JOIN User_Proj_Task UPT ON U.User_Id = UPT.User_Id
    JOIN Tasks T ON UPT.Task_Id = T.Task_Id
    WHERE UPT.Task_Stat = 'completed'
    GROUP BY U.User_Id, U.User_Name, T.Task_Id, T.Task_Name
    ORDER BY CompletedTaskCount DESC  
) 
WHERE ROWNUM &lt;= 3
"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
