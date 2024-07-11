package com.fyp.Examiner.form;

import com.fyp.Form.FormDAO;
import com.fyp.Lecturer.Form.Form7Dao;
import com.fyp.Lecturer.Form.StudentDetailsDAO;
import com.fyp.Lecturer.Form.StudentDetailsDAO.StudentDetails;
import com.fyp.Lecturer.Form.StudentReportDAO;
import com.fyp.model.bean.Form7Lecturer;
import com.fyp.model.bean.Form8;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;


public class ListF7Servlet extends HttpServlet {

    private StudentReportDAO studentReportDao;
    private StudentDetailsDAO studentDetailsDao;
    private Form7Dao form7Dao;

    @Override
    public void init() throws ServletException {
        studentReportDao = new StudentReportDAO();
        studentDetailsDao = new StudentDetailsDAO();
        form7Dao = new Form7Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            HttpSession session = request.getSession();
            int exId = (int) session.getAttribute("ex_id");
            List<StudentReportDAO.StudentReport> listReports = studentReportDao.listAllReportsEX(exId);
            List<StudentReportDAO.StudentReport> listReportsF8 = studentReportDao.listAllReportsEXF8(exId);
            request.setAttribute("listReports", listReports);
            request.setAttribute("listReportsF8", listReportsF8);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/Examiners/Form.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
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
            int formtId = Integer.parseInt(request.getParameter("formtId"));
            String presentDate = request.getParameter("presentDate");
            int knowledge = Integer.parseInt(request.getParameter("data1"));
            int overallProject = Integer.parseInt(request.getParameter("data2"));
            int presentMaterial = Integer.parseInt(request.getParameter("data3"));
            int delivery = Integer.parseInt(request.getParameter("data4"));
            int total = Integer.parseInt(request.getParameter("equal"));
            String role = "examiner";
            String comment = request.getParameter("comment");

            // Setting other required fields
            String agreement = "approved";
            LocalDate currentDate = LocalDate.now();
            String date = currentDate.toString();

            // Creating Form7Lecturer object
            Form7Lecturer form7 = new Form7Lecturer(formtId, presentDate, knowledge, overallProject, presentMaterial, delivery, total, comment, role, agreement, date);

            // Inserting Form7Lecturer object into database
            form7Dao.insertForm7(form7);
            
            
           

            // Redirecting to success page
            response.sendRedirect(request.getContextPath()+ "/ListF7Servlet");
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error");
        }
    }
}
