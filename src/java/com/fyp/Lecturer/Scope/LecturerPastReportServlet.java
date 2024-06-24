/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Scope;

import com.fyp.model.bean.PastProject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.Admin.PastReport.AddPastReportDAO;
import com.fyp.model.bean.PastProject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class LecturerPastReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private  AddPastReportDAO rpDAO;

    public void init() {
        rpDAO = new AddPastReportDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {

        try{
         listReport(request, response);
                    
        }catch(SQLException e){
        e.printStackTrace();
        }
        

}
    
private void listReport(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<PastProject> listPastReport =  rpDAO.listPastReports();
    request.setAttribute("listPastReport", listPastReport );
    RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturers/Report-Lecturer.jsp");
    dispatcher.forward(request, response);
}
}