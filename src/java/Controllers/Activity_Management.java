/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controllers;

import Models.Exercise_Type;
import Models.Sustenance;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Stuart
 */
@WebServlet(name = "Activity_Management", urlPatterns = {"/Activity_Management"})
public class Activity_Management extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //Get the current session's user
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("loggedInUser");
            
            Database db = new Database();
            //Get the available exercises to choose from
            ArrayList<Exercise_Type> exercises = db.getAvailableExercises();
            request.setAttribute("availExercises", exercises);
            
            //Get the user's exercise history
            ResultSet exerciseHistory = db.getUserExerciseHistory(currentUser);
            request.setAttribute("exerciseHistory", exerciseHistory);
            
            //Get the available sustenances to choose from
            ArrayList<Sustenance> sustenances = db.getSustenanceChoices(currentUser.getUsername());
            request.setAttribute("availSustenances", sustenances);
            
            //Get the user's meal activity for the current date
            ResultSet breakfastHistory = db.getSustenanceInMealType(currentUser.getUsername(), "2015-03-15", "breakfast");
            ResultSet lunchHistory = db.getSustenanceInMealType(currentUser.getUsername(), "2015-03-15", "lunch");
            ResultSet dinnerHistory = db.getSustenanceInMealType(currentUser.getUsername(), "2015-03-15", "dinner");
            ResultSet snacksHistory = db.getSustenanceInMealType(currentUser.getUsername(), "2015-03-15", "snacks");
            request.setAttribute("breakfastHistory", breakfastHistory);
            request.setAttribute("lunchHistory", lunchHistory);
            request.setAttribute("dinnerHistory", dinnerHistory);
            request.setAttribute("snacksHistory", snacksHistory);
            
            //Send user to the activity management page
            request.getRequestDispatcher("activityManagement.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
