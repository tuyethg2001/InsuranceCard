/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import dao.CompensationDBContext;
import dao.ContractDBContext;
import dao.DeliveryDBContext;
import dao.PaymentDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Compensation;
import model.Contract;
import model.Delivery;
import model.Payment;

/**
 *
 * @author DELL
 */
public class ViewContract extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        ContractDBContext contractDB = new ContractDBContext();
        Contract contract = contractDB.staffGetContractDetail(id);

        PaymentDBContext payDB = new PaymentDBContext();
        ArrayList<Payment> payments = payDB.getContractPayments(id);

        CompensationDBContext comDB = new CompensationDBContext();
        ArrayList<Compensation> compensations = comDB.getContractCompensations(id);
        
        DeliveryDBContext delDB = new DeliveryDBContext();
        Delivery delivery = delDB.getDeliveryByContract(id);

        request.setAttribute("contract", contract);
        request.setAttribute("payments", payments);
        request.setAttribute("compensations", compensations);
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("../../view/staff/view_contract.jsp").forward(request, response);
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
