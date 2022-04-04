/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.externalmodule.PaginationModule;
import dao.ContractDBContext;
import dao.StatusCodeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Contract;
import model.ContractStatusCode;

/**
 *
 * @author quynm
 */
public class ManageContractController extends HttpServlet {

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

        HttpSession session = request.getSession();
        Account currentCustomerAccount = (Account) session.getAttribute("account");
        if (currentCustomerAccount == null) {
            response.sendRedirect("../../login");
        } else {
            int customerID = currentCustomerAccount.getId();
            String query = request.getParameter("query");
            String orderBy = request.getParameter("orderby");
            String orderType = request.getParameter("ordertype");
            String contractStatusCode = request.getParameter("status");
            String rawpageIndex = request.getParameter("page");
            String queryOption = request.getParameter("queryoption");

            rawpageIndex = (rawpageIndex == null || rawpageIndex.isEmpty()) ? "1" : rawpageIndex;
            int pageIndex = Integer.parseInt(rawpageIndex);

            queryOption = (queryOption == null) ? "" : queryOption;
            StatusCodeDBContext statusDBC = new StatusCodeDBContext();
            ArrayList<ContractStatusCode> statusCodes = statusDBC.getContractStatusCodes();
            String stringAllStatus = "0";
            for (ContractStatusCode statusCode : statusCodes) {
                stringAllStatus += "," + statusCode.getStatusCode();
            }

            contractStatusCode = (contractStatusCode == null || contractStatusCode.isEmpty()) ? stringAllStatus : contractStatusCode;
            ContractDBContext contractDBC = new ContractDBContext();
            HashMap<Integer, Contract> contractList = null;
            int totalRecord = 0;
            contractList = contractDBC.getContractsByCustomer(customerID, query, queryOption, pageIndex,
                    contractStatusCode, orderBy, orderType);
            totalRecord = contractDBC.totalContractsByCustomer(customerID, query, queryOption, contractStatusCode);

            int totalPage = PaginationModule.calcTotalPage(totalRecord, 10);
            request.setAttribute("query_option", queryOption);
            request.setAttribute("contract_list", contractList);
            request.setAttribute("status_codes", statusCodes);
            request.setAttribute("query", query);
            request.setAttribute("status", contractStatusCode);
            request.setAttribute("ordertype", orderType);
            request.setAttribute("orderby", orderBy);
            request.setAttribute("totalpage", totalPage);
            request.setAttribute("page", pageIndex);
            request.getRequestDispatcher("../../view/customer/manage-contract.jsp").forward(request, response);
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
