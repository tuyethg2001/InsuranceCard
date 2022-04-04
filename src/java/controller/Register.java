/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDBContext;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import javax.swing.*;

/**
 *
 * @author ASUS
 */
public class Register extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        LocalDate d = java.time.LocalDate.now();
        int day = d.getDayOfMonth();
        int month = d.getMonth().getValue();
        int year = d.getYear();

        String dateMax = (year - 16) + "-" + month + "-" + day;
        String dateMin = (year - 120) + "-" + month + "-" + day;
        request.setAttribute("dateMax", Date.valueOf(dateMax));
        request.setAttribute("dateMin", Date.valueOf(dateMin));
        request.getRequestDispatcher("view/register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected String cut(String input) {
        return input.replaceAll("\\s\\s+", " ").trim();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String pass2 = request.getParameter("password2");
        String personalID = request.getParameter("personalID");
        String address = cut(request.getParameter("address"));
        String firstName = cut(request.getParameter("firstName"));
        String lastName = cut(request.getParameter("lastName"));
        String dob = request.getParameter("dob");
        String province = request.getParameter("province");
        String district = request.getParameter("district");

        String mess_pass = "";
        if (!pass2.equals(pass)) {
            mess_pass += "Two passwords are different!";
        }

        String mess_pID = "";
        CustomerDBContext cdb = new CustomerDBContext();
        ArrayList<Customer> customers = cdb.checkDupRegister();
        for (Customer c : customers) {
            if (c.getPersonalID().equals(personalID)) {
                mess_pID += " PersonalID does exist!";
                break;
            }
        }

        String mess_email = "";
        for (Customer c : customers) {
            if (c.getAccount().getEmail().equals(email)) {
                mess_email += " Email does exist!";
                break;
            }
        }

        if (!mess_pass.equals("") || !mess_pID.equals("") || !mess_email.equals("")) {
            LocalDate d = java.time.LocalDate.now();
            int day = d.getDayOfMonth();
            int month = d.getMonth().getValue();
            int year = d.getYear();

            String dateMax = (year - 16) + "-" + month + "-" + day;
            String dateMin = (year - 120) + "-" + month + "-" + day;

            request.setAttribute("dateMax", Date.valueOf(dateMax));
            request.setAttribute("dateMin", Date.valueOf(dateMin));
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("personalID", personalID);
            request.setAttribute("address", address);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("dob", dob);
            request.setAttribute("pass", pass);
            request.setAttribute("pass2", pass2);
            request.setAttribute("province", province);
            request.setAttribute("district", district);
            request.setAttribute("mess_pass", mess_pass);
            request.setAttribute("mess_pID", mess_pID);
            request.setAttribute("mess_email", mess_email);
            request.getRequestDispatcher("view/register.jsp").forward(request, response);
        } else {
            int n = 8;
            String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    + "0123456789"
                    + "abcdefghijklmnopqrstuvxyz";

            StringBuilder sb = new StringBuilder(n);

            for (int i = 0; i < n; i++) {
                int index = (int) (AlphaNumericString.length() * Math.random());
                sb.append(AlphaNumericString.charAt(index));
            }

            String subject = "INSURANCE CARD SYSTEM";
            String message = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "    <div style=\"font-weight: bold;\">Your verify code: "
                    + "</div>\n"
                    + "    <div style=\"font-weight: bold;\">" + sb.toString()
                    + "</div>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";
            SendMail.send(email, subject, message, "insurancecard1517@gmail.com", "team1se1517");
            
            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("phone", phone);
            request.getSession().setAttribute("personalID", personalID);
            request.getSession().setAttribute("address", address);
            request.getSession().setAttribute("firstName", firstName);
            request.getSession().setAttribute("lastName", lastName);
            request.getSession().setAttribute("dob", dob);
            request.getSession().setAttribute("pass", pass);
            request.getSession().setAttribute("province", province);
            request.getSession().setAttribute("district", district);
            request.getSession().setAttribute("authCode", sb.toString());
            request.getRequestDispatcher("view/verify_email.jsp").forward(request, response);
        }

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
