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
        }
        //Return false for failure
        return false;//garbage
    }

    //Get ResultSet of User's exercise history
    public ResultSet getUserExerciseHistory(User user) {
        try {
            String sql;
            //Get all the user's store exercise information
            sql = "SELECT * FROM activity \n" +
                  "INNER JOIN exercise_session ON (activity.\"activityID\" = exercise_session.\"activityID\") \n" +
                  "INNER JOIN exercise_type ON (exercise_session.\"exerciseID\" = exercise_type.\"exerciseID\")\n" +
                  "WHERE activity.username = '" + user.getUsername() + "'";
            ResultSet rs;
            Database db = new Database();
            rs = db.runQuery(sql, db.getConnection());
            return rs;
        } catch (Exception ex) {

        }
        return null;//garbage
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
