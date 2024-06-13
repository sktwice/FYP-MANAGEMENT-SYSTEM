package com.fyp.Login;

import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.user.AdminDAO;
import com.fyp.model.user.StudentDAO;

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
    private LecturerDAO lecturerDAO;
    private StudentDAO studentDAO;

    @Override
    public void init() {
        loginDAO = new LoginDAO();
        adminDAO = new AdminDAO();
        lecturerDAO=new LecturerDAO();
        studentDAO = new StudentDAO();
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
                    // Here we fetch the student ID using the login ID
                    int studentId = studentDAO.getStudentIdByLoginId(login.getLoginId());
                    if (studentId != -1) {
                        session.setAttribute("student_id", studentId);
                        response.sendRedirect("Students/Dashboard.jsp");
                    } else {
                        response.sendRedirect("generic.jsp"); // Redirect to a generic page if student details not found
                    }
                } else if ("lecturer".equals(login.getCategory())) {
                    Lecturer lecturer = lecturerDAO.getLecturerByLoginId(login.getLoginId());
                    if (lecturer != null) {
                        session.setAttribute("lecturer_id", lecturer.getlId());
                        session.setAttribute("position", lecturer.getPosition());
                        switch (lecturer.getPosition()) {
                            case "examiner":
                                //response.sendRedirect("examiner.jsp");
                                response.sendRedirect("examiner.jsp");
                                break;
                                case "Examiner":
                                //response.sendRedirect("examiner.jsp");
                                response.sendRedirect("examiner.jsp");
                                break;
                                case "Supervisor":
                                response.sendRedirect("Supervisor/Dashboard-Supervisor.jsp");
                                break;
                                case "supervisor":
                                response.sendRedirect("Supervisor/Dashboard-Supervisor.jsp");
                                break;
                            default:
                                response.sendRedirect("Lecturers/Dashboard-Lecturer.jsp");
                                break;
                        }
                    } else {
                        response.sendRedirect("generics.jsp");
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
