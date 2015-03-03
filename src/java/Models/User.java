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
    
}
