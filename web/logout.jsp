<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

    <head>
        <title>ViTracker - Log Out</title>
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
            <a href="index.jsp">
                <img id="logo" src="Images/Logo.png" alt="Alumni logo"/>
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
            <div id="alumni">
                <img src="Images/Alumni_big.png" alt="Alumni"/>
            </div>           
            <div id="welcome">
                You've successfully logged out!
            </div>
            <!--shows whether user has logged out-->
            <div id="name" data-bind="text: username"> 
            </div>

        </div>

        <!--
        ****************************************************
        *                     Footer                       *
        ****************************************************
        -->
        <div id="footer">
            <section class="tabs">            
                                
                <div class="buffer4"></div>
                <span class="anchor" id="logout"></span>
                <div class="panel">
                    <a class="tab-link" href="index.jsp">
                        <img src="Images/Logout.png" alt="Logout"/>
                        <h2>LOGIN</h2>
                    </a>
                    <div class="labels1"> 
                        <article>
                            <h4 id='logout-ul'>LOGOUT</h4>
                            <p>Alumni helps you keep in touch with your friends from 
                                university. It's the best way to find out what's going on 
                                and share instantly what's on your mind.</p>

                            <p>Alumni is a free service. You sign up, login, build a profile, 
                                find your friends and then you are ready to become an 
                                active member of Alumni, the latest in social networking 
                                for students.</p>
                        </article> 

                        <img src="Images/Logout_big.png" alt="Logout"/>
                    </div>
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


