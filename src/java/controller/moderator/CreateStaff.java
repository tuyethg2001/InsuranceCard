/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moderator;

import controller.SendMail;
import dao.AccountDBContext;
import dao.StaffDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Staff;

/**
 *
 * @author ASUS
 */
public class CreateStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        request.getRequestDispatcher("../../view/moderator/staff_create.jsp").forward(request, response);

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
        request.setCharacterEncoding("UTF-8");
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        AccountDBContext adb = new AccountDBContext();
        boolean check = adb.checkExistEmailOfStaff(email);

        if (!check) {

            Account account = new Account();
            account.setEmail(email);

            Staff staff = new Staff();
            staff.setFirstName(fname);
            staff.setLastName(lname);
            staff.setPhone(phone);

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
                + "    <div style=\"font-weight: bold;\">Wellcome to be a new staff!"
                + "</div>\n"
                + "    <div style=\"font-weight: bold;\">Your password: "
                + "</div>\n"
                + "    <div style=\"font-weight: bold;\">" + sb.toString()
                + "</div>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        SendMail.send(email, subject, message, "insurancecard1517@gmail.com", "team1se1517");
            account.setPassword(sb.toString());
            staff.setAccount(account);

            StaffDBContext sdb = new StaffDBContext();
            sdb.createStaff(account, staff);
            request.setAttribute("success", "success");
        } else {
            request.setAttribute("msg", "Email does exist!");
            request.setAttribute("fname", fname);
            request.setAttribute("lname", lname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
        }

        request.getRequestDispatcher("../../view/moderator/staff_create.jsp").forward(request, response);
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
