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
public class Registered_Meal extends Activity{
    private int registeredMeal_ID;
    private int meal_Sustenance_ID;
    private String type;
    
    //Default constructor
    public Registered_Meal(){}
    
    
    public double getFullCalories(){
        //still needs to be implemented
        return 0;//garbage value
    }
    
    //Accessors
    public int getRegisteredMealID(){
        return registeredMeal_ID;
    }
    public int getMealSustenanceID(){
        return meal_Sustenance_ID;
    }
    public String getType(){
        return type;
    }
    //Mutators
    public void setType(String given){
        type = given;
    }
}
