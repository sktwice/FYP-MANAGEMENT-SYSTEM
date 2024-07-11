/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Form;

import com.fyp.Form.FormDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO.StudentDetails;
import com.fyp.model.bean.Form2;
import com.fyp.model.bean.Form7;
import com.fyp.model.bean.Form7Lecturer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Random;


public class F7LecturerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentDetailsDAO studentDAO = new StudentDetailsDAO();
        StudentDetails studentDetails = studentDAO.getStudentDetails(studentId);

        request.setAttribute("studentDetails", studentDetails);
        request.getRequestDispatcher("/Examiners/Form7.jsp").forward(request, response);
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

            // Getting form data from request
            int formtId=  Integer.parseInt(request.getParameter("formtId"));
            String presentDate = request.getParameter("presentDate");
            int knowledge = Integer.parseInt(request.getParameter("data1"));
            int overallProject = Integer.parseInt(request.getParameter("data2"));
            int presentMaterial = Integer.parseInt(request.getParameter("data3"));
            int delivery = Integer.parseInt(request.getParameter("data4"));
            int total = Integer.parseInt(request.getParameter("equal"));
            String role="lecturer";
            String comment = request.getParameter("comment");
            

            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form8 object
            Form7Lecturer form7 = new Form7Lecturer(formtId, presentDate, knowledge, overallProject, presentMaterial, delivery,total, comment, role, agreement, date);
            
            // Inserting Form8 object into database
            Form7Dao dao = new Form7Dao();
            dao.insertForm7(form7);

            // Redirecting to success page
            response.sendRedirect(request.getContextPath() + "/ListF7Servlet");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }
}    