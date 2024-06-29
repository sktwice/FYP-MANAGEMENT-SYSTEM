/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.UserProfile;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Student;
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
public class StudentUserProfileServlet extends HttpServlet {
     private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);

        int studentId = (int) session.getAttribute("student_id");
        Student existingStudent = userDao.selectStudent(studentId);

        if (existingStudent != null) {
            request.setAttribute("Student", existingStudent);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Students/UserProfile-Student.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
