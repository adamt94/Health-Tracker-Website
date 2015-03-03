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
        <h1>Profile Page</h1>
        <form action="Update_User_Information" method="POST">
            <h2>Name: </h2><input type="text" name="eFirstName" value=${loggedInUser.firstName}><input type="text" name="eLastName" value=${loggedInUser.lastName}>
            <h2>Weight: </h2><input type="text" name="eWeight" value=${loggedInUser.weight}>kg
            <h2>Height: </h2><input type="text" name="eHeight" value =${loggedInUser.height}>m
            <p><input type="submit" value="Save Changes"></p>
            <a href="profile.jsp">Cancel</a>
        </form>
        <h2>BMI: </h2>${loggedInUser.calculateBMI()}
    </body>
</html>
