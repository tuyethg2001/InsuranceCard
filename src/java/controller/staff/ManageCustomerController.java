/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import dao.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author quynm
 */
public class ManageCustomerController extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        CustomerDBContext cdb = new CustomerDBContext();

        String cusID = request.getParameter("customerID");
        if(cusID == null || cusID.trim().isEmpty()){
            cusID = "0";
        }
        String cusName = request.getParameter("customerName") == null ? "" : request.getParameter("customerName");
        String phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");
        String province = request.getParameter("province") == null ? "" : request.getParameter("province");
        String district = request.getParameter("district") == null ? "" : request.getParameter("district");

        String page = request.getParameter("page");
        if (page == null || page.isEmpty()) {
            page = "1";
        }
        int pageIndex = Integer.parseInt(page);
        int pageSize = 10;
        int totalRecords = cdb.countCustomersWithCondition(Integer.parseInt(cusID),
                cusName, phone, province, district);
        int totalPages = totalRecords % pageSize == 0 ? totalRecords / pageSize : (totalRecords / pageSize) + 1;
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPages", totalPages);

        ArrayList<Customer> customers = cdb.getCustomers(Integer.parseInt(cusID),
                cusName, phone, province, district, pageIndex, pageSize);
        request.setAttribute("customers", customers);

        request.setAttribute("cusIDSent", cusID.equals("0") ? "" : cusID);
        request.setAttribute("cusNameSent", cusName);
        request.setAttribute("phoneSent", phone);
        request.setAttribute("provinceSent", province);
        request.setAttribute("districtSent", district);

        request.getRequestDispatcher("../../view/staff/manage-customer.jsp").forward(request, response);

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
