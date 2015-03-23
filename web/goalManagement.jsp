<%-- 
    Document   : createGoal
    Created on : Mar 21, 2015, 11:24:26 AM
    Author     : adam
--%>

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

    <h1>Goal History</h1>



</body>
</html>
