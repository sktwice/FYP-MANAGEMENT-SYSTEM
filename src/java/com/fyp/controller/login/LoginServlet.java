package com.fyp.controller.login;

import com.fyp.model.bean.Login;
import com.fyp.model.bean.Admin;
import com.fyp.model.Dao.login.LoginDAO;
import com.fyp.model.user.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO;
    private AdminDAO adminDAO;

    @Override
    public void init() {
        loginDAO = new LoginDAO();
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Login login = loginDAO.validate(username, password);
            if (login != null) {
                HttpSession session = request.getSession();
                session.setAttribute("login_id", login.getLoginId());
                session.setAttribute("userName", login.getUsername());
                session.setAttribute("userCategory", login.getCategory());

                if ("admin".equals(login.getCategory())) {
                    Admin admin = adminDAO.getAdminByLoginId(login.getLoginId());
                    if (admin != null) {
                        session.setAttribute("admin_id", admin.getAdminId());
                        response.sendRedirect("Admin/Dashboard-Admin.jsp"); // Redirect to the admin dashboard
                    } else {
                        response.sendRedirect("generic.jsp"); // Redirect to a generic page if admin details not found
                    }
                } else if ("student".equals(login.getCategory())) {
                    response.sendRedirect("Students/student.jsp");
                } else if ("lecturer".equals(login.getCategory())) {
                    int loginId = login.getLoginId();
                    if (loginId != 0) {
                        String position = loginDAO.getLecturerPosition(loginId);
                        if (position != null) {
                            switch (position) {
                                case "examiner":
                                    response.sendRedirect("examiner.jsp");
                                    break;
                                case "supervisor":
                                    response.sendRedirect("supervisor.jsp");
                                    break;
                                default:
                                    response.sendRedirect("generic.jsp");
                                    break;
                            }
                        } else {
                            response.sendRedirect("generic.jsp");
                        }
                    } else {
                        response.sendRedirect("generic.jsp");
                    }
                } else {
                    response.sendRedirect("generic.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid username or password");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
