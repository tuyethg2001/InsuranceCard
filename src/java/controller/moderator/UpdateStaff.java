/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moderator;

import dao.AccountDBContext;
import dao.StaffDBContext;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountStatusCode;
import model.Staff;

/**
 *
 * @author DELL
 */
public class UpdateStaff extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));

        StaffDBContext db = new StaffDBContext();
        Staff staff = db.getStaff(id);

        request.setAttribute("staff", staff);
        request.getRequestDispatcher("../../view/moderator/staff_update.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        short statusID = Short.parseShort(request.getParameter("status"));
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phone = request.getParameter("phone");
        boolean isSuccess = false;
        boolean isExistEmail = false;

        AccountStatusCode status = new AccountStatusCode();
        status.setStatusCode(statusID);

        Account account = new Account();
        account.setId(id);
        account.setEmail(email);
        account.setStatusCode(status);

        Staff staff = new Staff();
        staff.setAccount(account);
        staff.setFirstName(fname);
        staff.setLastName(lname);
        staff.setPhone(phone);

        AccountDBContext accDB = new AccountDBContext();
        if (accDB.checkExistCusAccEmail(account)) {
            isExistEmail = true;
        } else {
            StaffDBContext staffDB = new StaffDBContext();
            staffDB.modUpdateStaff(staff);
            isSuccess = true;
        }

        request.setAttribute("staff", staff);
        request.setAttribute("isExistEmail", isExistEmail);
        request.setAttribute("isSuccess", isSuccess);
        request.getRequestDispatcher("../../view/moderator/staff_update.jsp").forward(request, response);
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
