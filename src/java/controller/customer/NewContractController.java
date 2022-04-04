/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.BrandDBContext;
import dao.ContractDBContext;
import dao.CustomerDBContext;
import dao.DeliveryDBContext;
import dao.ProductDBContext;
import dao.StaffDBContext;
import dao.StatusCodeDBContext;
import dao.VehicleTypeDBContext;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Brand;
import model.Contract;
import model.ContractStatusCode;
import model.Customer;
import model.Delivery;
import model.Product;
import model.Staff;
import model.VehicleType;

/**
 *
 * @author quynm
 */
public class NewContractController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        response.setCharacterEncoding("UTF-8");

        String productID = request.getParameter("productID");
        int pID;
        ProductDBContext pdb = new ProductDBContext();
        try {
            pID = Integer.parseInt(productID);
            Product product = pdb.getProductByID(pID);
            if (product == null) {
                //incorrect product id => redirect to dashboard to choose product again
                response.sendRedirect("../dashboard");
            } else {
                //get current date
                LocalDate d = LocalDate.now();
                request.setAttribute("now", d);

                //get vehicle types
                VehicleTypeDBContext vtdb = new VehicleTypeDBContext();
                ArrayList<VehicleType> vehicleTypes = vtdb.getVehicleTypes();
                request.setAttribute("vehicletypes", vehicleTypes);

                //get brands
                BrandDBContext bdb = new BrandDBContext();
                ArrayList<Brand> brands = bdb.getBrands();
                request.setAttribute("brands", brands);

                //getCustomer
                Account account = (Account) request.getSession().getAttribute("account");
                CustomerDBContext cdb = new CustomerDBContext();
                if (account != null) {
                    //get customer by account if user logged in (account has been saved in session)
                    Customer customer = cdb.getCustomerByAccount(account);
                    request.setAttribute("customer", customer);
                }

                request.setAttribute("product", product);
                request.getRequestDispatcher("../../view/customer/new-contract.jsp")
                        .forward(request, response);
            }
        } catch (NumberFormatException ex) {
            //incorrect product id => redirect to dashboard to choose product again
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
        DeliveryDBContext ddb = new DeliveryDBContext();

        String ownerName = request.getParameter("ownerName");
        String vehicleTypeID = request.getParameter("vehicleTypeID");
        String brandID = request.getParameter("brandID");
        String color = request.getParameter("color");
        String licensePlate = request.getParameter("licensePlate");
        String chassis = request.getParameter("chassis");
        String engine = request.getParameter("engine");
        String imgURL = request.getParameter("photo");
        String productID = request.getParameter("productID");
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String deliveryName = request.getParameter("deliveryName");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String deliveryEmail = request.getParameter("deliveryEmail");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryProvince = request.getParameter("province");
        String deliveryDistrict = request.getParameter("district");
        String fee = request.getParameter("fee");
        //get Staff who has least contract
        Staff startStaff = sdb.getLeastContractStaff();

        //getCustomer
        Account account = (Account) request.getSession().getAttribute("account");
        Customer customer = null;
        if (account != null) {
            //get customer by account if user logged in (account has been saved in session)
            customer = cdb.getCustomerByAccount(account);
        }

        VehicleType type = vtdb.getVehicleTypeByID(Integer.parseInt(vehicleTypeID));
        Brand brand = bdb.getBrandByID(Integer.parseInt(brandID));
        Product product = pdb.getProduct(Integer.parseInt(productID));
        Timestamp startDate = Timestamp.valueOf(start + " 00:00:00");
        Timestamp endDate = Timestamp.valueOf(end + " 23:59:59");
        //set default status to pending - code:2
        ContractStatusCode status = scdb.getContractStatusCode(2);
        Timestamp requestDate = Timestamp.valueOf(LocalDateTime.now());
        Double contractFee = Double.parseDouble(fee);

        Contract contract = new Contract();
        contract.setOwner(ownerName);
        contract.setVehicleType2(type);
        contract.setBrand2(brand);
        contract.setColor(color);
        contract.setLicensePlate(licensePlate);
        contract.setChassis(chassis);
        contract.setEngine(engine);
        contract.setCertImage(imgURL);
        contract.setProduct(product);
        contract.setStartDate(startDate);
        contract.setEndDate(endDate);
        contract.setCustomer(customer);
        contract.setStatusCode(status); //pending
        contract.setRequestDate(requestDate);
        contract.setContractFee(contractFee);
        //assign random staff who have least contract
        contract.setStartStaff(startStaff);
        
        //insert to DB
        contract.setId(ctdb.insertContract(contract));
        
        //save delivery info to delivery table
        Delivery delivery = new Delivery();
        delivery.setFullName(deliveryName);
        delivery.setPhone(deliveryPhone);
        delivery.setEmail(deliveryEmail);
        delivery.setAddress(deliveryAddress);
        delivery.setProvince(deliveryProvince);
        delivery.setDistrict(deliveryDistrict);
        delivery.setContract(contract);
        //insert to DB
        ddb.insertDelivery(delivery);
        
        //redirect to checkout page
        response.sendRedirect("../checkout?contractid="+contract.getId());
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
