package com.fyp.Lecturer.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class UpdateExaminerServlet extends HttpServlet {
   
    private AssignDao assignDao;

    @Override
    public void init() throws ServletException {
        super.init();
        assignDao = new AssignDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This servlet will primarily handle doPost, so doGet can be left empty
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the request
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int examinerId = Integer.parseInt(request.getParameter("examinerId"));

        // Call DAO method to assign examiner
        boolean success = assignDao.assignExaminer(studentId, examinerId); // Handle SQL exception (optional)
        // You can redirect to an error page or display an error message
        if (success) {
            // Reload the page after update
            response.sendRedirect(request.getContextPath() + "/ListExaminerServlet");
        } else {
            // Handle failure scenario (optional)
            // You can redirect to an error page or display an error message
            response.getWriter().println("Failed to assign examiner.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Update Examiner Servlet";
    }
}
