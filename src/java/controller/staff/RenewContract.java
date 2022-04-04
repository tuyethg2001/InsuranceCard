/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import dao.ContractDBContext;
import dao.DeliveryDBContext;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Contract;
import model.Delivery;
import model.Staff;

/**
 *
 * @author DELL
 */
public class RenewContract extends HttpServlet {

    private Timestamp datetimeLocalToTimestamp(String datetimeLocal) {
        return Timestamp.valueOf(datetimeLocal.replace("T", " ") + ":00");
    }

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
        int id = Integer.parseInt(request.getParameter("id"));
        ContractDBContext conDB = new ContractDBContext();
        Contract contract = conDB.staffGetContractDetail(id);

        DeliveryDBContext delDB = new DeliveryDBContext();
        Delivery delivery = delDB.getDeliveryByContract(id);

        request.setAttribute("contract", contract);
        request.setAttribute("check", conDB.staffRenewCheck(contract));
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("../../view/staff/renew_contract.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        ContractDBContext conDB = new ContractDBContext();
        Contract contract = conDB.staffGetContractDetail(id);

        Timestamp newStartDate = datetimeLocalToTimestamp(request.getParameter("newStartDate"));
        Timestamp newEndDate = datetimeLocalToTimestamp(request.getParameter("newEndDate"));
        double newFee = Double.parseDouble(request.getParameter("newFee"));
        int payMethodID = Integer.parseInt(request.getParameter("payMethodID"));
        String fullName = request.getParameter("fullName");
        String province = request.getParameter("province");
        String phone = request.getParameter("phone");
        String district = request.getParameter("district");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Account staffAcc = (Account) request.getSession().getAttribute("account");

        Staff staff = new Staff();
        staff.setAccount(staffAcc);

        contract.setStartDate(newStartDate);
        contract.setEndDate(newEndDate);
        contract.setContractFee(newFee);
        contract.setStartStaff(staff);

        int renewContractID = conDB.staffRenewContract(contract, payMethodID);
        contract.setId(renewContractID);
        
        Delivery delivery = new Delivery();
        delivery.setFullName(fullName);
        delivery.setProvince(province);
        delivery.setPhone(phone);
        delivery.setDistrict(district);
        delivery.setEmail(email);
        delivery.setAddress(address);
        delivery.setContract(contract);
        
        DeliveryDBContext delDB = new DeliveryDBContext();
        delDB.insertDelivery(delivery);

        request.setAttribute("contract", contract);
        request.setAttribute("isSuccess", true);
        request.setAttribute("renewContractID", renewContractID);
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("../../view/staff/renew_contract.jsp").forward(request, response);
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
