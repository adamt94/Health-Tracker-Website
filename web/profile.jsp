<%-- 
    Document   : profile
    Created on : Feb 26, 2015, 5:08:00 PM
    Author     : Stuart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div id="logout"> <p> <a href="editprofile.jsp">Edit Profile</a></p></div>
    </body>
</html>
