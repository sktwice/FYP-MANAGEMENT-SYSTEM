package com.fyp.Admin.LecturerList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;

    @Override
    public void init() {
        lecturerDAO = new LecturerListDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    int roleId = Integer.parseInt(request.getParameter("roleId"));
    String status = request.getParameter("status");
    System.out.println("Received roleId: " + roleId + ", status: " + status);

    // Update role status based on status parameter
    // Ensure lecturerDAO is properly initialized in init() method
    boolean success = false;
    if ("Active".equalsIgnoreCase(status)) {
        success = lecturerDAO.updateRoleUnActive(roleId);
    } else if ("Unactive".equalsIgnoreCase(status)) {
        success = lecturerDAO.updateRoleActive(roleId);
    }
    System.out.println("Update status success: " + success);

    // Redirect back to the JSP page
    response.sendRedirect(request.getContextPath() + "/LecturerListServlet");
}

}
