/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import controller.externalmodule.PaginationModule;
import dao.CompensationDBContext;
import dao.StatusCodeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Compensation;
import model.CompensationStatusCode;

/**
 *
 * @author area1
 */
public class ManageCompensation extends HttpServlet {

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
        Account account = (Account) request.getSession().getAttribute("account");
        CompensationDBContext compensationDBC = new CompensationDBContext();
        StatusCodeDBContext statusCodeDBC = new StatusCodeDBContext();

        String query = request.getParameter("query");
        String queryChoose = request.getParameter("queryoption");
        String compensationStatus = request.getParameter("status");
        String orderby = request.getParameter("orderby");
        String ordertype = request.getParameter("ordertype");
        String raw_pageIndex = request.getParameter("page");
        if (raw_pageIndex == null || raw_pageIndex.isEmpty()) {
            raw_pageIndex = "1";
        }
        int pageIndex = Integer.parseInt(raw_pageIndex);
        HashMap<Integer, Compensation> compensations = compensationDBC
                .getCompensationsByStaff(account.getId(), query, queryChoose, pageIndex, compensationStatus, orderby, ordertype);
        int totalRecord = compensationDBC.totalCompensationsByStaff(account.getId()
                , query, queryChoose, compensationStatus);
        
        int totalPage = PaginationModule.calcTotalPage(totalRecord, 20);
        ArrayList<CompensationStatusCode> statusCode = statusCodeDBC.getCompensationStatusCodes();
        
        request.setAttribute("status", compensationStatus);
        request.setAttribute("page", pageIndex);
        request.setAttribute("total_page", totalPage);
        request.setAttribute("status_code", statusCode);
        request.setAttribute("compensations", compensations);
        request.getRequestDispatcher("../view/staff/manage_compensation.jsp").forward(request, response);
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
