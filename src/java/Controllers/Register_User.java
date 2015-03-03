/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Stuart
 */
@WebServlet(name = "Register_User", urlPatterns = {"/Register_User"})
public class Register_User extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Database database = new Database();
            String givenUsername = request.getParameter("rUsername");
            String givenPass = request.getParameter("rPassword");
            String givenFName = request.getParameter("rFirstName");
            String givenLName = request.getParameter("rLastName");
            String gEmail = request.getParameter("rEmail");
            double gHeight = Double.valueOf(request.getParameter("rHeight"));
            double gWeight = Double.valueOf(request.getParameter("rWeight"));
            
            //If a user with this username already exists in the database
            if(database.getUser(givenUsername) != null){
                //send the user to an error details page
                //NOT IMPLEMENTED SO FAR NOW JUST REDIRECT TO INDEX.JSP
                System.out.println("Register_User error: user already found");
                response.sendError(400, "User already exists");
            } else {
                //Otherwise the username is free and the user can be made
                Models.User newUser = new Models.User(givenUsername, givenPass, 
                        givenFName, givenLName, gEmail, gWeight, gHeight);
                
                //Register the user to the database
                database.registerUser(newUser);
                
                //For now just redirect to index page BUT SHOULD GO TO REGISTRATION SUCCESS PAGE
                System.out.println("success redirect");
                response.sendRedirect("index.jsp");
            }
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
