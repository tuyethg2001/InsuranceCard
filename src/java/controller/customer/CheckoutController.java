/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.ContractDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Contract;

/**
 *
 * @author quynm
 */
public class CheckoutController extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String contractID = request.getParameter("contractid").trim();
        if (contractID == null || contractID.isEmpty()) {
            contractID = "0";
        }
        Account account = (Account) request.getSession().getAttribute("account");

//        if (true) {
        if (account != null) {
            ContractDBContext cdb = new ContractDBContext();
            Contract contract = cdb.getContractDetailByCustomer(account.getId(), Integer.parseInt(contractID));
//            Contract contract = cdb.getContractDetailByCustomer(4, Integer.parseInt(contractID));

            if (contract != null) {
                contract.getCustomer().setAccount(account);
                request.setAttribute("contract", contract);
                request.getRequestDispatcher("../view/customer/checkout.jsp").forward(request, response);
            } else{
                response.sendRedirect("../customer/contract/view");
            }
        } else {
            response.sendRedirect("../login");
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
