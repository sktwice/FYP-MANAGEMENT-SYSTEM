/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Scope;

import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Lecturer;
import com.fyp.LecturerList.LecturerListDAO;
import com.fyp.model.user.AdminDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



public class EditScopeForm extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private AddScopeDAO ScopeDAO;
    private AdminDAO AdminDAO;
    private LecturerListDAO lecturerDAO;

    public void init() {
        ScopeDAO = new AddScopeDAO();
        AdminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {

        try {
            showProForm(request, response);
        } catch (SQLException e) {
             e.printStackTrace();
        }
}
    


    private void showProForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        //int lId = Integer.parseInt(request.getParameter("lId"));
       // Lecturer existingLecturer = lecturerDAO.selectLecturer(lId);
        
        //int aId = Integer.parseInt(request.getParameter("adminId"));
        //Admin existingadmin = AdminDAO.getAdminByLoginId(aId);
        
        //int lId1 = existingLecturer.getlId();
        //int aId1 = existingadmin.getAdminId();
    
    // Set f_id attribute in request scope
        //request.setAttribute("lId", lId1);
        //request.setAttribute("adminId", aId1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Add-New-Scope-Admin.jsp");
        dispatcher.forward(request, response);
    }



}
