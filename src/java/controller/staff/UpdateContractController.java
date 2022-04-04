/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staff;

import dao.AccountDBContext;
import dao.BrandDBContext;
import dao.CompensationDBContext;
import dao.ContractDBContext;
import dao.CustomerDBContext;
import dao.DeliveryDBContext;
import dao.PaymentDBContext;
import dao.ProductDBContext;
import dao.StaffDBContext;
import dao.StatusCodeDBContext;
import dao.VehicleTypeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Brand;
import model.Compensation;
import model.Contract;
import model.ContractStatusCode;
import model.Customer;
import model.Delivery;
import model.Payment;
import model.Product;
import model.Staff;
import model.VehicleType;

/**
 *
 * @author quynm
 */
public class UpdateContractController extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id") != null
                ? request.getParameter("id") : "0");
        ContractDBContext contractDB = new ContractDBContext();
        Contract contract = contractDB.staffGetContractDetail(id);

        if (contract != null) {
            PaymentDBContext payDB = new PaymentDBContext();
            ArrayList<Payment> payments = payDB.getContractPayments(id);

            CompensationDBContext comDB = new CompensationDBContext();
            ArrayList<Compensation> compensations = comDB.getContractCompensations(id);

            StaffDBContext sdb = new StaffDBContext();
            ArrayList<Staff> staffs = sdb.getStaffs();

            DeliveryDBContext delDB = new DeliveryDBContext();
            Delivery delivery = delDB.getDeliveryByContract(id);

            int type = contract.getEndDate().getYear() - contract.getStartDate().getYear();

            VehicleTypeDBContext vtdb = new VehicleTypeDBContext();
            ArrayList<VehicleType> vehicleTypes = vtdb.getVehicleTypes();

            BrandDBContext bdb = new BrandDBContext();
            ArrayList<Brand> brands = bdb.getBrands();

            request.setAttribute("contract", contract);
            request.setAttribute("payments", payments);
            request.setAttribute("compensations", compensations);
            request.setAttribute("staffs", staffs);
            request.setAttribute("contractType", type);
            request.setAttribute("vehicleTypes", vehicleTypes);
            request.setAttribute("brands", brands);
            request.setAttribute("delivery", delivery);
            request.getRequestDispatcher("../../view/staff/update-contract.jsp").forward(request, response);
        } else {
            response.sendRedirect("../dashboard");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        VehicleTypeDBContext vtdb = new VehicleTypeDBContext();
        BrandDBContext bdb = new BrandDBContext();
        ProductDBContext pdb = new ProductDBContext();
        CustomerDBContext cdb = new CustomerDBContext();
        StatusCodeDBContext scdb = new StatusCodeDBContext();
        StaffDBContext sdb = new StaffDBContext();
        ContractDBContext ctdb = new ContractDBContext();
        AccountDBContext adb = new AccountDBContext();
        DeliveryDBContext ddb = new DeliveryDBContext();

        String contractID = request.getParameter("contractID");
        String ownerName = request.getParameter("owner");
        String cusID = request.getParameter("customerID");
        String vehicleTypeID = request.getParameter("vehicleTypeID");
        String brandID = request.getParameter("brandID");
        String color = request.getParameter("color");
        String licensePlate = request.getParameter("licensePlate");
        String chassis = request.getParameter("chassis");
        String engine = request.getParameter("engine");
        String productID = request.getParameter("productID");
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String fee = request.getParameter("contractFee");
        String cancelReason = request.getParameter("cancelReason");
        String cancelComment = request.getParameter("cancelComment");
        String staff = request.getParameter("startStaffID");
        
        String deliveryName = request.getParameter("deliveryName");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String deliveryEmail = request.getParameter("deliveryEmail");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryProvince = request.getParameter("deliveryProvince");
        String deliveryDistrict = request.getParameter("deliveryDistrict");

        VehicleType type = vtdb.getVehicleTypeByID(Integer.parseInt(vehicleTypeID));
        Brand brand = bdb.getBrandByID(Integer.parseInt(brandID));
        Timestamp startDate = Timestamp.valueOf(start);
        Timestamp endDate = Timestamp.valueOf(end);
        Double contractFee = Double.parseDouble(fee);

        //get current contract
        Contract contract = ctdb.staffGetContractDetail(Integer.parseInt(contractID));

        //set new value
        contract.setOwner(ownerName);
        contract.setVehicleType2(type);
        contract.setBrand2(brand);
        contract.setColor(color);
        contract.setLicensePlate(licensePlate);
        contract.setChassis(chassis);
        contract.setEngine(engine);
        if (productID != null) {
            Product product = pdb.getProduct(Integer.parseInt(productID));
            contract.setProduct(product);
        }
        contract.setStartDate(startDate);
        contract.setEndDate(endDate);
        if (cusID != null) {
            //getCustomer
            Customer customer = null;
            Account cusAccount = adb.getAccount(Integer.parseInt(cusID));
            if (cusAccount != null) {
                customer = cdb.getCustomerByAccount(cusAccount);
            }
            contract.setCustomer(customer);
        }
        contract.setContractFee(contractFee);
        if (staff != null) {
            Staff startStaff = sdb.getStaff(Integer.parseInt(staff));
            contract.setStartStaff(startStaff);
        }
        if (cancelReason != null) {
            contract.setCancelReason(cancelReason);
        }
        if (cancelComment != null) {
            contract.setCancelComment(cancelComment);
        }
        
        //get current Delivery
        Delivery delivery = ddb.getDeliveryByContract(contract.getId());
        //set new value
        delivery.setFullName(deliveryName);
        delivery.setPhone(deliveryPhone);
        delivery.setEmail(deliveryEmail);
        delivery.setAddress(deliveryAddress);
        delivery.setProvince(deliveryProvince);
        delivery.setDistrict(deliveryDistrict);
        delivery.setContract(contract);

        //update to DB
        ctdb.updateContract(contract);
        ddb.updateDelivery(delivery);

        //redirect to view contract detail page
        response.sendRedirect("../../staff/contract/detail?id=" + contract.getId());
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
