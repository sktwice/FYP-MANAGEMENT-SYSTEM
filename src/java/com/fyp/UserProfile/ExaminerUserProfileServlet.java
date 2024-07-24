/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author User
 */
public class ExaminerUserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);

        int lId = (int) session.getAttribute("lecturer_id");
        Lecturer existingLecturer = userDao.selectLecturer(lId);
        int loginId=(int) session.getAttribute("login_id");
        Login login=userDao.selectLogin(loginId);

        if (existingLecturer != null) {
            request.setAttribute("Lecturer", existingLecturer);
            request.setAttribute("login", login);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Examiners/UserProfile-Examiner.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
