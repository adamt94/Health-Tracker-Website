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
public class Goal {
    
    private int Goal_ID;
    private int user_Name;
    private String description;
    private int totalWeight;
    private String targetDate;
    
    //default constructor
    public Goal(){}

    public Goal(int Goal_ID, int user_Name, String description, String targetDate) {
        this.Goal_ID = Goal_ID;
        this.user_Name = user_Name;
        this.description = description;
        this.targetDate = targetDate;
    }
    
    
  
    /**
     * @return the Goal_ID
     */
    public int getGoal_ID() {
        return Goal_ID;
    }

    /**
     * @param Goal_ID the Goal_ID to set
     */
    public void setGoal_ID(int Goal_ID) {
        this.Goal_ID = Goal_ID;
    }

    /**
     * @return the user_Name
     */
    public int getUser_Name() {
        return user_Name;
    }

    /**
     * @param user_Name the user_Name to set
     */
    public void setUser_Name(int user_Name) {
        this.user_Name = user_Name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the totalWeight
     */
    public int getTotalWeight() {
        return totalWeight;
    }

    /**
     * @param totalWeight the totalWeight to set
     */
    public void setTotalWeight(int totalWeight) {
        this.totalWeight = totalWeight;
    }

    /**
     * @return the targetDate
     */
    public String getTargetDate() {
        return targetDate;
    }

    /**
     * @param targetDate the targetDate to set
     */
    public void setTargetDate(String targetDate) {
        this.targetDate = targetDate;
    }
    
}
