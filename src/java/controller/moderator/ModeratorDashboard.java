/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moderator;

import dao.ContractDBContext;
import dao.CustomerDBContext;
import dao.PaymentDBContext;
import dao.ProductDBContext;
import dao.StaffDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.Staff;

/**
 *
 * @author area1
 */
public class ModeratorDashboard extends HttpServlet {

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
        PaymentDBContext paymentDBC = new PaymentDBContext();
        double totalRevenues = paymentDBC.totalRevenues();
        CustomerDBContext customerDBC = new CustomerDBContext();
        int totalCustomers = customerDBC.getTotalActiveCustomers();
        ContractDBContext contractDBC = new ContractDBContext();
        int totalContracts = contractDBC.totalAcitveContracts();
        ProductDBContext productDBC = new ProductDBContext();
        int totalActiveProducts = productDBC.getTotalActiveProducts();
        ArrayList<Product> top3Products = productDBC.getTop3ProductsRankByContract();
        HashMap<Product, Integer> top10Products = productDBC.getProductsRankByContract();
        StaffDBContext staffDBC = new StaffDBContext();
        int totalStaffs = staffDBC.getTotalActiveStaffs();
        HashMap<Staff, Integer> top10Staffs = staffDBC.getTop10RankStaffByContract();
        ArrayList<Staff> top3Staffs = staffDBC.getTop3RankStaffByContract();
        
        
        request.setAttribute("total_revenues", totalRevenues);
        request.setAttribute("total_customers", totalCustomers);
        request.setAttribute("total_contracts", totalContracts);
        request.setAttribute("products_rank_by_contract", top10Products);
        request.setAttribute("total_active_products", totalActiveProducts);
        request.setAttribute("top3_products", top3Products);
        request.setAttribute("total_active_staffs", totalStaffs);
        request.setAttribute("top10_staffs", top10Staffs);
        request.setAttribute("top3_staffs", top3Staffs);
        
        request.getRequestDispatcher("../view/moderator/moderator_dashboard.jsp").forward(request, response);
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
