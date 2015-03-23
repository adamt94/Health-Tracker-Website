package Controllers;

import Models.Activity;
import Models.Exercise_Session;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;

//Models
import Models.User;
import Models.Exercise_Type;
import Models.Goal;
import Models.Group;
import Models.Membership;
import Models.Registered_Meal;
import Models.Sustenance;
import java.util.ArrayList;

public class Database {

    //Default constructor
    public Database() {
    }

    //DATABASE LOGIC METHODS BELOW
    //Checks if the provided credentials appear in our database
    public boolean validateUser(String userName, String password) {
        try {
            String sql = "SELECT user_name,password FROM users\n"
                    + "WHERE user_name = '" + userName
                    + "' AND password ='" + password + "'";
            ResultSet rs;
            rs = runQuery(sql, getConnection());

            //If the result set contains an entry and thus the user exists
            if (rs.first()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("validateUser error:" + ex);
        } catch (ServletException ex) {
            System.out.println("validateUser error:" + ex);
        }
        return false;
    }

    //Gets the user's details from the database and
    //returns them as a User object
    public User getUser(String username) {
        User aUser;
        try {
            String sql = "SELECT * FROM users"
                    + " WHERE user_name = '" + username + "';";
            ResultSet rs;
            rs = runQuery(sql, getConnection());

            //If nothing found return null
            if (!rs.first()) {
                return null;
            }

            String password = rs.getString("password");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String email = rs.getString("email");
            double weight = rs.getDouble("weight");
            double height = rs.getDouble("height");
            aUser = new User(username, password, firstName, lastName, email, weight, height);
        } catch (ServletException ex) {
            System.out.println("getUser error:" + ex);
            return null;
        } catch (SQLException ex) {
            System.out.println("getUser error:" + ex);
            return null;
        }
        return aUser;
    }

    //Registers a new user into the database
    public void registerUser(User user) {
        String sql;
        sql = "INSERT INTO users(user_name, password,\"firstName\", \"lastName\", email, weight, height) "
                + "VALUES('" + user.getUsername() + "', '" + user.getPassword() + "', '"
                + user.getFirstName() + "', '" + user.getLastName() + "', '" + user.getEmail() + "', '"
                + user.getWeight() + "', '" + user.getHeight() + "');";
        try {
            runUpdateQuery(sql, getConnection());
        } catch (ServletException ex) {
            System.out.println("Register User error: " + ex);
        }
    }

    public void updateUser(User user) {
        try {
            String sql;
            sql = "UPDATE users \n"
                    + "SET \"firstName\"='" + user.getFirstName()
                    + "', \"lastName\"='" + user.getLastName()
                    + "', email='" + user.getEmail()
                    + "', weight='" + user.getWeight()
                    + "', height='" + user.getHeight() + "'\n"
                    + "WHERE user_name = '" + user.getUsername() + "';";
            runUpdateQuery(sql, getConnection());
        } catch (ServletException ex) {
            System.out.println("updateUser error: " + ex);
        }
    }

    //For getting all available exercise types from the database
    public ArrayList<Exercise_Type> getAvailableExercises() {
        try {
            String sql;
            sql = "SELECT * FROM exercise_type";
            ResultSet rs;
            rs = runQuery(sql, getConnection());

            //For storing all the available exercises
            ArrayList<Exercise_Type> exercises = new ArrayList();

            while (rs.next()) {
                //Get the exercise ID
                int exerciseID = Integer.valueOf(rs.getString("exerciseID"));
                //Get the name of the exercise
                String name = rs.getString("name");
                //Get the calories burned per minute of the exercise
                double caloriesPerMinute = Double.valueOf(rs.getString("caloriesPerMinute"));
                //Add a new exercise object to our arraylist
                exercises.add(new Exercise_Type(exerciseID, name, caloriesPerMinute));
            }

            return exercises;

        } catch (Exception ex) {
            //Change this later
            System.out.println("getAvailableExercises error: " + ex);
        }
        return null;//garbage
    }

    //Add activity parts of an activity to the database
    //Returns the activity id of the created activity entry
    public int addActivity(Activity activity) {
        try {
            String sql;

            sql = "INSERT INTO activity(username, date) "
                    + "VALUES ('" + activity.getUsername() + "', '"
                    + activity.getDate() + "')"
                    + "RETURNING \"activityID\";";
            Database db = new Database();
            ResultSet rs = runQuery(sql, db.getConnection());

            rs.first();
            System.out.println("activity id: " + rs.getInt("activityID"));
            return rs.getInt("activityID");
        } catch (Exception ex) {
            System.out.println("addActivity error: " + ex);
        }
        return -1;//Failure return
    }

    //Add exercise activity to the database
    public boolean registerExercise(Exercise_Session e) {
        try {

            //Update the activity table
            int activityID = addActivity(e);

            //Update the exercise_session table
            String sql;
            sql = "INSERT INTO exercise_session(\"activityID\", \"exerciseID\", duration, distance) "
                    + "VALUES('" + activityID + "','"
                    + e.getExerciseID() + "', '"
                    + e.getDuration() + "', '"
                    + e.getDistance()
                    + "');";
            Database db = new Database();
            db.runUpdateQuery(sql, db.getConnection());

            //Return true for success
            return true;
        } catch (Exception ex) {
            System.out.println("registerExercise error: " + ex);
            //Return false for failure
            return false;
        }
    }

    //Get ResultSet of User's exercise history
    public ResultSet getUserExerciseHistory(User user) {
        try {
            String sql;
            //Get all the user's store exercise information
            sql = "SELECT * FROM activity \n"
                    + "INNER JOIN exercise_session ON (activity.\"activityID\" = exercise_session.\"activityID\") \n"
                    + "INNER JOIN exercise_type ON (exercise_session.\"exerciseID\" = exercise_type.\"exerciseID\")\n"
                    + "WHERE activity.username = '" + user.getUsername() + "'";
            ResultSet rs;
            Database db = new Database();
            rs = db.runQuery(sql, db.getConnection());
            return rs;
        } catch (Exception ex) {
            //There was an error
            System.out.println("getUserExerciseHistory error: " + ex);
            return null;
        }
    }

    //Get the sustenance options the user can choose from
    //Takes sustenance defined by SYSTEM and by given username
    public ArrayList<Sustenance> getSustenanceChoices(String username) {
        try {
            String sql;
            sql = "SELECT * FROM sustenance \n"
                    + "WHERE created_by = 'SYSTEM' OR created_by = '" + username + "'";
            ResultSet rs;
            Database db = new Database();
            rs = db.runQuery(sql, db.getConnection());

            //For storing all the available exercises
            ArrayList<Sustenance> sustenances = new ArrayList();

            //For each found sustenance
            while (rs.next()) {
                //Get details of sustenance
                int sustID = rs.getInt("sustenance_id");
                String name = rs.getString("name");
                double calories = rs.getDouble("calories");
                Sustenance s = new Sustenance(sustID, name, calories);

                //Add this to the list
                sustenances.add(s);
            }

            //Return list
            return sustenances;
        } catch (Exception ex) {
            System.out.println("getSustenanceChoices error: " + ex);
            return null;
        }
    }

    //Get items in given meal
    //Username of user
    //Date given in format DD/MM/YY
    //Type chosen from 'breakfast', 'lunch', 'dinner', 'snacks'
    public ResultSet getSustenanceInMealType(String username, String date, String type) {
        try {
            String sql;
            sql = "SELECT name, calories\n"
                    + " FROM sustenance\n"
                    + " INNER JOIN meal_sustenance ON sustenance.sustenance_id = meal_sustenance.sustenance_id\n"
                    + " INNER JOIN registered_meal ON meal_sustenance.\"meal_sustenance_ID\" = registered_meal.\"meal_sustenance_ID\"\n"
                    + " INNER JOIN activity ON registered_meal.\"activityID\" = activity.\"activityID\"\n"
                    + " WHERE registered_meal.type = '" + type + "'\n"
                    + " AND activity.date = '" + date + "'\n"
                    + " AND activity.username = '" + username + "'";
            ResultSet rs;
            Database db = new Database();
            rs = db.runQuery(sql, db.getConnection());
            return rs;
        } catch (Exception ex) {
            //There was an error
            System.out.println("getSustenanceInMeal error: " + ex);
            return null;
        }
    }

    public void addSustenanceToMeal(String username, String date, String type, int sustenanceID) {
        try {
            String sql;
            //Check for registered meals on given date and of given type belonging to this user
            sql = "SELECT registered_meal.\"meal_sustenance_ID\"\n"
                    + " FROM registered_meal\n"
                    + " INNER JOIN meal_sustenance ON meal_sustenance.\"meal_sustenance_ID\" = registered_meal.\"meal_sustenance_ID\"\n"
                    + " INNER JOIN activity ON registered_meal.\"activityID\" = activity.\"activityID\"\n"
                    + " WHERE registered_meal.type = '" + type + "'\n"
                    + " AND activity.date = '" + date + "'\n"
                    + " AND activity.username = '" + username + "'";
            ResultSet rs;
            Database db = new Database();
            rs = db.runQuery(sql, db.getConnection());

            //If a meal already exists for this date and type
            if (rs.first()) {
                System.out.println("Meal already made for this date and type...");
                //Add given sustenance to this registered meal's meal_sustenance_ID
                sql = "INSERT INTO meal_sustenance(\"meal_sustenance_ID\", sustenance_id)\n"
                        + "VALUES (" + rs.getInt("meal_sustenance_ID") + ",'" + sustenanceID + "')";
                db.runUpdateQuery(sql, db.getConnection());
            } else {
                //Otherwise if meal does not exist

                //Create entry in activity table for this activity...
                Registered_Meal newMeal = new Registered_Meal(username, date, type);
                int activityID = addActivity(newMeal);

                //Create a registered_meal and return the meal sustenance id it creates...
                sql = "INSERT INTO registered_meal(\"activityID\", type)\n"
                        + "VALUES('" + activityID + "', '" + type + "')"
                        + "RETURNING \"meal_sustenance_ID\"";
                ResultSet result = db.runQuery(sql, db.getConnection());
                System.out.println("attempting to get meal id");
                result.first();
                int mealSustID = result.getInt("meal_sustenance_ID");

                //Add given sustenance to this registered meal using the obtained meal sustenance id...
                sql = "INSERT INTO meal_sustenance(\"meal_sustenance_ID\", sustenance_id)\n"
                        + "VALUES ('" + mealSustID + "','" + sustenanceID + "')";
                db.runUpdateQuery(sql, db.getConnection());
            }
        } catch (Exception ex) {
            //There was an error
            System.out.println("addSustenanceToMeal error: " + ex);
        }
    }

    //Create and associate a custom sustenance with a user
    public boolean addCustomSustenance(Sustenance sustenance) {
        try {

            //Create custom sustenance
            String sql;
            sql = "INSERT INTO sustenance(name, calories, created_by)\n"
                    + "VALUES('" + sustenance.getName()
                    + "','" + sustenance.getCalories() + "','"
                    + sustenance.getCreatedBy() + "')";
            Database db = new Database();
            db.runUpdateQuery(sql, db.getConnection());

            //Return true for success
            return true;
        } catch (Exception ex) {
            System.out.println("addCustomSustenance error: " + ex);
            //Return false for failure
            return false;
        }
    }

    //Register a new group
    public boolean registerGroup(Models.Group group) {
        try {
            //New entry in group table
            String sql = "INSERT INTO groups(group_name, admin_user)\n"
                    + " VALUES('" + group.getGroupName() + "', '"
                    + group.getAdmin_User() + "')";
            Database db = new Database();
            db.runUpdateQuery(sql, db.getConnection());

            //Return true for success
            return true;
        } catch (Exception ex) {
            System.out.println("registerGroup error: " + ex);
            return false;
        }
    }

    //Register a new group membership
    public boolean registerMembership(Models.Membership membership) {
        try {
            //Check if this membership already exists
            String sql = "SELECT * FROM group_membership "
                    + " WHERE group_name = '" + membership.getGroupName() + "' "
                    + "AND user_name = '" + membership.getUserName() + "'";

            Database db = new Database();
            ResultSet rs = db.runQuery(sql, db.getConnection());
            //If query returns a result
            if (rs.first()) {
                //Membership already exists so output error
                throw new Exception("Membership already exists for this group and user...");
            }

            //New entry in group membership table
            sql = "INSERT INTO group_membership(group_name, user_name)\n"
                    + " VALUES('" + membership.getGroupName() + "','"
                    + membership.getUserName() + "')";

            db.runUpdateQuery(sql, db.getConnection());
            return true;
        } catch (Exception ex) {
            System.out.println("registerMembership error: " + ex);
            return false;
        }
    }

    //Get a group's details from the group name
    public Group getGroup(String group_name) {
        try {
            String sql;
            sql = "SELECT * FROM groups"
                    + " WHERE group_name = '" + group_name + "'";
            Database db = new Database();
            ResultSet rs = db.runQuery(sql, db.getConnection());
            String groupname = rs.getString("group_name");
            String admin_user = rs.getString("admin_user");
            Group group = new Group(groupname, admin_user);
            return group;
        } catch (Exception ex) {
            System.out.println("getGroup error: " + ex);
            return null;
        }
    }

    //Get user's group memberships
    public ArrayList<Membership> getUserMemberships(String user_name) {
        try {
            String sql;
            sql = "SELECT * FROM group_membership "
                    + "WHERE user_name = '" + user_name + "'";
            Database db = new Database();
            ResultSet rs = db.runQuery(sql, db.getConnection());
            ArrayList<Membership> memberships = new ArrayList();
            while (rs.next()) {
                int id = rs.getInt("membership_id");
                String group_name = rs.getString("group_name");
                String username = rs.getString("user_name");
                Membership aMembership = new Membership(id, group_name, username);
                memberships.add(aMembership);
            }
            return memberships;
        } catch (Exception ex) {
            System.out.println("getUserMemberships error: " + ex);
            return null;
        }
    }

    //Get created groups
    public ArrayList<Group> getCreatedGroups(String user_name) {
        try {
            String sql;
            sql = "SELECT * FROM groups "
                    + "WHERE admin_user = '" + user_name + "'";
            Database db = new Database();
            ResultSet rs = db.runQuery(sql, db.getConnection());
            ArrayList<Group> groups = new ArrayList();
            while (rs.next()) {
                String group_name = rs.getString("group_name");
                String admin_user = rs.getString("admin_user");
                Group aGroup = new Group(group_name, admin_user);
                groups.add(aGroup);
            }
            return groups;
        } catch (Exception ex) {
            System.out.println("getCreatedGroups error: " + ex);
            return null;
        }
    }

    //Delete a membership given membership id
    public boolean deleteMembership(int membershipID) {
        try {
            String sql;
            Database database = new Database();
            sql = "DELETE FROM group_membership\n"
                    + "WHERE membership_id = '" + membershipID + "'";

            return database.runUpdateQuery(sql, database.getConnection());

        } catch (Exception ex) {
            System.out.println("deleteMembership error: " + ex);
            return false;
        }
    }

    //Delete a group given group name
    public boolean deleteGroup(String group_name) {
        try {
            String sql;
            sql = "DELETE FROM groups "
                    + "WHERE group_name = '" + group_name + "'";
            Database database = new Database();
            return database.runUpdateQuery(sql, database.getConnection());
        } catch (Exception ex) {
            System.out.println("deleteGroup error: " + ex);
            return false;
        }
    }

    //Create a goal
    public boolean createGoal(Goal e) {
        String sql;
        try {
            //If group name not provided
            if(e.getGroup_name() == null){
                sql = "INSERT INTO goal(user_name, description, target_weight, target_date)"
                    + " VALUES('" + e.getUsername() + "','"
                    + e.getDescription() + "','"
                    + e.getTargetWeight() + "','"
                    + e.getTargetDate() + "')";
            } else {
                //Otherwise if group name provided
                sql = "INSERT INTO goal(user_name, description, target_weight, target_date, group_name)"
                    + " VALUES('" + e.getUsername() + "','"
                    + e.getDescription() + "','"
                    + e.getTargetWeight() + "','"
                    + e.getTargetDate() + "','"
                    + e.getGroup_name() + "')";
            }
            
            Database db = new Database();
            db.runUpdateQuery(sql, db.getConnection());
            return true;
        } catch (Exception ex) {
            System.out.println("createGoal error: " + ex);
            //failure
            return false;
        }
    }

    //DATABASE ACCESS METHODS BELOW
    //A method for creating database connection
    public Connection getConnection() throws ServletException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            throw new ServletException(String.format("Error: Cannot find JDBC driver..."));
        }
        String username = "postgres"; //Username for database (postgres)
        String password = "postgres"; //Password for database (postgres)
        String url = "jdbc:postgresql://127.0.0.1/HealthTrackerDatabase"; //Url to connect to database
        Connection connection;
        try {
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (SQLException ex) {
            throw new ServletException(String.format("Error: Connection to database failed..."));
        }
    }

    //For queries which will add/modify database
    public boolean runUpdateQuery(String sql, Connection connection) throws ServletException {
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.executeUpdate(sql);
            connection.close();
            statement.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("runUpdateQuery error: " + ex);
            return false;
        }
    }

    public ResultSet runQuery(String sql, Connection connection) {

        ResultSet rs = null;
        try {
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery(sql);
            connection.close();//close connection
        } catch (SQLException ex) {
            System.out.println("runQuery error: " + ex);
        }
        return rs;
    }

    public void executeQuery(String sql, Connection connection) {

        try {
            Connection con = getConnection();
            Statement s = con.createStatement();

            s.execute(sql);

            con.close();
            s.close();
        } catch (ServletException ex) {
            System.out.println("Execute Query error: " + ex);
        } catch (SQLException ex) {
            System.out.println("Execute Query error: " + ex);
        }
    }

}
