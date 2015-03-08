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
public class Group  {
    
    private String name;
    private String admin_User;

    public Group() {
    }

    public Group(String name) {
        this.name = name;
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
     * @return the admin_User
     */
    public String getAdmin_User() {
        return admin_User;
    }

    /**
     * @param admin_User the admin_User to set
     */
    public void setAdmin_User(String admin_User) {
        this.admin_User = admin_User;
    }
    
    
}
