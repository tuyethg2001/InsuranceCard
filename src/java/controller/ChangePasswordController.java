/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDBContext;
import dao.ModeratorDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Moderator;

/**
 *
 * @author quynm
 */
public class ChangePasswordController extends HttpServlet {

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
        Account account = (Account) request.getSession().getAttribute("account");
        Moderator moderator = (Moderator) request.getSession().getAttribute("mod_account");
        if (account != null || moderator != null) {
            request.getRequestDispatcher("view/change-password.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Account account = (Account) request.getSession().getAttribute("account");
        Moderator moderator = (Moderator) request.getSession().getAttribute("mod_account");
        if (account != null) {
            String email = account.getEmail();
            String oldPassword = request.getParameter("oldPass");
            if (!oldPassword.equals(account.getPassword())) {
                request.setAttribute("errorMsg", "Wrong password!");
                request.getRequestDispatcher("view/change-password.jsp").forward(request, response);
            } else {
                String newPassword = request.getParameter("newPass");
                AccountDBContext adb = new AccountDBContext();
                adb.resetPass(newPassword, email);
                //update to session
                account.setPassword(newPassword);
                request.getSession().setAttribute("account", account);

                request.setAttribute("errorMsg", "Password changed!");
                request.getRequestDispatcher("view/change-password.jsp").forward(request, response);
            }
        } else if (moderator != null) {
            String username = moderator.getUserName();
            String oldPassword = request.getParameter("oldPass");
            if (!oldPassword.equals(moderator.getPassword())) {
                request.setAttribute("errorMsg", "Wrong password!");
                request.getRequestDispatcher("view/change-password.jsp").forward(request, response);
            } else {
                String newPassword = request.getParameter("newPass");
                ModeratorDBContext mdb = new ModeratorDBContext();
                mdb.changePass(newPassword, username);
                //update to session
                moderator.setPassword(newPassword);
                request.getSession().setAttribute("mod_account", moderator);

                request.setAttribute("errorMsg", "Password changed!");
                request.getRequestDispatcher("view/change-password.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login");
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
