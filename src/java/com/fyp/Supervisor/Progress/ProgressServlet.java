/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Supervisor.Progress;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class ProgressServlet extends HttpServlet {

    private ProgressDao progressDao;

    @Override
    public void init() {
        progressDao = new ProgressDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the supervisor ID from the request
        HttpSession session = request.getSession();
        int svId = (int) session.getAttribute("sv_id");

        try {
            // Call DAO functions
            List<ProgressDao.StudentReport> listReports = progressDao.listAllReportsSV(svId);
            List<String> lecturerNames = progressDao.getLecturerNamesBySvId(svId);

            // Set the retrieved data as request attributes
            request.setAttribute("listReports", listReports);
            request.setAttribute("lecturerNames", lecturerNames);

            // Dispatch to JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Supervisor/Progress-Supervisor.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
