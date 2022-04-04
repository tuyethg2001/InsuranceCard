/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import dao.AccountDBContext;
import dao.CustomerDBContext;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountStatusCode;
import model.Customer;
import model.CustomerStaff;

/**
 *
 * @author DELL
 */
public class EditCustomer extends HttpServlet {

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

        CustomerDBContext cusDb = new CustomerDBContext();
        CustomerStaff cusStaff = cusDb.viewCustomer(id);
        Customer cus = cusStaff.getCustomer();

        // set attribute
        request.setAttribute("cus", cus);
        request.getRequestDispatcher("../../view/staff/customer_edit.jsp").forward(request, response);
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
        Customer cus = new Customer();
        
        int cusId = Integer.parseInt(request.getParameter("aid"));
        String email = request.getParameter("email");
        short status = Short.parseShort(request.getParameter("status"));
        String fname = request.getParameter("fname");
        String pid = request.getParameter("pid");
        String lname = request.getParameter("lname");
        String province = request.getParameter("province");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String district = request.getParameter("district");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean isExistEmail = false;
        Boolean isSuccess = false;
        
        AccountStatusCode accStatus = new AccountStatusCode();
        accStatus.setStatusCode(status);

        Account acc = new Account();
        acc.setId(cusId);
        acc.setEmail(email);
        acc.setStatusCode(accStatus);

        // cus
        cus.setAccount(acc);
        cus.setFirstName(fname);
        cus.setLastName(lname);
        cus.setAddress(address);
        cus.setDob(dob);
        cus.setPhone(phone);
        cus.setPersonalID(pid);
        cus.setProvince(province);
        cus.setDistrict(district);


        CustomerStaff cs = new CustomerStaff();
        cs.setCustomer(cus);

        AccountDBContext accDB = new AccountDBContext();
        // check if exist account is active with same email
        // true => notify user and re-input
        if (accDB.checkExistCusAccEmail(acc)) {
            isExistEmail = true;
        } else {
            CustomerDBContext cusDB = new CustomerDBContext();
            cusDB.staffEditCustomer(cus);
            isSuccess = true;
        }
        
        request.setAttribute("cus", cus);
        request.setAttribute("isExistEmail", isExistEmail);
        request.setAttribute("isSuccess", isSuccess);
        request.getRequestDispatcher("../../view/staff/customer_edit.jsp").forward(request, response);
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
