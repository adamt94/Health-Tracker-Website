<%@page import="Models.Past_Goal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>ViTracker - Profile Page v3</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta name="keywords" content="ViTracker" /> 
        <meta name="description" content="Welcome to ViTracker." /> 
        <meta name="Author" content="Jimi Vine" />
        <script src="js/formatdate.js" type="text/javascript"></script>
        <link href="style2.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/knockout-3.1.0.js"></script>
        <script src="js/profile.js"></script>
    </head>
    <body> 

        <!--
        ****************************************************
        *                      Header                      *
        ****************************************************
        -->		 
        <div id="header" style="opacity: 1">
            <a href="View_Profile">
                <img id="logo" src="Images/logo.jpg" alt="ViTracker logo"/>
            </a>
            <div id="todays_date" data-bind="text: date"></div>
            <div id="time_now" data-bind="html: currentTime"></div>
        </div>

        <!--
        ****************************************************
        *                   Main Body                      *
        ****************************************************
        -->

        <div id="maincontainer">
            <div class="labels1"> 
                <article><h4 id="goal-ul">CREATE A GOAL</h4></article>

                <article class="goal">
                    <h2>Create A Goal</h2>
                    <form action ="Create_Goal" method="POST">
                        <h4>Target Date:</h4><input type="date" name="targetDate" required>
                        <h4>Description:</h4><input type="text" placeholder="Description" name="description" required>
                        <h4>Target Weight:</h4><input type="number" placeholder="Target Weight" name="targetWeight" required>
                        <h4></h4>
                        <input type="submit" class="button-link2" value="Create Goal">
                    </form>
                </article> 

                <article class="goalhistory">
                    <h2>Goal History</h2>
                    <h1>Goal History</h1>

                    Get history of a goal... <br>

                        <form action="Goal_Management" method="POST">
                            <input type="number" name="requestedGoalID" placeholder="Goal ID" required> 
                            <input type='submit' value='Get Goal History' >
                        </form>

                        <%
                            //Get the history of a given goal if we have it from the request
                            ArrayList<Past_Goal> goalHistory = (ArrayList<Past_Goal>) request.getAttribute("goalHistory");

                            //If there is a goal history to display
                            if (goalHistory != null) {
                        %>
                        <table border="1">
                            <th>Description</th>
                            <th>Target Weight</th>
                            <th>Target Date</th>

                            <%  for (Past_Goal g : goalHistory) {

                            %>
                            <tr>
                                <td><input type="text" value="<%=g.getDescription()%>" readonly></td>
                                <td><input type="text" value="<%=g.getTarget_weight()%>" readonly></td>
                                <td><input type="text" value="<%=g.getTarget_date()%>" readonly></td>
                            </tr>    
                            <%
                                }//End for
                            %>
                        </table>
                        <%
                            }//End if

                        %>
                        <h4>Active Goals:</h4>
                        <table>
                            <%  //Get the user's active goals
                                ArrayList<Models.Goal> activeGoals = (ArrayList<Models.Goal>) request.getAttribute("activeGoals");

                                if (activeGoals != null) {
                            %>
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Target Weight</th>
                                    <th>Target Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <%
                                for (Models.Goal g : activeGoals) {
                            %>
                            <form action="Update_Goal" method="POST">
                                <tbody>
                                    <tr>
                                        <input type ="hidden" name ="eGoalID" value ="<%=g.getGoal_ID()%>" required>
                                            <td><input type="text" name="eDescription" value="<%=g.getDescription()%>" required></td>
                                            <td><input type="number" name="eTargetWeight" value="<%=g.getTargetWeight()%>" required></td>
                                            <td><input type="date" name="eTargetDate" value="<%=g.getTargetDate()%>" required></td>
                                            <td><input type ="submit" value ='Update Goal'/></td>
                                    </tr>
                                </tbody>
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
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Target Weight</th>
                                    <th>Target Date</th>
                                </tr>
                            </thead>
                            <%
                                for (Models.Goal g : successfulGoals) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=g.getDescription()%></td>
                                    <td><%=g.getTargetWeight()%></td>
                                    <td><%=g.getTargetDate()%></td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                        <%
                            }//End if
                        %>
                </article>

                <article class="expgoal">
                    <h4>Expired Goals</h4>
                    <%  //Get the user's expired goals
                        ArrayList<Models.Goal> expiredGoals = (ArrayList<Models.Goal>) request.getAttribute("expiredGoals");

                        if (activeGoals != null) {
                    %>
                    <table border="1">
                        <thead>    
                            <tr>
                                <th>Description</th>
                                <th>Target Weight</th>
                                <th>Target Date</th>
                            </tr>
                        </thead>
                        <%
                            for (Models.Goal g : expiredGoals) {
                        %>
                        <tbody>   
                            <tr>
                                <td><%=g.getDescription()%></td>
                                <td><%=g.getTargetWeight()%></td>
                                <td><%=g.getTargetDate()%></td>
                            </tr>
                        </tbody>
                        <%
                            }
                        %>
                    </table>
                    <%
                        }//End if
                    %>
                </article>

            </div>
        </div>



        <!--
        ****************************************************
        *                     Footer                       *
        ****************************************************
        -->
        <div id="footer">        
            <section class="tabs">            
                <div class="buffer2"></div>
                <span class="anchor" id="activity"></span>

                <div class="panel">
                    <a class="tab-link" href="Activity_Management">
                        <img src="Images/FindF.png" alt="Record Activity"/>
                        <h1>RECORD</h1>
                        <h1>ACTIVITY</h1>
                        <p>Register your daily calorie intake or exercise</p>
                    </a>

                </div> 

                <div class="buffer3"></div>                 
                <span class="anchor" id="history"></span>
                <div class="panel">
                    <a class="tab-link" href="Get_User_History">
                        <img src="Images/Join.png" alt="View History"/>
                        <h1>VIEW</h1>
                        <h1>HISTORY</h1>
                        <p>View history of your activities</p>
                    </a> 

                </div>

                <div class="buffer3"></div>
                <span class="anchor" id="goals"></span>
                <div class="panel">
                    <a class="tab-link" href="Goal_Management">
                        <img src="Images/Msg.png" alt="Goals"/>
                        <h1>CREATE A GOAL</h1>
                        <h1 class="blank">~</h1>
                        <p>Set yourself a goal for losing or gaining weight</p>
                    </a>
                </div>

                <div class="buffer3"></div>
                <span class="anchor" id="view"></span>
                <div class="panel">
                    <a class="tab-link" onclick="myApp.viewProfile()" href="View_Profile">
                        <img src="Images/Profile.png" alt="View Profile"/>
                        <h1>VIEW</h1>
                        <h1>PROFILE</h1>
                        <p>Check out your profile page and view your health related information</p>
                    </a>
                </div> 

                <!--   <div class="buffer3"></div>
                   <span class="anchor" id="findu"></span>
                   <div class="panel">
                       <a class="tab-link" href="group.jsp">
                           <img src="Images/FindU.png" alt="Find University"/>
                           <h1>FIND</h1>
                           <h1>GROUP</h1>
                           <p>Find details about a group. If you can't find it let us know</p>
                       </a>
                   </div>  -->

                <div class="buffer3"></div>
                <span class="anchor" id="logout"></span>
                <div class="panel">
                    <a class="tab-link" href="Log_out">
                        <img src="Images/Logout.png" alt="Logout"/>
                        <h2>LOGOUT</h2>
                    </a>
                </div>                    
            </section>            
            <div class="buffer2"></div>
        </div>

        <script>
            $(function() {
                myApp.vm = new myApp.ProfileViewModel();
                ko.applyBindings(myApp.vm);
                myApp.vm.username(window.location.search.split("=")[1]);
//* this gets username from the URL and binds it to the viewmodel in profile.jsp
            });
        </script>
    </body>
</html>


