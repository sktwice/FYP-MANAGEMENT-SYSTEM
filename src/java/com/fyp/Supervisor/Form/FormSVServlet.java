package com.fyp.Supervisor.Form;

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


public class FormSVServlet extends HttpServlet {

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
            int svId = (int) session.getAttribute("sv_id");
            List<StudentReportDAO.StudentReport> listReports = studentReportDao.listAllReportsF7Sv(svId);
            List<StudentReportDAO.StudentReport> listReportsF6 = studentReportDao.listAllReportsF6Sv(svId);
            List<StudentReportDAO.StudentReport> listReportsF8 = studentReportDao.listAllReportsF8SV(svId);
            List<StudentReportDAO.StudentReport> listReportsF5 = studentReportDao.listAllF5(svId);
            request.setAttribute("listReports", listReports);
            request.setAttribute("listReportsF6", listReportsF6);
            request.setAttribute("listReportsF8", listReportsF8);
            request.setAttribute("listReportsF5", listReportsF5);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/Supervisor/Form-Supervisor.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
