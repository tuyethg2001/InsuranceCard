/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDBContext;
import dao.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;

/**
 *
 * @author ADMIN
 */
public class ResetPassword extends HttpServlet {

    private String passwordGenerator() {
        String pass = "";
        for (int i = 0; i < 10; i++) {
            pass += randomChar();
        }
        return pass;
    }

    private char randomChar() {
        int rand = (int) (Math.random() * 62);
        if (rand <= 9) {
            int ascii = rand + 48;
            return (char) ascii;
        } else if (rand <= 35) {
            int ascii = rand + 55;
            return (char) ascii;
        } else {
            int ascii = rand + 61;
            return (char) ascii;
        }
    }

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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("view/reset_pass.jsp").forward(request, response);
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");

        String newPass = passwordGenerator();
        String email = request.getParameter("email");
        String mess = "";
        AccountDBContext dbA = new AccountDBContext();
        boolean checkExist = dbA.checkExist(email);

        if (checkExist) {
            String subject = "INSURANCE CARD SYSTEM";
            String message = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "    <div>Remember to change your password for a higher security!"
                    + "</div>\n"
                    + "    <div>Your new password is: "
                    + "</div>\n"
                    + "    <div style=\"font-weight: bold; font-size: 20px;\">" + newPass
                    + "</div>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";
            SendMail.send(email, subject, message, "insurancecard1517@gmail.com", "team1se1517");
           dbA.resetPass(newPass, email);
            mess = "A new password has been sent to your email.";
        } else {
            mess = "Invalid email. Please check again!";
        }
        request.setAttribute("email", email);
        request.setAttribute("checkExist", checkExist);
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("view/reset_pass.jsp").forward(request, response);
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
