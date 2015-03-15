
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Tracker Website</title>
    </head>
    <body>
        <div id="disclaimer">
            Disclaimer:
            This application is not a commercial application and does not provide
            insurance. This is a study project that is part of a Computing Science module taught at the
            University of East Anglia, Norwich, UK. If you have any questions, please contact the
            module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
        </div>
        <div id="login">
            
            <form action="Log_in" method="POST">

                <p><label>Username</label></p>
                <p><input type="text" name="userName"  placeholder="Username" size="20"></p>
                <p><label>Password</label></p>
                <p><input type="password" name="password" placeholder="Password" size="20"></p>

                <p> <input type="submit" value="Login"></p>
            </form>
            
            <form action="Register_User" method="POST">

                <p><label>Username</label></p>
                <p><input type="text" name="rUsername"  placeholder="Username" size="20"></p>
                <p><label>Password</label></p>
                <p><input type="password" name="rPassword" placeholder="Password" size="20"></p>
                <p><label>Email</label></p>
                <p><input type="text" name="rEmail"  placeholder="Email" size="20"></p>
                <p><label>First Name</label></p>
                <p><input type="text" name="rFirstName"  placeholder="First Name" size="20"></p>
                <p><label>Last Name</label></p>
                <p><input type="text" name="rLastName"  placeholder="Username" size="20"></p>
                <p><label>Height</label></p>
                <p><input type="text" name="rHeight"  placeholder="Username" size="20"></p>
                <p><label>Weight</label></p>
                <p><input type="text" name="rWeight"  placeholder="Username" size="20"></p>

                <p> <input type="submit" value="Register"></p>
            </form>

        </div>
    </body>
</html>
