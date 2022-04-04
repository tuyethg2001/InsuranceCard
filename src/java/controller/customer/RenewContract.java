/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.ContractDBContext;
import dao.DeliveryDBContext;
import dao.StaffDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Brand;
import model.Contract;
import model.Customer;
import model.Delivery;
import model.Product;
import model.Staff;
import model.VehicleType;

/**
 *
 * @author ASUS
 */
public class RenewContract extends HttpServlet {

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
        LocalDate d = java.time.LocalDate.now();

        int contractID = (int) request.getSession().getAttribute("contractID");
        Account acc = (Account) request.getSession().getAttribute("account");
        ContractDBContext cdb = new ContractDBContext();
        Contract contract = cdb.getContractDetailByCustomer(acc.getId(), contractID); //change to acc.id

        DeliveryDBContext ddb = new DeliveryDBContext();
        Delivery delivery = ddb.getDeliveryByContract(contractID);
        int dayy = d.getDayOfMonth();
        int monthh = d.getMonth().getValue();
        int year = d.getYear();

        String day = "";
        if (dayy < 10) {
            day = "0" + dayy;
        } else {
            day = String.valueOf(dayy);
        }
        
        String month = "";
        if (monthh < 10) {
            month = "0" + monthh;
        }

        String date = day + "-" + month + "-" + year;

        request.setAttribute("contract", contract);
        request.setAttribute("minDate", d);
        request.setAttribute("date", date);
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("../../view/customer/renew_contract.jsp").forward(request, response);
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
        LocalDateTime now = LocalDateTime.now();
        int duration = Integer.parseInt(request.getParameter("duration"));
        String startDate = request.getParameter("startDate");
        String[] d = startDate.split("-");
        LocalDateTime sDate = LocalDateTime.of(Integer.parseInt(d[0]), Integer.parseInt(d[1]), Integer.parseInt(d[2]), 0, 0, 0);

        int contractID = (int) request.getSession().getAttribute("contractID");
        Account acc = (Account) request.getSession().getAttribute("account");
        ContractDBContext cdb = new ContractDBContext();
        Contract c = cdb.getContractDetailByCustomer(acc.getId(), contractID); //change to acc.id

        Product product = new Product();
        product.setId(c.getProduct().getId());

        Customer customer = new Customer();
        customer.setAccount(acc);

        StaffDBContext sdb = new StaffDBContext();
        Account acc_staff = new Account();
        acc_staff.setId(sdb.getStartStaff(acc.getId()));

        Staff staff = new Staff();
        staff.setAccount(acc_staff);

        VehicleType vt = new VehicleType();
        vt.setId(c.getVehicleType2().getId());

        Brand brand = new Brand();
        brand.setId(c.getBrand2().getId());

        Contract contract = new Contract();
        contract.setProduct(product);
        contract.setCustomer(customer);
        contract.setStartDate(Timestamp.valueOf(sDate));
        contract.setEndDate(Timestamp.valueOf(sDate.plusYears(duration)));
        contract.setStatus(Short.parseShort("2"));
        contract.setContractFee(duration * c.getProduct().getPrice());
        contract.setVehicleType2(vt);
        contract.setEngine(c.getEngine());
        contract.setLicensePlate(c.getLicensePlate());
        contract.setColor(c.getColor());
        contract.setCertImage(c.getCertImage());
        contract.setBrand2(brand);
        contract.setOwner(c.getOwner());
        contract.setChassis(c.getChassis());
        contract.setRequestDate(Timestamp.valueOf(now));
        contract.setStartStaff(staff);

        int id = cdb.renewContractByCustomer(contract);
        contract.setId(id);
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        
        Delivery del = new Delivery();
        del.setFullName(name);
        del.setPhone(phone);
        del.setEmail(email);
        del.setAddress(address);
        del.setProvince(province);
        del.setDistrict(district);
        del.setContract(contract);
        
        DeliveryDBContext ddb = new DeliveryDBContext();
        ddb.insertDelivery(del);

        response.sendRedirect("detail?id=" + id);
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
