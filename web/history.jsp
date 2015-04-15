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
                        <article><h4 id="his-ul">VIEW HISTORY</h4></article>
                        
                        <article class="mealhistory">
                            <h2>Meal History</h2>
                            <form action="Get_User_History" method="POST">
                                <br/>
                                <input type='submit' class="button-link2" value='Get Meals for Date'/>
                                <br/>
                                <br/>
                                <input type="date" name="requestedDate" placeholder="Date"/> 
                            </form>
                        </article>
                        
                        <article class="mealhistory2">
                            <h4>(Needs to be made clear that this is for the current day, not requested day. Either that or deleted<br>Calories Consumed Today: <%=request.getAttribute("caloriesConsumedToday")%></h4>
                            <%  
                            //Get the result set of exercise history passed from the servlet
                                ResultSet rs = (ResultSet) request.getAttribute("breakfastHistory");
                            %>
                            
                            <TABLE BORDER="1">
                                <caption>Breakfast</caption>
                                <TR>
                                    <TH>Name</TH>
                                    <TH>Calories Consumed</TH>
                                </TR>
                                <% while (rs.next()) {%>
                                <TR>
                                    <TD><%= rs.getString("name")%></TD>
                                    <TD><%= rs.getDouble("calories_consumed")%></TD>
                                </TR>
                                <% }%>
                            </TABLE>
                            <%  //Get the result set of exercise history passed from the servlet
                                rs = (ResultSet) request.getAttribute("lunchHistory");%>
                            <TABLE BORDER="1">
                                <caption>Lunch</caption>
                                <TR>
                                    <TH>Name</TH>
                                    <TH>Calories Consumed</TH>
                                </TR>
                                <% while (rs.next()) {%>
                                <TR>
                                    <TD><%= rs.getString("name")%></TD>
                                    <TD><%= rs.getDouble("calories_consumed")%></TD>
                                </TR>
                                <% }%>
                            </TABLE>
                            <%  //Get the result set of exercise history passed from the servlet
                                rs = (ResultSet) request.getAttribute("dinnerHistory");%>
                            <TABLE BORDER="1">
                                <caption>Dinner</caption>
                                <TR>
                                    <TH>Name</TH>
                                    <TH>Calories Consumed</TH>
                                </TR>
                                <% while (rs.next()) {%>
                                <TR>
                                    <TD><%= rs.getString("name")%></TD>
                                    <TD><%= rs.getDouble("calories_consumed")%></TD>
                                </TR>
                                <% }%>
                            </TABLE>
                            <%  //Get the result set of exercise history passed from the servlet
                                rs = (ResultSet) request.getAttribute("snacksHistory");%>
                            <TABLE BORDER="1">
                                <caption>Snacks</caption>
                                <TR>
                                    <TH>Name</TH>
                                    <TH>Calories Consumed</TH>
                                </TR>
                                <% while (rs.next()) {%>
                                <TR>
                                    <TD><%= rs.getString("name")%></TD>
                                    <TD><%= rs.getDouble("calories_consumed")%></TD>
                                </TR>
                                <% }%>
                            </TABLE>
        
                        </article>
                            
                        <article class="exehistory">
                            <h2>Exercise History</h2>
                            <%  
                            //Get the result set of exercise history passed from the servlet
                                rs = (ResultSet) request.getAttribute("exerciseHistory");
                            %>
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
                
            <!--    <div class="buffer3"></div>
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


