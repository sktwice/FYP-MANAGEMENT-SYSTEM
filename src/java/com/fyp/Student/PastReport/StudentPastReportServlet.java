package com.fyp.Student.PastReport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.PastProject;
import com.fyp.Student.PastReport.StudentPastReportDao;

import java.io.IOException;
import java.util.List;


public class StudentPastReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentPastReportDao dao = new StudentPastReportDao();
        List<PastProject> pastProjects = dao.getPastProjects();

        request.setAttribute("pastProjects", pastProjects);
        request.getRequestDispatcher("Report-Student.jsp").forward(request, response);
    }
}
