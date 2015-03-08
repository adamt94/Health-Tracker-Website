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
    private int calories;

    public Sustenance(int sustenanceID, String name, int calories) {
        this.sustenanceID = sustenanceID;
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
    public int getCalories() {
        return calories;
    }

    /**
     * @param calories the calories to set
     */
    public void setCalories(int calories) {
        this.calories = calories;
    }
    
}
