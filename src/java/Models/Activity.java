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
public abstract class Activity {
    protected int ActivityID;
    protected String username;
    protected String date;

    //Default constructor
    Activity(){}
    
    Activity(int id, String gUsername, String gDate){
        ActivityID = id;
        username = gUsername;
        date = gDate;
    }
    
    
    //Accessors
    int getActivityID(){
        return ActivityID;
    }
    String getUsername(){
        return username;
    }
    String getDate(){
        return date;
    }
    
    //Mutators
    void setUsername(String given){
        username = given;
    }
    void setDate(String given){
        date = given;
    }
    
}
