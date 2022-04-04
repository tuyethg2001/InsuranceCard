/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDBContext;
import dao.CustomerDBContext;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.CustomerStaff;

/**
 *
 * @author ADMIN
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        
//    }
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
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("userCookie")) {
                    request.setAttribute("userC", cooky.getValue());
                }
                if (cooky.getName().equals("passCookie")) {
                    request.setAttribute("passC", cooky.getValue());
                }
            }
        }
        Account acc = (Account) request.getSession().getAttribute("account");
        if (acc == null) {
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        } else if (!acc.isRole()) {
            request.getRequestDispatcher("/customer/dashboard").forward(request, response);
        } else {
            request.getRequestDispatcher("/staff/dashboard").forward(request, response);
        }
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remember = request.getParameter("remember");

        request.setAttribute("user", username);

        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccount(username, password);

        if (account != null) {
            request.getSession().setAttribute("account", account);
            Cookie cookieU = new Cookie("userCookie", username);
            Cookie cookieP = new Cookie("passCookie", password);
            cookieU.setMaxAge(3600);
            if (remember != null) {
                cookieP.setMaxAge(3600);
                request.getSession().setAttribute("remember", remember);
            } else {
                cookieP.setMaxAge(0);
            }

            response.addCookie(cookieU);
            response.addCookie(cookieP);

            switch (account.getStatusCode().getStatusCode()) {
                case 1:
                    if (!account.isRole()) {
                        response.sendRedirect("customer/dashboard");
                    } else {
                        response.sendRedirect("staff/dashboard");
                    }
                    break;
                case 2:
                    response.sendRedirect("verify_email");
                    break;
                default:
                    request.getSession().setAttribute("account", null);
                    request.setAttribute("alert", "Your account is inactivated!");
                    request.getRequestDispatcher("view/login.jsp").forward(request, response);
                    break;
            }
        } else {
            request.getSession().setAttribute("account", null);
            request.setAttribute("alert", "Your email or password is wrong. Try again!");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
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
