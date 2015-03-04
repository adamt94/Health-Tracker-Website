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
public class Exercise_Session extends Activity{
    private int session_ID;
    private int exercise_ID;
    private int duration;
    private int distance;
    
    //Default constructor
    public Exercise_Session(){}
    
    //Accessors
    public int getSessionID(){
        return session_ID;
    }
    public int getExerciseID(){
        return exercise_ID;
    }
    public int getDuration(){
        return duration;
    }
    public int getDistance(){
        return distance;
    }
    //Mutators
    public void setDuration(int given){
        duration = given;
    }
    public void setDistance(int given){
        distance = given;
    }
}
