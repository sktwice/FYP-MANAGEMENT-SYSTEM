/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Admin.PastReport;

import com.fyp.Admin.LecturerList.LecturerListDAO;
import com.fyp.model.user.AdminDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;




public class ShowAddForm extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private AddPastReportDAO psDAO;
    private AdminDAO AdminDAO;
    private LecturerListDAO lecturerDAO;

    public void init() {
        psDAO = new AddPastReportDAO();
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {

        try {
            showAddForm(request, response);
        } catch (SQLException e) {
             e.printStackTrace();
        }
}
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Add-New-Pass-Report-Admin.jsp");
        dispatcher.forward(request, response);
    }



}
