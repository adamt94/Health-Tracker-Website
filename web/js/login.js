var myApp = (function(myApp) {

    "use strict";
    myApp.LoginViewModel = function() {
        var self = this;
        self.university = ko.observableArray([]);
        self.username = ko.observable();
        self.userName = ko.observable();
        self.password = ko.observable();
        self.newUsername = ko.observable();
        self.newFullname = ko.observable();
        self.newLastname = ko.observable();
        self.newPassword = ko.observable();
        self.newEmail = ko.observable();
        self.newConfirm = ko.observable();
        self.newCheck = ko.observable();
        self.currentTime = ko.observable();
        self.date = ko.observable();
    };
    return myApp;
}(myApp || {}));


setInterval(function (){
    myApp.vm.currentTime(formatAMPM());
    myApp.vm.date(formatDDMMYY());
},2000);


myApp.getUseCasesData = function() {
    $.getJSON("services/usecases.json", function(data) {
 
        myApp.vm.university(data.features);
 
    });
};
myApp.getUseCasesData();



myApp.getLogin = function() {

    var url = "http://localhost:8084/Health%20Tracker/services/login.json?userName=" + myApp.vm.userName()
            + "&password=" + myApp.vm.password();
    console.log(url);
    $.getJSON(url, function(data) {


        if (data.response === 'success') {
            window.location.href = "profile.jsp?userName=" + data.userName;
        } else {
            alert("Invalid Username or Password");
        }
    });
};

myApp.checkDetails = function() {
    /*
     var a = document.getElementById("newUsername");
     var b = document.getElementById("newPassword");
     var c = document.getElementById("newConfirm");
     var d = document.getElementById("newCheck");*/

    var a = myApp.vm.newUsername();
    var b = myApp.vm.newPassword();
    var c = myApp.vm.newConfirm();
    var d = myApp.vm.newCheck();
    var f = myApp.vm.newFullname();
    var g = myApp.vm.newLastname();

    var e = 0;
    var valid = false;

    //Alert 1 - null fields
    if (typeof a === 'undefined' || typeof b === 'undefined' || typeof f === 'undefined' || typeof g === 'undefined') {
        e = 1;
    }

    //Alert 10 - password
    if (b !== c) {
        e = e + 10;
    }

    //Alert 100 - terms
    if (d !== true) {
        e = e + 100;
    }

    switch (e) {
        case 1:
            alert("Please enter a Username, Full Name and Password before signing up!");
            break;
        case 10:
            alert("Please confirm Password before signing up!");
            break;
        case 100:
            alert("Please tick Terms and Conditions before signing up!");
            break;
        case 11:
            alert("Please enter a Username, Full Name and Password before signing up!");
            break;
        case 110:
            alert("Please confirm Password and tick Terms and Conditions before signing up!");
            break;
        case 101:
            alert("Please enter a Username, Full Name and Password before signing up!");
            break;
        case 111:
            alert("Please enter a Username, Full Name and Password before signing up!");
            break;
        case 0:
            myApp.checkNewAccountDetails();
            break;
    }
};

myApp.checkNewAccountDetails = function() {
    /*  check form as follows:
     *      username and password not blank
     *      password = confirm
     *      checkbox = true
     *      if ok call AddStudentController
     *          if response = success call profile.jsp
     *          else
     *          username already used 
     */

    var url = "http://localhost:8084/Health%20Tracker/services/check.json?userName=" + myApp.vm.newUsername()
            + "&fullname=" + myApp.vm.newFullname()
            + "&email=" + myApp.vm.newEmail()
            + "&password=" + myApp.vm.newPassword();


    console.log(url);

    $.getJSON(url, function(data) {
        if (data.response === 'success') {
            window.location.href = "profile.jsp?userName=" + data.userName;
        } else {
            alert("Error: Username already used");
        }
    });
};

function displayTandC() {
    alert("Be good, play fair.");
    return false;
};
