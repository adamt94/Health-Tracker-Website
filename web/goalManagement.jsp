<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activity Management</title>
    <div id="disclaimer">
        Disclaimer:
        This application is not a commercial application and does not provide
        insurance. This is a study project that is part of a Computing Science module taught at the
        University of East Anglia, Norwich, UK. If you have any questions, please contact the
        module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
    </div>
</head>
<body>
    <a href="View_Profile">Return to Profile</a>
    <div id="createGoal">
        <h1>Create A Goal</h1>
        <form action ="Create_Goal" method="POST">
            <!--
            Group Name <br>
            <input type ="text" name="groupName"/>
            <br>
            -->
            Target Date <br>
            <input type="date" name="targetDate"/>
            <br>
            Description <br>
            <input type="text" name="description"/>
            <br>
            Target Weight <br>
            <input type="number" name="targetWeight"/>
            <br>
            <input type="submit" value="Create Goal">
        </form>
    </div>

    <div id="goalHistory">
        <h1>Goal History</h1>

        <h4>Active Goals</h4>

        <!--
        
                     User can only modify active goals
        
        -->

        <%  //Get the user's active goals
            ArrayList<Models.Goal> activeGoals = (ArrayList<Models.Goal>) request.getAttribute("activeGoals");

            if (activeGoals != null) {
        %>
        <table border="1">
            <tr>
                <th>Description</th>
                <th>Target Weight</th>
                <th>Target Date</th>
                <th></th>
            </tr>
            <%
                for (Models.Goal g : activeGoals) {
            %>
            <form action="Update_Goal" method="POST">
                <tr>
                    <input type ="hidden" name ="eGoalID" value ="<%=g.getGoal_ID()%>">
                    <td><input type="text" name="eDescription" value="<%=g.getDescription()%>"/></td>
                    <td><input type="number" name="eTargetWeight" value="<%=g.getTargetWeight()%>"/></td>
                    <td><input type="date" name="eTargetDate" value="<%=g.getTargetDate()%>"/></td>
                    <td><input type ="submit" value ='Update Goal'/></td>
                </tr>
            </form>
            <%
                }
            %>
        </table>
        <%
            }//End if
        %>

        <h4>Successful Goals</h4>

        <%  //Get the user's successful goals
            ArrayList<Models.Goal> successfulGoals = (ArrayList<Models.Goal>) request.getAttribute("successfulGoals");

            if (activeGoals != null) {
        %>
        <table border="1">
            <tr>
                <th>Description</th>
                <th>Target Weight</th>
                <th>Target Date</th>
            </tr>
            <%
                for (Models.Goal g : successfulGoals) {
            %>
            <tr>
                <td><%=g.getDescription()%></td>
                <td><%=g.getTargetWeight()%></td>
                <td><%=g.getTargetDate()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }//End if
        %>

        <h4>Expired Goals</h4>

        <%  //Get the user's expired goals
            ArrayList<Models.Goal> expiredGoals = (ArrayList<Models.Goal>) request.getAttribute("expiredGoals");

            if (activeGoals != null) {
        %>
        <table border="1">
            <tr>
                <th>Description</th>
                <th>Target Weight</th>
                <th>Target Date</th>
            </tr>
            <%
                for (Models.Goal g : expiredGoals) {
            %>
            <tr>
                <td><%=g.getDescription()%></td>
                <td><%=g.getTargetWeight()%></td>
                <td><%=g.getTargetDate()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }//End if
        %>

    </div>



</body>
</html>
