
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- This meta tag refreshes the page every two minutes 
                    to check for notifications              -->
        <meta http-equiv="refresh" content="120;url=View_Profile" />
        <title>My Profile</title>
    </head>
    <body>
        <div id="disclaimer">
            Disclaimer:
            This application is not a commercial application and does not provide
            insurance. This is a study project that is part of a Computing Science module taught at the
            University of East Anglia, Norwich, UK. If you have any questions, please contact the
            module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
        </div>
        <jsp:useBean id="loggedInUser" type="Models.User" scope="session"/>
        <div id="logout"> <p> <a href="Log_out"> Logout</a></p></div>
        <h1>Profile Page</h1>
        <h2>Name: </h2>${loggedInUser.firstName} ${loggedInUser.lastName}
        <h2>Weight: </h2>${loggedInUser.weight}kg
        <h2>Height: </h2>${loggedInUser.height}m
        <h2>BMI: </h2>${loggedInUser.calculateBMI()}
        <h2>Recommended Calorie Intake</h2>${loggedInUser.recommendedCalorieIntake()}
        <div id="logout"> <p> <a href="editprofile.jsp">Edit Profile</a></p></div>
        <a href="Activity_Management">Manage Activities</a><br>
        <a href="Goal_Management">Manage Goals</a><br>
        <a href="Group_Management">Manage Groups</a><br>
        <a href="Get_Advanced_Statistics">Get Advanced Statistics</a>

        <!-- This div is where notifications are displayed -->
        <div id="notifications">
            
            <h2>Notifications</h2>
            <%
                Models.User user2 = (Models.User) session.getAttribute("loggedInUser");
                if (user2 == null) {
                    response.sendRedirect("index.jsp");
                }

                ArrayList<Models.Goal> goals = (ArrayList<Models.Goal>) request.getAttribute("upcomingGoals");

                if (goals != null) {
            %>

            <table>
                <tr>
                    <th>Upcoming Goal</th>
                    <th>Target Weight</th>
                    <th>Target Date</th>
                </tr>

                <%
                    for (int i = 0; i < goals.size(); i++) {
                %>

                <tr>
                    <td><%=goals.get(i).getDescription()%></td>
                    <td><%=goals.get(i).getTargetWeight()%></td>
                    <td><%=goals.get(i).getTargetDate()%></td>
                </tr>

                <%
                    }
                %>
            </table>
            <%
                }
            %>
            
        </div><!--End Notifications Div-->

    </body>
</html>
