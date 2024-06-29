package com.fyp.Dashboard;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class DashboardLecturer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DashboardDao dashboardDao;

    public void init() {
        dashboardDao = new DashboardDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalStudents = dashboardDao.getTotalStudents();
        int totalProject=dashboardDao.getTotalProject();
        int totalPastProject=dashboardDao.getTotalPastProject();
        int totalScope=dashboardDao.getTotalScope();

        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("totalProject", totalProject);
        request.setAttribute("totalPastProject", totalPastProject);
        request.setAttribute("totalScope", totalScope);
        System.out.println(totalStudents);
        request.getRequestDispatcher("/Lecturers/Dashboard-Lecturer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
