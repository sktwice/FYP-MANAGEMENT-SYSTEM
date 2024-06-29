package com.fyp.Login;

import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Examiner;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Role;
import com.fyp.model.bean.Supervisor;
import com.fyp.model.bean.Teach;
import com.fyp.model.user.AdminDAO;
import com.fyp.model.user.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


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
        lecturerDAO = new LecturerDAO();
        studentDAO = new StudentDAO();
    }

    @Override
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
                        String contextPath = request.getContextPath();
                        response.sendRedirect(contextPath +"/DashboardAdmin"); // Redirect to the admin dashboard
                    } else {
                        response.sendRedirect("generic.jsp"); // Redirect to a generic page if admin details not found
                    }
                } else if ("student".equals(login.getCategory())) {
                    int studentId = studentDAO.getStudentIdByLoginId(login.getLoginId());
                    if (studentId != -1) {
                        session.setAttribute("student_id", studentId);
                        String contextPath = request.getContextPath();
                        response.sendRedirect(contextPath +"/DashboardStudent");
                    } else {
                        response.sendRedirect("generic.jsp"); // Redirect to a generic page if student details not found
                    }
                } else if ("lecturer".equals(login.getCategory())) {
                    Lecturer lecturer = lecturerDAO.getLecturerByLoginId(login.getLoginId());
                if (lecturer != null) {
                    int lecturerId = lecturer.getlId();
                    session.setAttribute("lecturer_id", lecturerId);

                    // Assuming you have a method to get Supervisor details by lecturerId
                    Supervisor supervisor = lecturerDAO.getSupervisorByLecturerId(lecturerId);
                    if (supervisor != null) {
                        int svId = supervisor.getSvId();
                        System.out.println(svId);
                        session.setAttribute("sv_id", svId); // Store svId in session
                    }
                    
                    Teach teach = lecturerDAO.getTeachByLecturerId(lecturerId);
                    if (teach != null) {
                        int tId = teach.gettId();
                        System.out.println(tId);
                        session.setAttribute("t_id", tId); // Store svId in session
                    }
                    
                    Examiner examiner = lecturerDAO.getExaminerByLecturerId(lecturerId);
                    if (examiner != null) {
                        int exId = examiner.getExId();
                        System.out.println(exId);
                        session.setAttribute("ex_id", exId); // Store svId in session
                    }

                        int roleCount = lecturerDAO.countRolesByLecturerId(lecturerId);
                        List<Role> roles = lecturerDAO.getRolesByLecturerId(lecturerId);

                        boolean hasActiveSupervisorRole = false;
                        boolean hasActiveExaminerRole = false;
                        boolean hasActiveTeachingRole = false;

                        for (Role role : roles) {
                            if ("supervisor".equalsIgnoreCase(role.getPosition()) && "active".equalsIgnoreCase(role.getStatus())) {
                                hasActiveSupervisorRole = true;
                            }
                            if ("examiner".equalsIgnoreCase(role.getPosition()) && "active".equalsIgnoreCase(role.getStatus())) {
                                hasActiveExaminerRole = true;
                            }
                            if ("teaching".equalsIgnoreCase(role.getPosition()) && "active".equalsIgnoreCase(role.getStatus())) {
                                hasActiveTeachingRole = true;
                            }
                        }

                        if (roleCount > 2) {
                            response.sendRedirect("multipleRolesPage.jsp"); // Redirect to a page for multiple active roles
                        } else if (roleCount == 2) {
                            if (hasActiveSupervisorRole && hasActiveExaminerRole) {
                                response.sendRedirect("SupervisorExaminerPage.jsp");
                            } else if (hasActiveTeachingRole && hasActiveExaminerRole) {
                                response.sendRedirect("TeachingExaminerPage.jsp");
                            } else if (hasActiveTeachingRole && hasActiveSupervisorRole) {
                                response.sendRedirect("TeachingSupervisorPage.jsp");
                            } else {
                                String contextPath = request.getContextPath();
                                response.sendRedirect(contextPath +"/DashboardLecturer");
                            }
                        } else if (roleCount == 1) {
                            if (hasActiveSupervisorRole) {
                                String contextPath = request.getContextPath();
                                response.sendRedirect(contextPath +"/DashboardServlet");
                            } else if (hasActiveExaminerRole) {
                                String contextPath = request.getContextPath();
                                response.sendRedirect(contextPath +"/DashboardExaminer");
                            } else if (hasActiveTeachingRole) {
                                String contextPath = request.getContextPath();
                                response.sendRedirect(contextPath +"/DashboardLecturer");
                            } else {
                                String contextPath = request.getContextPath();
                                response.sendRedirect(contextPath +"/DashboardLecturer");
                            }
                        } else {
                            response.sendRedirect("generic.jsp");
                        }
                    } else {
                        response.sendRedirect("generic.jsp");
                    }
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid username or password");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}
