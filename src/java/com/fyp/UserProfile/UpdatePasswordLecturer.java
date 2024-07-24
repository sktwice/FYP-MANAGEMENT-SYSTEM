package com.fyp.UserProfile;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Login;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class UpdatePasswordLecturer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int loginId = Integer.parseInt(request.getParameter("loginId"));
        String newPassword = request.getParameter("newPassword");

        Login login = userDao.selectLogin(loginId);
        userDao.updatePassword(newPassword, loginId);
       response.sendRedirect("LoginID.jsp");
//            request.setAttribute("errorMessage", "Current password is incorrect or other error.");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/UserProfile-Admin.jsp");
//            dispatcher.forward(request, response);
        
    }
}
