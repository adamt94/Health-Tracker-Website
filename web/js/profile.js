var myApp = (function(myApp) {

    "use strict";
    myApp.ProfileViewModel = function() {
        var self = this;
        self.university = ko.observableArray([]);
        self.currentTime = ko.observable();
        self.date = ko.observable();
        self.friend = ko.observableArray([]);
        self.username = ko.observable();
        self.password = ko.observable();
        self.full_name = ko.observable();
        self.years = ko.observable();
        self.course = ko.observable();
        self.status = ko.observable();
        self.updFullname = ko.observable();
        self.updUni = ko.observable();
        self.updYears = ko.observable();
        self.updCourse = ko.observable();
        self.updStatus = ko.observable();
        self.findname = ko.observable();
        self.uniyears = ko.observable();
        self.uni_name = ko.observable();
        self.f_full_name = ko.observable();
        self.f_years = ko.observable();
        self.f_course = ko.observable();
        self.f_status = ko.observable();
        self.f_uni_name = ko.observable();
        self.folders = ['Inbox', 'Archive', 'Sent', 'Spam'];
        self.chosenFolderId = ko.observable();
        self.chosenFolderData = ko.observable();
    
            // Behaviours    
        self.goToFolder = function(folder) { 
            self.chosenFolderId(folder);
            $.get('/mail', { folder: folder }, self.chosenFolderData);
        };

        // Show inbox by default
        self.goToFolder('Inbox');
        };
        
    return myApp;
}(myApp || {}));

myApp.getFriendData = function() {

        var url = "http://localhost:8084/Alumni_JV1/services/friends.json?username=" + myApp.vm.username();
    console.log(url);
    $.getJSON(url, function(data) {

        myApp.vm.friend(data.friends);

    });
};


myApp.viewProfile = function() {

    var url = "http://localhost:8084/Alumni_JV1/services/student.json?username=" + myApp.vm.username();
    console.log(url);
    $.getJSON(url, function(data) {
        var e = "-";
        myApp.vm.full_name(data.full_name);
        myApp.vm.course(data.course);
        var a = data.university;
        var b = data.years;
        var c = a + " (" + b + ")";
        myApp.vm.uniyears(c);
        var d = data.status;
        if (typeof d === null) {
            myApp.vm.status(e);
        } else {
            myApp.vm.status(data.status);
        }
        myApp.getFriendData();
    });
};

myApp.fillProfileForm = function() {

    var url = "http://localhost:8084/Alumni_JV1/services/student.json?username=" + myApp.vm.username();
    console.log(url);
    $.getJSON(url, function(data) {
        if (data.response === 'success') {
            myApp.vm.updFullname(data.full_name);
            myApp.vm.updCourse(data.course);
            myApp.vm.updUni(data.university);
            myApp.vm.updYears(data.years);
            myApp.vm.updStatus(data.status);
        } else {
            alert("We were unable to retrieve your profile. Please try again later.");
        }
    });
};

myApp.addFriend = function() {
        var url = "http://localhost:8084/Alumni_JV1/services/friend.json?username=" + myApp.vm.username() 
                        + "&friends_name=" + myApp.vm.f_full_name();
    console.log(url);
    $.getJSON(url, function(data) {
        if (data.response === 'success') {
            window.location.href = "profile.jsp?username=" + data.username;
        } else {
            alert("We were unable to link you to your friend at this time");
        }
    });
};

myApp.updProfile = function() {
    
    var actionind = 1;
    var url = "http://localhost:8084/Alumni_JV1/services/student.json?username=" + myApp.vm.username()
            + "&full_name=" + myApp.vm.updFullname() 
            + "&uniname=" + myApp.vm.updUni() 
            + "&years=" + myApp.vm.updYears()
            + "&course=" + myApp.vm.updCourse() 
            + "&status=" + myApp.vm.updStatus() 
            + "&actionind=" + actionind;
    console.log(url);

    $.getJSON(url, function(data) {

        if (data.response === 'success') {
            window.location.href = "profile.jsp?username=" + data.username;
        } 
        if (data.response === 'fail') {
            alert("We were unable to update your profile. Please try again later.");
        }
        if (data.response === 'nouni') {
            alert("We were unable to find the university. Please check the spelling and try again.");
        }        
        actionind = 0;
    });
};
myApp.checkSearch = function() {
    var a = myApp.vm.findname();
    if (typeof a === 'undefined') {
        alert("Please enter a name before clicking on Search!");
    } else {
        myApp.findFriend();
    }
};
myApp.findFriend = function() {

    var url = "http://localhost:8084/Alumni_JV1/services/student.json?username=" + myApp.vm.findname();
 
    console.log(url);
    $.getJSON(url, function(data) {

        if (data.response === 'success') {
            myApp.vm.f_full_name(data.full_name);
            myApp.vm.f_uni_name(data.uni_name);
            myApp.vm.f_course(data.course);
            myApp.vm.f_years(data.years);
            myApp.vm.f_status(data.status);
        } else {
            alert("We couldn't find anyone of that name. Please try again.");
        }
    });
};

setInterval(function (){
    myApp.vm.currentTime(formatAMPM());
    myApp.vm.date(formatDDMMYY());
},2000);

myApp.getUniversityData = function() {
    $.getJSON("services/university.json", function(data) {
        
        var unis = data.universities;
        var hrefArray = [];
        
        for(var i=0; i<unis.length; i++){
            hrefArray.push({
                name: unis[i].university,
                href: 'http://localhost:8084/Alumni_JV1/uniprofile.jsp?uni_name=' + unis[i].university + '#view'
            });
        }
        myApp.vm.university(hrefArray); //http://localhost:8084/Alumni_JV1/#Cambridge (for example)
    });
};
myApp.getUniversityData();

