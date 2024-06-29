package com.fyp.Download;

import com.fyp.Admin.PastReport.AddPastReportDAO;
import com.fyp.model.bean.PastProject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class ListPastReportsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddPastReportDAO PR;

    @Override
    public void init() {
        PR = new AddPastReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<PastProject> reports = PR.getAllPastReports();
            request.setAttribute("reports", reports);
            request.getRequestDispatcher("/viewReports.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
