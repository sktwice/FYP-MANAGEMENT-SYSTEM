/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Form;

import com.fyp.Form.FormDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO.StudentDetails;
import com.fyp.model.bean.Form2;
import com.fyp.model.bean.Form4;

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


public class F4Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentDetailsDAO studentDAO = new StudentDetailsDAO();
        StudentDetails studentDetails = studentDAO.getStudentDetails(studentId);

        request.setAttribute("studentDetails", studentDetails);
        request.getRequestDispatcher("/Lecturers/Form4.jsp").forward(request, response);
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
            int formtId = Integer.parseInt(request.getParameter("formtId4"));

            // Getting form data from request
            int design = Integer.parseInt(request.getParameter("hiddenResultA"));
            int description = Integer.parseInt(request.getParameter("hiddenResultB"));
            int model = Integer.parseInt(request.getParameter("hiddenResultC"));
            int total = Integer.parseInt(request.getParameter("hiddenTotalResult"));
            

            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form8 object
            Form4 form4 = new Form4(formtId,design, description, model,total, agreement, date);
            System.out.println(form4.getFormTId());
            System.out.println(formtId);
            // Inserting Form8 object into database
            FormDAO dao = new FormDAO();
            dao.insertForm4(form4);

            // Redirecting to success page
            response.sendRedirect(request.getContextPath()+ "/LecturerFormServlet");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }
}    
