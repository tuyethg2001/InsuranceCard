/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CompensationDBContext;
import dao.ContractDBContext;
import dao.CustomerDBContext;
import dao.PaymentDBContext;
import dao.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Customer;
import model.CustomerStaff;
import model.Product;

/**
 *
 * @author area1
 */
public class CustomerDashboard extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //        processRequest(request, response);
        HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            int customerID = account.getId();
            ProductDBContext productDBC = new ProductDBContext();
            ArrayList<Product> buyableProducts = productDBC.getProducts();
            CustomerDBContext customerDBC = new CustomerDBContext();
            CustomerStaff customerStaff = customerDBC.getCustomerDashboard(customerID);
            ArrayList<Product> currentProducts = productDBC.getProductsByCustomer(customerID);
            PaymentDBContext paymentDBC = new PaymentDBContext();
            double totalAmount = paymentDBC.totalAmountSpent(customerID);
            ContractDBContext contractDBC = new ContractDBContext();
            int totalContracts = contractDBC.totalContractsByCustomer(customerID);
            CompensationDBContext compensationDBC = new CompensationDBContext();
            int compensationQuantity = compensationDBC.getCompensationQuantity(customerID);

            request.setAttribute("compensation_quantity", compensationQuantity);
            request.setAttribute("total_contracts", totalContracts);
            request.setAttribute("total_amount", totalAmount);
            request.setAttribute("current_products", currentProducts);
            request.setAttribute("customer_staff", customerStaff);
            request.setAttribute("buyable_products", buyableProducts);
            request.getRequestDispatcher("../view/customer/customer_dashboard.jsp").forward(request, response);
        
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
