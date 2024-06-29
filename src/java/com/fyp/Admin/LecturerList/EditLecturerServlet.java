package com.fyp.Admin.LecturerList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Lecturer;

public class EditLecturerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;

    public void init() {
        lecturerDAO = new LecturerListDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            updateLecturer(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            showEditForm(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateLecturer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    String lIdStr = request.getParameter("lId");
    String lName = request.getParameter("lName");
    String position = request.getParameter("position");
    String email = request.getParameter("email");

    // Debug logs
    System.out.println("lId: " + lIdStr);
    System.out.println("lName: " + lName);
    System.out.println("position: " + position);
    System.out.println("email: " + email);

    // Null check and parse
    int lId = lIdStr != null ? Integer.parseInt(lIdStr) : 0;

    // Get the existing lecturer from the database
    Lecturer lecturer = lecturerDAO.selectLecturer(lId);
    if (lecturer != null) {
        lecturer.setlName(lName);
        lecturer.setPosition(position);
        lecturer.setEmail(email);
        
        lecturerDAO.updateLecturer(lecturer);
    }

    response.sendRedirect(request.getContextPath() + "/LecturerListServlet");
}


    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int lId = Integer.parseInt(request.getParameter("id"));
        Lecturer existingLecturer = lecturerDAO.selectLecturer(lId);
        request.setAttribute("lecturer", existingLecturer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ListLecturerForm.jsp");
        dispatcher.forward(request, response);
    }
}