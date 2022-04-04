/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CompensationDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Compensation;

/**
 *
 * @author DELL
 */
public class CompensationHis extends HttpServlet {

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
        String search = request.getParameter("search");
        if (search == null || search.length() == 0) {
            search = "";
        }

        String raw_from = request.getParameter("from");
        String from = null;
        if (raw_from != null && raw_from.length() != 0) {
            from = raw_from;
        }

        String raw_to = request.getParameter("to");
        String to = null;
        if (raw_to != null && raw_to.length() != 0) {
            to = raw_to;
        }
        
        String raw_status = request.getParameter("status");
        int status = -1;
        if (raw_status != null && raw_status.length() != 0) {
            status = Integer.parseInt(raw_status);
        }

        Account acc = (Account) request.getSession().getAttribute("account");

        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }

        int page = Integer.parseInt(raw_page);
        int pageSize = 9;

        CompensationDBContext db = new CompensationDBContext();
        ArrayList<Compensation> compensations = db.searchCompensationHis(acc.getId(), pageSize, page, search, from, to, status);

        int count = db.getTotalCustomerCompensation(acc.getId(), search, from, to, status);
        int totalPage = (count % pageSize == 0) ? count / pageSize : (count / pageSize) + 1;

        request.setAttribute("compensations", compensations);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", page);
        request.setAttribute("search", search);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../../view/customer/compensation_his.jsp").forward(request, response);
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
