<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

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
        <a href="profile.jsp">Return to Profile</a>
        <h1>Registering Activity</h1>
        <h2>Register Exercise</h2>
        Not fully implemented...

        <form action="Register_Exercise" method="POST">
            Exercise: 
            <select name="exerciseID">
                <%

                    Models.User user2 = (Models.User) session.getAttribute("loggedInUser");
                    if (user2 == null) {
                        response.sendRedirect("index.jsp");
                    }
                    
                    ArrayList<Models.Exercise_Type> availExercises = (ArrayList<Models.Exercise_Type>) request.getAttribute("availExercises");
                    if (availExercises != null) {

                        for (Models.Exercise_Type e : availExercises) {%>
                <option value="<%=e.getExerciseID()%>"><%=e.getName()%></option>
                <%      }//endfor
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
        <form action="Register_Meal" method="POST">
            Date: <input type="date" name ="rMealDate"> Type: <select name="rMealType">
                <option value="breakfast">Breakfast</option>
                <option value="lunch">Lunch</option>    
                <option value="dinner">Dinner</option>
                <option value="snacks">Snack</option>
            </select>
            <br>
            Meal Item:<select name="sustenanceID">
                <%
                    ArrayList<Models.Sustenance> availSustenances = (ArrayList<Models.Sustenance>) request.getAttribute("availSustenances");
                    if (availSustenances != null) {

                        for (Models.Sustenance s : availSustenances) {%>
                <option value="<%=s.getSustenanceID()%>"><%=s.getName()%> Calories: <%=s.getCalories()%></option>
                <%      }//endfor
                    }//endif%>
            </select>
            <br>
            <input type="submit" value="Add Item to Meal"></input>
        </form>
        <h4>Add Custom Food/Drink</h4>
        <form action="AddCustomSustenance" method="POST">
            Name: <input type="text" name="customName"></input>
            Calories: <input type="number" name="customCalories"></input>
            <input type="submit" value="Add Custom Food/Drink"></input>
        </form>

        <h2>Register Sleep</h2>
        Not yet implemented...
        <br>


        <h1>View History of Activities</h1>
        <h2>Meal History</h2>
        <h5>NOTE: ONLY CURRENTLY SHOWS MEALS ON DATE 15/03/2015 FOR TESTING PURPOSES</h5>
        <%  //Get the result set of exercise history passed from the servlet
            ResultSet rs = (ResultSet) request.getAttribute("breakfastHistory");%>
        <TABLE BORDER="1">
            <caption>Breakfast</caption>
            <TR>
                <TH>Name</TH>
                <TH>Calories</TH>
            </TR>
            <% while (rs.next()) {%>
            <TR>
                <TD><%= rs.getString("name")%></TD>
                <TD><%= rs.getDouble("calories")%></TD>
            </TR>
            <% }%>
        </TABLE>
        <%  //Get the result set of exercise history passed from the servlet
            rs = (ResultSet) request.getAttribute("lunchHistory");%>
        <TABLE BORDER="1">
            <caption>Lunch</caption>
            <TR>
                <TH>Name</TH>
                <TH>Calories</TH>
            </TR>
            <% while (rs.next()) {%>
            <TR>
                <TD><%= rs.getString("name")%></TD>
                <TD><%= rs.getDouble("calories")%></TD>
            </TR>
            <% }%>
        </TABLE>
        <%  //Get the result set of exercise history passed from the servlet
            rs = (ResultSet) request.getAttribute("dinnerHistory");%>
        <TABLE BORDER="1">
            <caption>Dinner</caption>
            <TR>
                <TH>Name</TH>
                <TH>Calories</TH>
            </TR>
            <% while (rs.next()) {%>
            <TR>
                <TD><%= rs.getString("name")%></TD>
                <TD><%= rs.getDouble("calories")%></TD>
            </TR>
            <% }%>
        </TABLE>
        <%  //Get the result set of exercise history passed from the servlet
            rs = (ResultSet) request.getAttribute("snacksHistory");%>
        <TABLE BORDER="1">
            <caption>Snacks</caption>
            <TR>
                <TH>Name</TH>
                <TH>Calories</TH>
            </TR>
            <% while (rs.next()) {%>
            <TR>
                <TD><%= rs.getString("name")%></TD>
                <TD><%= rs.getDouble("calories")%></TD>
            </TR>
            <% }%>
        </TABLE>
        <h2>Exercise History</h2>
        <%  //Get the result set of exercise history passed from the servlet
            rs = (ResultSet) request.getAttribute("exerciseHistory");%>
        <TABLE BORDER="1">
            <caption>Exercises Performed</caption>
            <TR>
                <TH>Exercise</TH>
                <TH>Duration</TH>
                <TH>Distance</TH>
                <TH>Calories Per Minute</TH>
                <TH>Date</TH>
            </TR>
            <% while (rs.next()) {%>
            <TR>
                <TD><%= rs.getString("name")%></TD>
                <TD><%= rs.getString("duration")%></TD>
                <TD><%= rs.getString("distance")%></TD>
                <TD><%= rs.getString("caloriesPerMinute")%></TD>
                <TD><%= rs.getString("date")%></TD>
            </TR>
            <% }%>
        </TABLE>

    </body>
</html>
