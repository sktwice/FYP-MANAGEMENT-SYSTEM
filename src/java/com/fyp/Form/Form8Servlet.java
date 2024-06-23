///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package com.fyp.Form;
//
//import com.fyp.model.bean.Form8;
//import com.fyp.model.bean.Project;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import com.fyp.Form.ProjectViewDao;
//import java.util.List;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.time.LocalDate;
//import java.util.Random;
//
//
//public class Form8Servlet extends HttpServlet {
//
//    @Override
//    public void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        ProjectViewDao projectsDAO = new ProjectViewDao();
//        List<Project> projects = projectsDAO.getAllProjects();
//        request.setAttribute("projectList", projects);
//        request.getRequestDispatcher("/Supervisor/F8.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("login_id") == null) {
//            response.sendRedirect("/LoginID.jsp"); // Redirect to login if session is invalid
//            return;
//        }
//
//        try {
//            Integer loginIdObj = (Integer) session.getAttribute("login_id");
//            if (loginIdObj == null) {
//                response.sendRedirect("LoginID.jsp");
//                return;
//            }
//            int loginId = loginIdObj;
//
//            // Getting projectInfo and splitting it
//            String projectInfo = request.getParameter("projectInfo");
//            String[] projectData = projectInfo.split(",");
//            // Parsing project data
//            int proId = Integer.parseInt(projectData[0]);
//            int studentId = Integer.parseInt(projectData[1]);
//            int lId = Integer.parseInt(projectData[2]);
//
//            // Generating a random formId
//            Random rand = new Random();
//            int formId = rand.nextInt(1000);
//
//            // Getting form data from request
//            String handoverDate = request.getParameter("handoverDate");
//            int proBackground = Integer.parseInt(request.getParameter("data1"));
//            int objective = Integer.parseInt(request.getParameter("data2"));
//            int significance = Integer.parseInt(request.getParameter("data3"));
//            int literature = Integer.parseInt(request.getParameter("data4"));
//            int proMethodology = Integer.parseInt(request.getParameter("data5"));
//            int presentReport = Integer.parseInt(request.getParameter("data6"));
//            int progressEvaluate = Integer.parseInt(request.getParameter("data7"));
//            int total = Integer.parseInt(request.getParameter("equal"));
//            String comment = request.getParameter("comment");
//            
//            // Logging loginId for debugging purposes
//            System.out.println("DEBUG: Login ID: " + loginId);
//
//            // Setting other required fields
//            String agreement = "approved";
//            LocalDate currentDate = LocalDate.now();
//            String date = currentDate.toString();
//
//            // Creating Form8 object
//            Form8 form8 = new Form8(formId, studentId, lId, proId, handoverDate, proBackground, objective, significance, literature, proMethodology, presentReport, progressEvaluate, total, comment, loginId, agreement, date);
//            System.out.println(form8.getFormId());
//            System.out.println(formId);
//            // Inserting Form8 object into database
//            FormDAO dao = new FormDAO();
//            dao.insertForm8(form8);
//
//            // Redirecting to success page
//            response.sendRedirect("Supervisor/Form-Supervisor.jsp");
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
//        }
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Form8Servlet handles the submission of Form 8.";
//    }
//}
