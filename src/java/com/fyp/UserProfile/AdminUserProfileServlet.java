package com.fyp.UserProfile;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Admin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminUserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);

        int adminId = (int) session.getAttribute("admin_id");
        Admin existingAdmin = userDao.selectAdmin(adminId);

        if (existingAdmin != null) {
            request.setAttribute("admin", existingAdmin);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/UserProfile-Admin.jsp");
        dispatcher.forward(request, response);
    }
}
