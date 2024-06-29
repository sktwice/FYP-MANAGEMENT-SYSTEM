package com.fyp.Lecturer.List;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class AssignExaminerServlet extends HttpServlet {
    private AssignDao assignDao;

    public void init() {
        assignDao = new AssignDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AssignDao.ProjectStudent> projectStudents = null;
        List<AssignDao.Examiner> examiners = null;
        try {
            projectStudents = assignDao.listProjectsWithoutExaminer();
            examiners = assignDao.listExaminers(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("projectStudents", projectStudents);
        request.setAttribute("examiners", examiners);
        request.getRequestDispatcher("Lecturers/AssignExaminer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
