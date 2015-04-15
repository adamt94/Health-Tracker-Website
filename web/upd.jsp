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
                <article><h4 id="upd-ul">UPDATE PROFILE</h4></article>                        
                <article class="update_profile">
                    <form action="Update_User_Information" method="POST">
                        <input name="user_name" type="hidden" data-bind="text: username"/>
                        <h2>Update Profile Details</h2>
                        <h4>Enter Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Name</h4>
                        <input name="eFirstName" type="text" value=${loggedInUser.firstName} />
                        <input name="eLastName" type="text" value=${loggedInUser.lastName} />
                        <h2>Age: </h2><input type="number" name="eAge" value =${loggedInUser.age}>
                            <h2>Gender: </h2><select name="eGender">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                            <h4>Enter Height&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Weight</h4>
                            <input name="eHeight" type="text" value =${loggedInUser.height} />
                            <input name="eWeight" type="text" value=${loggedInUser.weight} />
                            <h4>BMI: </h4>${loggedInUser.calculateBMI()}
                            <h2>Active Level: </h2><select name="eActiveLevel">
                                <option value="Sedentary">Sedentary</option>
                                <option value="Lightly Active">Lightly Active</option>
                                <option value="Moderately Active">Moderately Active</option>
                                <option value="Very Active">Very Active</option>
                            </select>
                            <h4></h4>
                            <input name="updSubmit" class="button-link2" type="submit"  value="Update Profile"/> <!--onclick="myApp.updProfile()"-->
                            <input name="updCancel" class="button-link2" type="button"  value="Cancel" onclick="location.href = 'profile.jsp'"/> 
                            <br/><br/>
                    </form>
                </article>
                <img id="updprofimg" src="Images/UpdProf_big.png" alt="Update Profile"/>
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
                    <a class="tab-link" href="history.jsp">
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

                <!--     <div class="buffer3"></div>
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


