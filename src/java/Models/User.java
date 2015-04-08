/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Stuart
 */
public class User {

    private String user_name;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private double weight;//Need to update diagrams from int to double
    private double height;//Need to update diagrams from int to double

    //Default constructor
    public User(){}

    public User(String gUsername, String gPassword, String gFirst, String gLast, String gEmail,
            double gWeight, double gHeight) {
        user_name = gUsername;
        password = gPassword;
        firstName = gFirst;
        lastName = gLast;
        email = gEmail;
        weight = gWeight;
        height = gHeight;
    }
    
    public User(String gUsername, String gFirst, String gLast, String gEmail,
            double gWeight, double gHeight) {
        user_name = gUsername;
        firstName = gFirst;
        lastName = gLast;
        email = gEmail;
        weight = gWeight;
        height = gHeight;
    }
    
    //Accessors
    public String getUsername(){
        return user_name;
    }
    public String getPassword(){
        return password;
    }
    public String getFirstName(){
        return firstName;
    }
    public String getLastName(){
        return lastName;
    }
    public String getEmail(){
        return email;
    }
    public double getWeight(){
        return weight;
    }
    public double getHeight(){
        return height;
    }
    
    //Mutators
    public void setPassword(String given){
        password = given;
    }
    public void setFirstName(String given){
        firstName = given;
    }
    public void setLastName(String given){
        lastName = given;
    }
    public void setEmail(String given){
        email = given;
    }
    public void setWeight(double given){
        weight = given;
    }
    public void setHeight(double given){
        height = given;
    }
    
    public double calculateBMI() {
        //Divide weight in kg by height in m
        //Finally divide by height in m again
        double bmi = (weight/(height))/height;
        //Round the final figure to 2 decimal places
        bmi = (double)Math.round(bmi * 100) / 100;
        return bmi;
    }
    public double recommendedCalorieIntake(){
        //caculate the  Basal Metabolic Rate 
        //this tells you how many calories needed for body to function properly
        //these varibles are needed to calulate it
        int male = 5;
        int female = -161;
        int age = 20;
        double sedentry = 1.2;
        double lightlyActive = 1.375;
        double moderatelyActive = 1.55;
        double veryActive = 1.725;
        double bmr = ((6.25*(height*10)) + (10*weight) - (5*age)+male)*sedentry;
        //recommended  to lose 0.5kg a week (to lost 1kg would be -1000 etc)
        double reccommendedCalorieIntake = -500;
        double result = bmr -reccommendedCalorieIntake;
        return result;
    }
    
}
