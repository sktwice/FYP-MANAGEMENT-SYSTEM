package com.fyp.controller.lecturer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.fyp.lecturer.dao.LecturerDAO;
import com.fyp.dao.student.ProposalSvDAO;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Scope;


public class LecturerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LecturerDAO lecturerDAO;
    private ProposalSvDAO proposalSvDAO;

    @Override
    public void init() {
        lecturerDAO = new LecturerDAO();
        proposalSvDAO = new ProposalSvDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve list of lecturers
            List<Lecturer> listLecturer = lecturerDAO.selectAllLecturers();
            System.out.println("Servlet: Number of lecturers retrieved: " + listLecturer.size());
            request.setAttribute("listLecturer", listLecturer);
            
            // Retrieve list of scopes
            List<Scope> scopeList = proposalSvDAO.getAllScopes();
            request.setAttribute("scopeList", scopeList);
            
            // Forward request to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturer.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving data", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Your doPost method implementation goes here
    }
}
