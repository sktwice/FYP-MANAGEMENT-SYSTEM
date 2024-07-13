package com.fyp.Lecturer.List;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import com.fyp.Admin.ExaminerList.ExaminerListDAO;
import com.fyp.Admin.LecturerList.LecturerListDAO;// Import your service or DAO class here
import com.fyp.model.bean.Lecturer;  // Import your Lecturer class here
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ListExaminerServlet extends HttpServlet {

    private ExaminerListDAO lecturerService;
    private LecturerListDAO lecturerDao;
    private AssignDao assignDao;

    @Override
    public void init() throws ServletException {
        // Initialize your service or DAO class
        lecturerService = new ExaminerListDAO();
        lecturerDao = new LecturerListDAO();
        assignDao = new AssignDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the list of examiners
        try {
        List<LecturerListDAO.LecturerRole> examiner = lecturerDao.examinerLecturer();
        List<AssignDao.ProjectStudent> projectStudents = assignDao.listProjectsWithoutExaminer();
        
        List<AssignDao.Examiner> examiners = assignDao.listExaminers();
        request.setAttribute("examiner", examiner);
        request.setAttribute("projectStudents", projectStudents);
        request.setAttribute("examiners", examiners);
        } catch (SQLException ex) {
            Logger.getLogger(ListExaminerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Set the list as an attribute in the request
        
        
        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Lecturers/Examiner-List.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that lists all examiners by roles";
    }
}
