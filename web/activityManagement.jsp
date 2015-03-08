<%-- 
    Document   : activityManagement
    Created on : Mar 7, 2015, 8:52:58 PM
    Author     : Stuart
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Exercise_Type"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activity Management</title>
    </head>

    <div id="disclaimer">
        Disclaimer:
        This application is not a commercial application and does not provide
        insurance. This is a study project that is part of a Computing Science module taught at the
        University of East Anglia, Norwich, UK. If you have any questions, please contact the
        module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
    </div>

    <body>
        <h1>Registering Activity</h1>
        <h2>Register Exercise</h2>
        Not fully implemented...

        <form action="Register_Exercise" method="POST">
            Exercise: 
            <select name="exerciseID">
                <%
                    ArrayList<Exercise_Type> availExercises = (ArrayList<Exercise_Type>) request.getAttribute("availExercises");
                    if (availExercises != null) {

                        for (Models.Exercise_Type e : availExercises) {%>
                <option value="<%=e.getExerciseID()%>"><%=e.getName()%></option>
                <% }//endfor
                        }//endif%>
            </select>
            <br>
            Duration: <input type="number" name="duration"></input>
            <br>
            Distance: <input type="number" name="distance"></input>
            <br>
            <input type="submit" value="Register Exercise"></input>
        </form>

        <h2>Register Meal</h2>
        Not yet implemented...
        <h2>Register Sleep</h2>
        Not yet implemented...
        <h1>View History of Activities</h1>
        <h2>Exercise History</h2>
        <%  //Get the result set of exercise history passed from the servlet
            ResultSet rs = (ResultSet) request.getAttribute("exerciseHistory");%>
        <TABLE BORDER="1">
            <TR>
                <TH>Exercise</TH>
                <TH>Duration</TH>
                <TH>Distance</TH>
                <TH>Calories Per Minute</TH>
                <TH>Date</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD><%= rs.getString("name") %></TD>
                <TD><%= rs.getString("duration") %></TD>
                <TD><%= rs.getString("distance") %></TD>
                <TD><%= rs.getString("caloriesPerMinute") %></TD>
                <TD><%= rs.getString("date") %></TD>
            </TR>
            <% } %>
    </body>
</html>
