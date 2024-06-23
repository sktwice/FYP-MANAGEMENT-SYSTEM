package com.fyp.Lecturer.List;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import com.fyp.Admin.ExaminerList.ExaminerListDAO;  // Import your service or DAO class here
import com.fyp.model.bean.Lecturer;  // Import your Lecturer class here

public class ListExaminerServlet extends HttpServlet {

    private ExaminerListDAO lecturerService;

    @Override
    public void init() throws ServletException {
        // Initialize your service or DAO class
        lecturerService = new ExaminerListDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the list of examiners
        List<Lecturer> examiners = lecturerService.selectAllExaminersByRoles();
        
        // Set the list as an attribute in the request
        request.setAttribute("examiners", examiners);
        
        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Lecturers/Examiner-List.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that lists all examiners by roles";
    }
}
