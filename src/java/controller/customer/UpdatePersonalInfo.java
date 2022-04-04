/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;
import model.CustomerStaff;
import model.Staff;

/**
 *
 * @author ADMIN
 */
public class UpdatePersonalInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String transStatus(short status) {
        String name = null;
        switch (status) {
            case 0: {
                name = "Inactive";
                break;
            }
            case 1: {
                name = "Active";
                break;
            }
            case 2: {
                name = "Pending";
                break;
            }
        }
        return name;
    }
    
    private String timestampToDatetimeLocal(Timestamp t) {
        String[] ts = t.toString().split(" ");
        String dateTimeLocal = ts[0] + " T " + ts[1].substring(0, 5);
        return dateTimeLocal;
    }
    
    private String staffName(Staff s) {
        String fullName = s.getFirstName() + " " + s.getLastName();
        return fullName;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        int accountId = account.getId();
//        int accountId = Integer.parseInt(request.getParameter("id"));
        CustomerDBContext dbC = new CustomerDBContext();
        CustomerStaff cusStaff = dbC.viewCustomer(accountId);
        Customer cus = cusStaff.getCustomer();

        short raw_status = cus.getAccount().getStatusCode().getStatusCode();
        request.setAttribute("raw", raw_status);
        String status = transStatus(raw_status);
        String staff = staffName(cusStaff.getStaff());

        request.setAttribute("aid", accountId);
        request.setAttribute("email", cus.getAccount().getEmail());
        request.setAttribute("status", status);
        request.setAttribute("fname", cus.getFirstName());
        request.setAttribute("pid", cus.getPersonalID());
        request.setAttribute("lname", cus.getLastName());
        request.setAttribute("province", cus.getProvince());
        request.setAttribute("dob", cus.getDob());
        request.setAttribute("district", cus.getDistrict());
        request.setAttribute("phone", cus.getPhone());
        request.setAttribute("address", cus.getAddress());
        request.setAttribute("staff", staff);
        request.setAttribute("joinDate", timestampToDatetimeLocal(cus.getJoinDate()));
        request.getRequestDispatcher("../../view/customer/customer_info_update.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id"));
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String pid = request.getParameter("pid");
        String province = request.getParameter("province");
        String phone = request.getParameter("phone");
        String district = request.getParameter("district");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String address = request.getParameter("address");
        Boolean isSuccess = false;
        
        CustomerDBContext dbC = new CustomerDBContext();
        CustomerStaff cusStaff = dbC.viewCustomer(id);
        
        Customer cus = cusStaff.getCustomer();
        cus.setFirstName(fname);
        cus.setLastName(lname);
        cus.setPersonalID(pid);
        cus.setProvince(province);
        cus.setPhone(phone);
        cus.setDistrict(district);
        cus.setDob(dob);
        cus.setAddress(address);
        
        short raw_status = cus.getAccount().getStatus();
        request.setAttribute("raw", raw_status);
        String status = transStatus(raw_status);
        String staff = staffName(cusStaff.getStaff());
        
        dbC.updateInfo(cus);
        isSuccess = true;
        
        request.setAttribute("aid", id);
        request.setAttribute("email", cus.getAccount().getEmail());
        request.setAttribute("status", status);
        request.setAttribute("fname", cus.getFirstName());
        request.setAttribute("pid", cus.getPersonalID());
        request.setAttribute("lname", cus.getLastName());
        request.setAttribute("province", cus.getProvince());
        request.setAttribute("dob", cus.getDob());
        request.setAttribute("district", cus.getDistrict());
        request.setAttribute("phone", cus.getPhone());
        request.setAttribute("address", cus.getAddress());
        request.setAttribute("staff", staff);
        request.setAttribute("joinDate", timestampToDatetimeLocal(cus.getJoinDate()));
        request.setAttribute("isSuccess", isSuccess);
        request.getRequestDispatcher("../../view/customer/customer_info_update.jsp").forward(request, response);
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
