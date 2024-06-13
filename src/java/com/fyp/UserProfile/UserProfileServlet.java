/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.UserProfile;

import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Student;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.user.AdminDAO;
import com.fyp.model.user.StudentDAO;
import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;
    private StudentDAO studentDAO;
    private LecturerDAO lecturerDAO;

    public void init() {
        adminDAO = new AdminDAO();
        studentDAO = new StudentDAO();
        lecturerDAO = new LecturerDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userCategory = (String) session.getAttribute("userCategory");

        if (userCategory != null) {
            switch (userCategory) {
                case "admin":
                    int adminId = (int) session.getAttribute("admin_id");
                     System.out.println("DEBUG: Admin ID: " + adminId); 
                    try {
                        Admin admin = adminDAO.getAdminByLoginId(adminId);
                        request.setAttribute("admin", admin);
                        request.getRequestDispatcher("DisplayUserProfile-Admin.jsp").forward(request, response);
                    } catch (SQLException e) {
                        // Handle SQL exception
                        e.printStackTrace();
                        response.sendRedirect("error.jsp");
                    }
                    break;
//                case "student":
//                    int studentId = (int) session.getAttribute("student_id");
//                    try {
//                        Student student = studentDAO.getStudentByLoginId(studentId);
//                        request.setAttribute("student", student);
//                        request.getRequestDispatcher("UserProfile-Student.jsp").forward(request, response);
//                    } catch (SQLException e) {
//                        // Handle SQL exception
//                        e.printStackTrace();
//                        response.sendRedirect("error.jsp");
//                    }
//                    break;
                case "lecturer":
                    int lecturerId = (int) session.getAttribute("lecturer_id");
                    Lecturer lecturer = lecturerDAO.getLecturerByLoginId(lecturerId); // Handle SQL exception
                    request.setAttribute("lecturer", lecturer);
                    request.getRequestDispatcher("UserProfile-Lecturer.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
