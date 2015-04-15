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
                <article class="myprofile">
                    <h4 class="profile-ul">PROFILE</h4>
                    <div id="myprofilepic">
                        <img class="mypic" src="Images/Sample1.jpg" alt="Sample"/>
                    </div> 
                    <div id="updprofile">
                        <form action="upd.jsp">
                            <input type="submit" class="button-link2" value="Edit Profile">
                        </form>
                    </div>
                    <div id="myname">
                        <h2>Name: ${loggedInUser.firstName} ${loggedInUser.lastName}</h2>
                    </div>
                    <div id="height">
                        <h3>Height: ${loggedInUser.height}m</h3>
                    </div>
                    <div id="weight">
                        <h3>Weight: ${loggedInUser.weight}kg</h3>
                    </div>
                    <div id="gender">
                        <h3>Gender: ${loggedInUser.gender}</h3>
                    </div>
                    <div id="age">
                        <h3>Age: ${loggedInUser.age}</h3>
                    </div>
                    <div id="bmi">
                        <h3>BMI: ${loggedInUser.calculateBMI()}</h3>                       
                        <!-- added by stuart -->
                        <div id="Health"></div>
                        <script>

                            if (${loggedInUser.calculateBMI()>29.9})
                            {
                                document.getElementById("Health").innerHTML = "Obese";
                                document.getElementById("Health").style.color = '#E10E0E';


                            }
                            else if (${loggedInUser.calculateBMI()>24.9 && loggedInUser.calculateBMI()<=29.9})
                            {
                                document.getElementById("Health").innerHTML = "Overweight";
                                document.getElementById("Health").style.color = '#C75050';
                            }
                            else if (${loggedInUser.calculateBMI()>18.5 && loggedInUser.calculateBMI()<=24.9})
                            {
                                document.getElementById("Health").innerHTML = "Healthy";
                                document.getElementById("Health").style.color = '#15E550';
                            }
                            else {
                                document.getElementById("Health").innerHTML = "Underweight";
                                document.getElementById("Health").style.color = '#1595E5';
                            }

                        </script>
                        <h2>Recommended Calorie Intake</h2>${loggedInUser.recommendedCalorieIntake()}
                        <a href="Get_Advanced_Statistics">Get Advanced Statistics</a>

                            <h2>Calories Left to meet Recommended: </h2><%=request.getAttribute("caloriesLeftToday")%>

                            <!-- added by stuart -->
                    </div>
                    <h4 id="header3">NOTIFICATIONS</h4>
                    <div id="notifications">
                        <article class="notifTable">
                            <form>
                                <%
                                    Models.User user2 = (Models.User) session.getAttribute("loggedInUser");
                                    if (user2 == null) {
                                        response.sendRedirect("index.jsp");
                                    }

                                    ArrayList<Models.Goal> goals = (ArrayList<Models.Goal>) request.getAttribute("upcomingGoals");

                                    if (goals != null) {
                                %>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Upcoming Goal</th>
                                            <th>Target Weight</th>
                                            <th>Target Date</th>
                                        </tr>
                                    </thead>
                                    <%
                                        for (int i = 0; i < goals.size(); i++) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=goals.get(i).getDescription()%></td>
                                            <td><%=goals.get(i).getTargetWeight()%></td>
                                            <td><%=goals.get(i).getTargetDate()%></td>
                                        </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                                <%
                                    }
                                %>
                            </form>
                        </article>
                    </div>
                </article>
                <img id="bkprofimage" src="Images/Profile_big.png" alt="Profile"/>
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
                       <a class="tab-link" href="#findu">
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


