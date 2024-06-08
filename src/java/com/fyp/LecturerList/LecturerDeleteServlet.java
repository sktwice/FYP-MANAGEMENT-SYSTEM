package com.fyp.LecturerList;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Lecturer;

public class LecturerDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;

    public void init() {
        lecturerDAO = new LecturerListDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            deleteLecturerAndLogin(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteLecturerAndLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int lId = Integer.parseInt(request.getParameter("id"));
        
        // Fetch the lecturer to get the login_id before deleting
        Lecturer lecturer = lecturerDAO.selectLecturer(lId);
        if (lecturer != null) {
            int loginId = lecturer.getLoginId();

            lecturerDAO.deleteLecturer(lId);

           
            lecturerDAO.deleteLogin(loginId);
        }

        response.sendRedirect("LecturerListServlet");
    }
}