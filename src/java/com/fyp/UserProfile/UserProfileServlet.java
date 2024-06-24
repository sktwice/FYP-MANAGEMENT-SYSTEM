package com.fyp.UserProfile;

import com.fyp.model.bean.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist
        if (session != null && session.getAttribute("student_id") != null) {
            int studentId = (int) session.getAttribute("student_id");
            Student student = userDao.getStudentById(studentId);

            if (student != null) {
                // Set student object in request attribute to use in JSP
                request.setAttribute("student", student);
                request.getRequestDispatcher("/Students/UserProfile-Student.jsp").forward(request, response);
            } else {
                // Handle case where student is not found
                response.getWriter().println("Student not found.");
            }
        } else {
            // Handle case where session or student_id attribute is not present
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
