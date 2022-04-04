/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moderator;

import dao.ModeratorDBContext;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Moderator;

/**
 *
 * @author ASUS
 */
public class ModeratorLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie arr[] = request.getCookies();
        for (Cookie c : arr) {
            if (c.getName().equals("userC")) {
                request.setAttribute("user", c.getValue());
            }
            if (c.getName().equals("passC")) {
                request.setAttribute("pass", c.getValue());
                request.setAttribute("remember", "yes");
            }
        }

        request.getRequestDispatcher("../view/moderator/login.jsp").forward(request, response);
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
        String remember = request.getParameter("remember");
        if (remember == null) {
            remember = "no";
        }

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        ModeratorDBContext mdb = new ModeratorDBContext();
        Moderator acc = mdb.getModAccount(user, pass);

        if (acc != null) {
            request.getSession().setAttribute("mod_account", acc);
            if (remember.equals("on")) {
                Cookie u = new Cookie("userC", user);
                Cookie p = new Cookie("passC", pass);
                u.setMaxAge(43200);
                p.setMaxAge(43200);
                response.addCookie(u);
                response.addCookie(p);
            } else {
                Cookie arr[] = request.getCookies();
                for (Cookie c : arr) {
                    if (c.getName().equals("userC")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                    if (c.getName().equals("passC")) {
                        request.setAttribute("pass", c.getValue());
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            response.sendRedirect("dashboard");
        } else {
            request.getSession().setAttribute("mod_account", null);
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            request.setAttribute("msg", "Please check username or password!");
            request.getRequestDispatcher("../view/moderator/login.jsp").forward(request, response);
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
