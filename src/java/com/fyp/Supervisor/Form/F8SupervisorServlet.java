/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Supervisor.Form;

import com.fyp.Form.FormDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO;
import com.fyp.model.bean.Form8Lecturer;
import com.fyp.model.bean.Form8Supervisor;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;


public class F8SupervisorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentDetailsDAO studentDAO = new StudentDetailsDAO();
        StudentDetailsDAO.StudentDetails studentDetails = studentDAO.getStudentDetails(studentId);

        request.setAttribute("studentDetails", studentDetails);
        request.getRequestDispatcher("/Supervisor/Form8Lecturer.jsp").forward(request, response);
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


            // Generating a random formId
            
            int formtId = Integer.parseInt(request.getParameter("formtId"));

            // Getting form data from request
            String handoverDate = request.getParameter("handoverDate");
            int proBackground = Integer.parseInt(request.getParameter("data1"));
            int objective = Integer.parseInt(request.getParameter("data2"));
            int significance = Integer.parseInt(request.getParameter("data3"));
            int literature = Integer.parseInt(request.getParameter("data4"));
            int proMethodology = Integer.parseInt(request.getParameter("data5"));
            int presentReport = Integer.parseInt(request.getParameter("data6"));
            int progressEvaluate = Integer.parseInt(request.getParameter("data7"));
            int total = Integer.parseInt(request.getParameter("equal"));
            String comment = request.getParameter("comment");
            String role = "lecturer";
           

            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form8 object
            Form8Supervisor form8 = new Form8Supervisor(formtId,handoverDate, proBackground, objective, significance, literature, proMethodology, presentReport, progressEvaluate, total, comment, role, agreement, date);
            System.out.println(form8.getFormTId());
            System.out.println(formtId);
            // Inserting Form8 object into database
            FormDAO dao = new FormDAO();
            dao.insertForm8Supervisor(form8);

            // Redirecting to success page
            response.sendRedirect("Supervisor/Form-Supervisor.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }
}    