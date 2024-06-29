package com.fyp.UserProfile;

import com.fyp.model.bean.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class UpdateAdminUserProfile extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            updateAdmin(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int adminId = Integer.parseInt(request.getParameter("admin_id"));
        String aName = request.getParameter("a_name");
        int phoneNum = Integer.parseInt(request.getParameter("phone_num"));
        String email = request.getParameter("email");

        Admin admin = new Admin(adminId, 0, "", aName, phoneNum, email);  
        boolean isUpdated = userDao.updateAdmin(admin);

        if (isUpdated) {
            response.sendRedirect("AdminUserProfileServlet?admin_id=" + adminId);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Admin not found");
        }
    }
}