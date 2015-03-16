<%--
    Document   : index
    Created on : March 09, 2015, 5:01:21 PM
    Author     : Jimi Vine
--%>
<%--
            Disclaimer:
            This application is not a commercial application and does not provide
            insurance. This is a study project that is part of a Computing Science module taught at the
            University of East Anglia, Norwich, UK. If you have any questions, please contact the
            module coordinator, Joost Noppen, at j.noppen@uea.ac.uk
--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>Trackerz - Home Page</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="keywords" content="Aviva Health Tracker" /> 
	<meta name="description" content="Welcome to Trackerz." /> 
	<meta name="Author" content="Jimi Vine" />
        <link href="style1.css" rel="stylesheet" type="text/css"/>
        <script src="js/formatdate.js" type="text/javascript"></script>
        <script src="js/jquery.js"></script>
        <script src="js/knockout-3.1.0.js"></script>
        <script src="js/login.js"></script>
    </head>

    <body> 
        <!--
        ****************************************************
        *                      Header                      *
        ****************************************************
        -->		 
        <div id="header">
            <a href="#">
                <img id="logo" src="Images/Logo.png" alt="Trackerz logo"/>
            </a>
            <div id="todays_date" data-bind="text: date"></div>
            <div id="time_now" data-bind="html: currentTime"></div>
        </div>

        <div class="vbuffer1"></div>
        <!--
        ****************************************************
        *               Background Transition              *
        ****************************************************
        -->
        <div id="bg_transition">
            <img src="Images/ARU_short.jpg" alt="ARU"/>
            <img src="Images/Bradford_short.jpg" alt="Bradford"/>
            <img src="Images/Brum_short.jpg" alt="Birmingham"/>
            <img src="Images/Cardiff_short.jpg" alt="Cardiff"/>
            <img src="Images/Lampeter_short.jpg" alt="Lampeter"/>
            <img src="Images/Soton_short.jpg" alt="Southampton"/>
        </div>


        <!--
        ****************************************************
        *                     Login Bar                    *
        ****************************************************
        -->
        <div id="login">
            <div class="medium_text">
                <form action="Log_in" method="POST">
                    Username
                    <input name="userName" id="username" type="text" placeholder=" Username" size="20" tabindex="1" value="" />					
                    Password
                    <input name="password" id="password" type="password" placeholder=" Password" size="20" tabindex="2" value="" />
                    <input class="button-link" name="submit" type="submit" tabindex="3" value="Login" />
                    <a href="mailto:jimivine@gmail.com?Subject=Forgotten%20Trackerz%20Password" target="_top" tabindex="4" 
                       style="text-decoration:underline;color:white;font-weight:normal">
                        Forgotten password?
                    </a>
                </form>
            </div>
        </div>

        <!--
        ****************************************************
        *                     Footer                       *
        ****************************************************
        -->
        <div id="footer">
            <section class="tabs">            
                <div class="buffer1"></div>
                <span class="anchor" id="about"></span>
                <div class="panel">
                    <a class="tab-link" href="#about">
                        <img src="Images/About.png" alt="About"/>
                        <h1>ABOUT TRACKERZ</h1>
                        <p>Find out about our free service and how to keep track of your fitness</p>
                    </a>
                    <div class="labels1"> 
                        <article>
                            <h4 id='about-ul'>ABOUT TRACKERZ</h4>
                            <p>Trackerz helps you keep track of your weight and fitness. 
                                It's the best way to monitor progress and join groups
                                with people who are also fitness focused.</p>
                            <p>Trackerz is a free service. You sign up, login, build a profile, 
                                find a group and then you are ready to become an 
                                active member of Trackerz, the latest in social health tracker 
                                application for students.</p>
                        </article> 
                        <img src="Images/About_big.png" alt="About"/>
                    </div>
                </div>                    
                <div class="buffer2"></div>
                <span class="anchor" id="join"></span>
                <div class="panel">
                    <a class="tab-link" href="#join">
                        <img src="Images/Join.png" alt="Join"/>
                        <h1>JOIN TRACKERZ</h1>
                        <p>Join up to the fastest growing health tracker network 
                            for students on the internet and it's free!</p>
                    </a>                    
                    <div class="labels1"> 
                        <article>
                            <h4 id='join-ul'>JOIN TRACKERZ</h4>
                            <p>Please complete the form with a username and password between 
                                8 and 20 characters long.</p>

                            <p>Once you've successfully created an account you can set up a 
                                profile, find groups and start tracking!</p>
                        </article>
                        <article class="signup">
                            <img src="Images/Join_big.png" alt="Join"/>
                            <form name="joinus" action="Register_User" method="POST"> 
                                <h2>Create an account</h2>
                                <h4>Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Forename</h4>
                                <input type="text" name="rUsername" id="newUsername" placeholder="Username" />
                                <input type="text" name="rFirstName" id="newFirstname" placeholder="Forename" />
                                <h4>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surname</h4>
                                <input type="text" name="newEmail" placeholder="Email Address" />
                                <input type="text" name="rLastName" id="newLastname" placeholder="Surname" />
                                <h4>Height&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Weight</h4>
                                <input type="text" name="rHeight" id="newHeight" placeholder="Height" />
                                <input type="text" name="rWeight" id="newWeight" placeholder="Weight" />
                                <h4>Password</h4>
                                <input type="password" name="rPassword" id="newPassword" type="password" placeholder="Password" />
                                <h4>Please confirm your Password</h4>
                                <input name="newConfirm" type="password" placeholder="Re-enter password" />
                                <h4></h4>   
                                <input name="newCheck" type="checkbox" />                
                                I agree with the <a href="#" onclick="return displayTandC();" style="text-decoration:underline;color:#164f7d;font-weight:bold">terms and conditions</a>
                                <h4></h4> 
                                <input name="newSubmit" class="button-link2" type="submit"  value="Sign Up"/>
                                <h4></h4> 
                            </form>
                        </article>                        
                    </div>
                </div>
                <div class="buffer2"></div>                 
                <span class="anchor" id="roll"></span>
                <div class="panel">
                    <a class="tab-link" href="#roll">
                        <img class="icon" src="Images/Roll.png" alt="Roll"/>
                        <h1>FEATURES</h1>
                        <p>See what fitness groups we have on-line. If you can't 
                            find yours be the first to join</p>
                    </a>                    
                    <div class="labels1"><article><h4 id='roll-ul'>FEATURES</h4></article>                        
                        <article id="uniroll">
                            <ul>
                                <li>USE CASES</li>
                                <li>MORE USE CASES</li>
                            </ul>
                        </article>
                        <img src="Images/Roll_big.png" alt="Roll"/>
                    </div>
                </div>            
                <div class="buffer1"></div>
                
            </section>            
        </div>
        <script>
            $(function() {
                myApp.vm = new myApp.LoginViewModel();
                ko.applyBindings(myApp.vm);
            });
        </script>
    </body>
</html>
