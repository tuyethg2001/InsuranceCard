/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.PaymentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Payment;

/**
 *
 * @author ASUS
 */
public class PaymentHistory extends HttpServlet {

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

        Account acc = (Account) request.getSession().getAttribute("account");

        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }
        int page = Integer.parseInt(raw_page);
        int pageSize = 7;

        String raw_date = request.getParameter("date");
        
        PaymentDBContext pdb = new PaymentDBContext();
        double total = pdb.getTotalPayment(acc.getId());
        int count = pdb.countPaymentRecord(acc.getId(), raw_date);
        int totalPage = (count % pageSize == 0) ? count / pageSize : (count / pageSize) + 1;

        ArrayList<Payment> payments = pdb.paymentHistory(pageSize, page, acc.getId(), raw_date);

        if (raw_date != null) {
            request.setAttribute("date_page", "date=" + raw_date + "&");
        }
        
        request.setAttribute("date", raw_date);
        request.setAttribute("payments", payments);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", page);
        request.setAttribute("total", total);
        request.getRequestDispatcher("../../view/customer/payment_history.jsp").forward(request, response);
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

        String date = request.getParameter("date");
        Account acc = (Account) request.getSession().getAttribute("account");

        PaymentDBContext pdb = new PaymentDBContext();
        int count = pdb.countPaymentRecord(acc.getId(), date);

        if (count == 0) {
            request.setAttribute("date", date);
            request.setAttribute("msg", count == 0 ? "No payment in this day!" : "");

            request.getRequestDispatcher("../../view/customer/payment_history.jsp").forward(request, response);
        } else {
            response.sendRedirect("payment?date=" + date);
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
