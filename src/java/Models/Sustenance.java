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
public class Sustenance extends Activity {
    private int sustenanceID;
    private String name;
    private double calories;
    private String created_by;

    public Sustenance(int sustenanceID, String name, double calories) {
        this.sustenanceID = sustenanceID;
        this.name = name;
        this.calories = calories;
    }
    
    public Sustenance(String name, double calories){
        this.name = name;
        this.calories = calories;
    }

    public Sustenance() {
    }

    /**
     * @return the sustenanceID
     */
    public int getSustenanceID() {
        return sustenanceID;
    }

    /**
     * @param sustenanceID the sustenanceID to set
     */
    public void setSustenanceID(int sustenanceID) {
        this.sustenanceID = sustenanceID;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the calories
     */
    public double getCalories() {
        return calories;
    }

    /**
     * @param calories the calories to set
     */
    public void setCalories(int calories) {
        this.calories = calories;
    }
    
    /**
     * @return the creator of this sustenance
     */
    public String getCreatedBy() {
        return created_by;
    }
    
    /**
     * @param creator the creator of this sustenance
     */
    public void setCreatedBy(String creator){
        created_by = creator;
    }
}
