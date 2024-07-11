package com.fyp.Lecturer.Form;

import com.fyp.Form.FormDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO.StudentDetails;
import com.fyp.model.bean.Form2;

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


public class F2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentDetailsDAO studentDAO = new StudentDetailsDAO();
        StudentDetails studentDetails = studentDAO.getStudentDetails(studentId);

        request.setAttribute("studentDetails", studentDetails);
        request.getRequestDispatcher("/Lecturers/Form2.jsp").forward(request, response);
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
            int formtId=Integer.parseInt(request.getParameter("formtId"));
            int identity = Integer.parseInt(request.getParameter("data1"));
            int evidence = Integer.parseInt(request.getParameter("data2"));
            int solution = Integer.parseInt(request.getParameter("data3"));
            int total = Integer.parseInt(request.getParameter("equal"));
            
            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form8 object
            Form2 form2 = new Form2(formtId,identity, evidence, solution,total, agreement, date);
            System.out.println(form2.getFormTId());
            System.out.println(formtId);
            // Inserting Form8 object into database
            FormDAO dao = new FormDAO();
            dao.insertForm2(form2);

            // Redirecting to success page
            response.sendRedirect(request.getContextPath()+ "/LecturerFormServlet");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }
}    
