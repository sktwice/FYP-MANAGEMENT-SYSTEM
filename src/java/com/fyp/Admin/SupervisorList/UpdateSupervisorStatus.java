package com.fyp.Admin.SupervisorList;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateSupervisorStatus extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SupervisorListDao SVDAO;

    public UpdateSupervisorStatus() {
        this.SVDAO = new SupervisorListDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lecturerId = Integer.parseInt(request.getParameter("lecturerId"));
        String currentStatus = request.getParameter("currentStatus");

        try {
            if ("active".equals(currentStatus)) {
                SVDAO.disableSupervisor(lecturerId);
            } else {
                SVDAO.enableSupervisor(lecturerId);
            }
            response.sendRedirect("ListSVRole"); // Redirect back to the list page
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}