/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.GoogleAuthen;

import controller.SendMail;
import dao.AccountDBContext;
import dao.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author area1
 */
public class LoginByGoogle extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginByGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginByGoogle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);

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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String family_name = request.getParameter("family_name");
        String given_name = request.getParameter("given_name");
        String googleID = request.getParameter("id");

        AccountDBContext accountDBC = new AccountDBContext();
        Account account = accountDBC.getAccountByEmailNGoogleID(email, googleID);
        if (account != null) {
            request.getSession().setAttribute("account", account);
            if (!account.isRole()) {
                response.sendRedirect("../customer/dashboard");
            } else {
                response.sendRedirect("../staff/dashboard");
            }
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
            request.getSession().setAttribute("firstName", family_name);
            request.getSession().setAttribute("lastName", given_name);
            request.getSession().setAttribute("google_id", googleID);
            request.getSession().setAttribute("authCode", sb.toString());
            request.getRequestDispatcher("../view/verify_email.jsp").forward(request, response);
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
