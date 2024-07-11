package com.fyp.Lecturer.Form;

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


public class LecturerFormServlet extends HttpServlet {

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
            int tId = (int) session.getAttribute("t_id");
            List<StudentReportDAO.StudentReport> listReportsF8 = studentReportDao.listAllReportsF8Lec(tId);
            List<StudentReportDAO.StudentReport> listReports = studentReportDao.listAllReportsF2Lec(tId);
            List<StudentReportDAO.StudentReport> listReportsF3 = studentReportDao.listAllReportsF3Lec(tId);
            List<StudentReportDAO.StudentReport> listReportsF4 = studentReportDao.listAllReportsF4Lec(tId);
            request.setAttribute("listReportsF3", listReportsF3);
            request.setAttribute("listReportsF4", listReportsF4);
            request.setAttribute("listReportsF8", listReportsF8);
            request.setAttribute("listReports", listReports);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/Lecturers/Form-Lecturer.jsp");
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
