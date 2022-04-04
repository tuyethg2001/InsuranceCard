/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moderator;

import dao.StaffDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Moderator;
import model.Staff;

/**
 *
 * @author ASUS
 */
public class ManageStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("staffID");
        if (id == null || id.length() == 0) {
            id = "0";
        }
        String name = request.getParameter("name");
        if (name == null || name.length() == 0) {
            name = "";
        }
        String phone = request.getParameter("phone");
        if (phone == null || phone.length() == 0) {
            phone = "";
        }
        String status = request.getParameter("status");
        if (status == null || status.length() == 0) {
            status = "";
        }
        String email = request.getParameter("email");
        if (email == null || email.length() == 0) {
            email = "";
        }

        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }
        int page = Integer.parseInt(raw_page);
        int pageSize = 7;

        StaffDBContext sdb = new StaffDBContext();
        int count = sdb.countStaffRecord(Integer.parseInt(id), name, phone, status, email);
        int totalPage = (count % pageSize == 0) ? count / pageSize : (count / pageSize) + 1;

        ArrayList<Staff> staffs = sdb.manageStaff(Integer.parseInt(id), name, status, phone, email, page, pageSize);

        request.setAttribute("staffs", staffs);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", page);
        request.setAttribute("num", count);
        request.setAttribute("staffID", id.equals("0")?"":"staffID=" + id + "&");
        request.setAttribute("name", name.equals("")?"":"name=" + name + "&");
        request.setAttribute("phone", phone.equals("")?"":"phone=" + phone + "&");
        request.setAttribute("status", status.equals("")?"":"status=" + status + "&");
        request.setAttribute("email", email.equals("")?"":"email=" + email + "&");
        
        request.setAttribute("inputId", id.equals("0")?"":id);
        request.setAttribute("inputName", name.equals("")?"":name);
        request.setAttribute("inputPhone", phone.equals("")?"":phone);
        request.setAttribute("inputStatus", status.equals("")?"":status);
        request.setAttribute("inputEmail", email.equals("")?"":email);
        request.setAttribute("msg", count==0?"No staffs":"");
        request.getRequestDispatcher("../../view/moderator/staff_manage.jsp").forward(request, response);
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
