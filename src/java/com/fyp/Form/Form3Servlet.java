/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Form;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fyp.Form.FormDAO;
import com.fyp.model.bean.Form3;
import com.fyp.model.bean.Form4;
import com.fyp.model.bean.Project;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form3Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProjectViewDao projectsDAO = new ProjectViewDao();
        List<Project> projects = projectsDAO.getAllProjects();
        request.setAttribute("projectList", projects);
        request.getRequestDispatcher("Lecturers/F3-LiteratureReviewEvaluationForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("login_id") == null) {
            response.sendRedirect("/LoginID.jsp"); // Redirect to login if session is invalid
            return;
        }

        try {
            Integer loginIdObj = (Integer) session.getAttribute("login_id");
            if (loginIdObj == null) {
                response.sendRedirect("LoginID.jsp");
                return;
            }
            int loginId = loginIdObj;

            // Getting projectInfo and splitting it
            String projectInfo = request.getParameter("projectInfo");
            String[] projectData = projectInfo.split(",");
            // Parsing project data
            int proId = Integer.parseInt(projectData[0]);
            int studentId = Integer.parseInt(projectData[1]);
            int lId = Integer.parseInt(projectData[2]);

            // Generating a random formId
            Random rand = new Random();
            int formId = rand.nextInt(1000);

            // Getting form data from request
            int relevance = Integer.parseInt(request.getParameter("data1"));
            int knowledge = Integer.parseInt(request.getParameter("data2"));
            int writing = Integer.parseInt(request.getParameter("data3"));
            int total = Integer.parseInt(request.getParameter("equal"));
            
            // Logging loginId for debugging purposes
            System.out.println("DEBUG: Login ID: " + loginId);

            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form8 object
            Form3 form3 = new Form3(formId, studentId, lId, proId, relevance, knowledge, writing,total, agreement, date, loginId);
            System.out.println(form3.getFormId());
            System.out.println(formId);
            // Inserting Form8 object into database
            FormDAO dao = new FormDAO();
            dao.insertForm3(form3);

            // Redirecting to success page
            response.sendRedirect("Lecturers/Form-Lecturer.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Form3Servlet handles the submission of Form 3.";
    }
}
