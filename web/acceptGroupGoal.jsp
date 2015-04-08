<%-- 
    Document   : acceptGroupGoal
    Created on : Apr 5, 2015, 1:15:35 PM
    Author     : Stuart
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accept Group Goal</title>
    </head>
    <body>
        <div id="createGoal">
        <h1>Accept Group Goal</h1>
        <form action ="Create_Goal" method="POST">
            Group Name <br>
            <input type ="text" name="groupName" value="<%=request.getParameter("gGroup")%>" readonly/>
            <br>
            Target Date <br>
            <input type="date" name="targetDate" value="<%=request.getParameter("gDate")%>" readonly/>
            <br>
            Description <br>
            <input type="text" name="description"  value="<%=request.getParameter("gDesc")%>" readonly/>
            <br>
            Target Weight <br>
            <input type="number" name="targetWeight" value="<%=request.getParameter("gWeight")%>" readonly/>
            <br>
            <input type="submit" value="Accept Goal"/>
        </form>
    </div>
    </body>
</html>
