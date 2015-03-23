package Models;

public class Goal {
    
    private int Goal_ID;
    private String user_name;
    private String group_name;
    private String description;
    private int targetWeight;
    private String targetDate;
    
    //default constructor
    public Goal(){}

    public Goal(int Goal_ID, String group_name,int targetWeight, String description, String targetDate) {
        this.Goal_ID = Goal_ID;
        this.group_name = group_name;
        this.description = description;
        this.targetDate = targetDate;
        this.targetWeight = targetWeight;
    }
    
    public Goal(String user_name,int targetWeight, String description, String targetDate) {
        this.user_name = user_name;
        this.description = description;
        this.targetDate = targetDate;
        this.targetWeight = targetWeight;
    }
    
    public Goal(String user_name,int targetWeight, String description, String targetDate, String group_name) {
        this.user_name = user_name;
        this.description = description;
        this.targetDate = targetDate;
        this.targetWeight = targetWeight;
        this.group_name = group_name;
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
    public String getGroup_name() {
        return group_name;
    }

    /**
     * @param groupname the group_name to set
     * 
     */
    public void setGroup_name(String groupname) {
        this.group_name = groupname;
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
    public int getTargetWeight() {
        return targetWeight;
    }

    /**
     * @param targetWeight the totalWeight to set
     */
    public void setTotalWeight(int targetWeight) {
        this.targetWeight = targetWeight;
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

    /**
     * @return the user_name
     */
    public String getUsername() {
        return user_name;
    }

    /**
     * @param user_name the user_name to set
     */
    public void setUsername(String user_name) {
        this.user_name = user_name;
    }
    
}
