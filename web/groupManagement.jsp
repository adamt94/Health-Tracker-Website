<%@page import="Models.Membership"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group Management</title>
    </head>
    <body>
        <a href="profile.jsp">Return to Profile</a>
        <h1>Create Group</h1>
        <form action="Register_Group" method="POST">
            <input type="text" name="rGroupName" placeholder="Enter group name...">
            <input type="submit" value="Create Group">
        </form>

        <h1>Join Group</h1>
        <form action="Join_Group" method="POST">
            <input type="text" name="jGroupName" placeholder="Group name to join...">
            <input type="submit" value="Join Group">
        </form>

        <h1>Manage Group Memberships</h1>
        <h4>Created Groups</h4>

        <%
            Models.User user2 = (Models.User) session.getAttribute("loggedInUser");
            if (user2 == null) {
                response.sendRedirect("index.jsp");
            }

            ArrayList<Models.Group> groups = (ArrayList<Models.Group>) request.getAttribute("createdGroups");

            if (groups != null) {
                for (int i = 0; i < groups.size(); i++) {
        %>
        <table>
            <tr>
                <th>Group Name</th>
                <th></th>
            </tr>

            <tr>
                <td><%=groups.get(i).getGroupName()%></td>
            <form action="Delete_Group" method="POST">
                <input type ="hidden" value="<%=groups.get(i).getGroupName()%>" name="dGroupName">
                <td><input type="submit" value="Remove"></td>     
            </form>
        </tr>
    </table>
    <%
            }
        }
    %>

    <h4>Joined Groups</h4>

    <%
        ArrayList<Models.Membership> memberships = (ArrayList<Models.Membership>) request.getAttribute("activeMemberships");

        if (memberships != null) {
            for (int i = 0; i < memberships.size(); i++) {
    %>
    <table>
        <tr>
            <th>Group Name</th>
            <th></th>
        </tr>
        <tr>
            <td><%=memberships.get(i).getGroupName()%></td>
        <form action="Leave_Group" method="POST">
            <input type ="hidden" value="<%=memberships.get(i).getMembershipID()%>" name="dMembershipID">
            <td><input type="submit" value="Remove"></td>     
        </form>
    </tr>
</table>
<%
        }
    }
%>

</body>
</html>
