/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDBContext;
import dao.CompensationDBContext;
import dao.ContractDBContext;
import dao.DeliveryDBContext;
import dao.PaymentDBContext;
import dao.StaffDBContext;
import dao.VehicleTypeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Brand;
import model.Compensation;
import model.Contract;
import model.Delivery;
import model.Payment;
import model.Staff;
import model.VehicleType;

/**
 *
 * @author quynm
 */
public class CancelContractController extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");

        Account account = (Account) request.getSession().getAttribute("account");
        if(account == null){
            response.sendRedirect("login");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id") != null
                ? request.getParameter("id") : "0");
        ContractDBContext contractDB = new ContractDBContext();
        Contract contract=null;
        //get contract by role (true = staff, false = customer)
        if (account.isRole()) {
            contract = contractDB.staffGetContractDetail(id);
        } else{
            contract = contractDB.getContractDetailByCustomer(account.getId(), id);
        }
        if (contract != null) {
            request.setAttribute("contract", contract);
            request.getRequestDispatcher("view/cancel-contract.jsp").forward(request, response);
        } else {
            //redirect to the appropriate dashboard base on role
            if (account.isRole()) {
                response.sendRedirect("staff/dashboard");
            } else {
                response.sendRedirect("customer/dashboard");
            }
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Account account = (Account) request.getSession().getAttribute("account");
        if(account == null){
            response.sendRedirect("login");
            return;
        }
        
        String reason = request.getParameter("reason");
        String comment = request.getParameter("comment").isEmpty() ? null : request.getParameter("comment");

        int id = Integer.parseInt(request.getParameter("contractID") != null
                ? request.getParameter("contractID") : "0");
        ContractDBContext contractDB = new ContractDBContext();
        Contract contract=null;
        //get contract by role (true = staff, false = customer)
        if (account.isRole()) {
            contract = contractDB.staffGetContractDetail(id);
        } else{
            contract = contractDB.getContractDetailByCustomer(account.getId(), id);
        }
        contract.setCancelReason(reason);
        contract.setCancelComment(comment);
        //only contract with status is processing can be canceled
        if (contract.getStatus() != 2){
            request.setAttribute("errorMsg", "Cannot cancel this contract. Current status is: "
                    +contract.getStatusCode().getStatusName());
            request.setAttribute("contract", contract);
            request.getRequestDispatcher("view/cancel-contract.jsp").forward(request, response);
        } else{
            contractDB.cancelContract(contract);
            //redirect to the appropriate contract list base on role
            if (account.isRole()) {
                response.sendRedirect("staff/contract/view");
            } else {
                response.sendRedirect("customer/contract/view");
            }
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
