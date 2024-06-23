/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Form;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class StudentReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentReportDAO studentReportDAO;

    @Override    
    public void init() {
        studentReportDAO = new StudentReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            HttpSession session = request.getSession();
            int teacherId = (int) session.getAttribute("t_id");
            List<StudentReportDAO.StudentReport> listReports = studentReportDAO.listAllReports(teacherId);
            request.setAttribute("listReports", listReports);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Lecturers/F2List.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
