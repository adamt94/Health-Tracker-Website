<%@page import="Models.Membership"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group Management</title>
    <div id="disclaimer">
        Disclaimer:
        This application is not a commercial application and does not provide
        insurance. This is a study project that is part of a Computing Science module taught at the
        University of East Anglia, Norwich, UK. If you have any questions, please contact the
        module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
    </div>
    <script>
        function validateForm() {
    var x = document.forms["rGroup"]["rGroupName"].value;
    if (x === null || x === "") {
        alert("Name must be filled out");
        return false;
    }
}
    </script>
</head>
<body>
    <a href="View_Profile">Return to Profile</a>
    <div id="createGroup">
        <h1>Create Group</h1>
        <form name ="rGroup" onsubmit="return validateForm()" action="Register_Group" method="POST">
            <input type="text" name="rGroupName" placeholder="Enter group name..." required>
            <input type="submit" value="Create Group">
        </form>
    </div>
    <%
        Models.User user3 = (Models.User) session.getAttribute("loggedInUser");
        if (user3 == null) {
            response.sendRedirect("index.jsp");
        }
        ArrayList<Models.Group> groups2 = (ArrayList<Models.Group>) request.getAttribute("createdGroups");

    %>
    <div id="inviteGroup">
        <h1>Invite to a Group</h1>
        <form action="New_Group_Invitation" method="POST">
            <input type="text" name="jUsername" placeholder="Username of user" required><br>
            <select name="jGroupName"/>
            <%      if (groups2 != null) {
                    for (int j = 0; j < groups2.size(); j++) {
            %>

            <option value="<%=groups2.get(j).getGroupName()%>"> <%=groups2.get(j).getGroupName()%> </option>

            <%
                    }
                }
            %>
            </select>
            <input type="submit" value="Send Invite">
        </form>
    </div>

    <div id="createGoal">
        <h1>Create A Group Goal</h1>
        <form name ="creategoal" action ="Create_Group_Goal"  method="POST">
            NEEDS TO BE A SELECT OF ALL CREATED GROUPS <br>

            Group Name <br>
            <select name="groupName"/>
            <%      if (groups2 != null) {
                    for (int j = 0; j < groups2.size(); j++) {
            %>

            <option value="<%=groups2.get(j).getGroupName()%>"> <%=groups2.get(j).getGroupName()%> </option>

            <%
                    }
                }
            %>
            </select>
            <br>
            Target Date <br>
            <input type="date" name="targetDate" name="goaldate" required>
            <br>



            Description <br>
            <input type="text" name="description" required >
            <br>
            Target Weight <br>
            <input type="number" name="targetWeight" required>
            <br>
            <input type="submit" value="Create Goal" required>
        </form>

    </div>

    <div id="manageGroups">
        <h1>Manage Group Memberships</h1>
        <h4>Created Groups</h4>

        <%
            Models.User user2 = (Models.User) session.getAttribute("loggedInUser");
            if (user2 == null) {
                response.sendRedirect("index.jsp");
            }

            ArrayList<Models.Group> groups = (ArrayList<Models.Group>) request.getAttribute("createdGroups");

            if (groups != null) {
        %>

        <table border="1">
            <tr>
                <th>Group Name</th>
                <th></th>
            </tr>

            <%
                for (int i = 0; i < groups.size(); i++) {
            %>

            <tr>
                <td><%=groups.get(i).getGroupName()%></td>
            <form action="Delete_Group" method="POST">
                <input type ="hidden" value="<%=groups.get(i).getGroupName()%>" name="dGroupName" required>
                <td><input type="submit" value="Delete Group"></td>     
            </form>
            </tr>

            <%
                }
            %>
        </table>
        <%
            }
        %>

        <h4>Joined Groups</h4>
        <table border="1">
            <tr>
                <th>Group Name</th>
                <th></th>
            </tr>
            <%
                ArrayList<Models.Membership> memberships = (ArrayList<Models.Membership>) request.getAttribute("activeMemberships");

                if (memberships != null) {
                    for (int i = 0; i < memberships.size(); i++) {
            %>

            <tr>
                <td><%=memberships.get(i).getGroupName()%></td>
            <form action="Leave_Group" method="POST">
                <input type ="hidden" value="<%=memberships.get(i).getMembershipID()%>" name="dMembershipID" required>
                <td><input type="submit" value="Leave Group"></td>     
            </form>
            </tr>

            <%
                    }
                }
            %>
        </table>
    </div>

</body>
</html>
