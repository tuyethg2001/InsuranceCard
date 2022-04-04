/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CompensationDBContext;
import dao.ContractDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Accident;
import model.Account;
import model.Compensation;
import model.Contract;

/**
 *
 * @author area1
 */
public class RequestCompensation extends HttpServlet {

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
            out.println("<title>Servlet RequestCompensation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestCompensation at " + request.getContextPath() + "</h1>");
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
        Account account = (Account) request.getSession().getAttribute("account");
        String raw_contractId = request.getParameter("contractid");
        if (raw_contractId == null || raw_contractId.isEmpty()) {
            response.getWriter().print("<h1>Please Select an active contract to make compensation base on</h1>");
        }
        int contractID = Integer.parseInt(raw_contractId);
        ContractDBContext contractDBC = new ContractDBContext();
        Contract contract = contractDBC.getContractDetailByCustomer(account.getId(), contractID);
        if (contract == null) {
            response.getWriter().print("<h1>Please Select an active contract to make compensation base on</h1>");
        }

        request.setAttribute("contract", contract);
        request.getRequestDispatcher("../../../view/customer/request_compensation.jsp").forward(request, response);
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
//        processRequest(request, response);
        String raw_contractID = request.getParameter("contractid");
        String accidentTitle = request.getParameter("accident-title");
        String raw_accidentDate = request.getParameter("accident-date");
        String accidentAttachment = request.getParameter("accident-attachment");
        String accidentHumanDamage = request.getParameter("accident-human-damage");
        String accidentVehicleDamage = request.getParameter("accident-vehicle-damage");
        String compensationDriverName = request.getParameter("compensation-driver-name");
        String compensationAttachment = request.getParameter("compensation-attachment");
        String compensationDescription = request.getParameter("compensation-description");

        int contractID = Integer.parseInt(raw_contractID);
        Accident accident = new Accident();
        Contract contract = new Contract();
        contract.setId(contractID);
        accident.setContract(contract);
        accident.setTitle(accidentTitle);

        String[] date = raw_accidentDate.split("-");
        LocalDateTime accidentDate = LocalDateTime.of(
                Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]), 0, 0
        );

        accident.setAccidentDate(Timestamp.valueOf(accidentDate));

        accident.setAttachment(accidentAttachment);
        accident.setHumanDamage(accidentHumanDamage);
        accident.setVehicleDamage(accidentVehicleDamage);
        accident.setCreatedDate(Timestamp.valueOf(LocalDateTime.now()));

        Compensation compensation = new Compensation();
        compensation.setDriverName(compensationDriverName);
        compensation.setAttachment(compensationAttachment);
        compensation.setDescription(compensationDescription);
        compensation.setAccident(accident);
        compensation.setCreateDate(Timestamp.valueOf(LocalDateTime.now()));
        CompensationDBContext compensationDBC = new CompensationDBContext();
        compensationDBC.setCompensation(compensation);

        response.sendRedirect("../compensation");
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
