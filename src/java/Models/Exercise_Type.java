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
public class Exercise_Type {
    private int exerciseID;
    private String name;
    
    //Default constructor
    public Exercise_Type(){}
    
    //Accessors
    public int getExerciseID(){
        return exerciseID;
    }
    public String getName(){
        return name;
    }
    //Mutators
    public void setName(String name){
        this.name = name;
    }
}
