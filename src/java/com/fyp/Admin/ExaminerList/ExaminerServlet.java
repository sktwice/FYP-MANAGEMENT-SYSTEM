package com.fyp.Admin.ExaminerList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import com.fyp.Student.SubmitProposalSV.ProposalSvDAO;
import com.fyp.model.bean.Lecturer;


public class ExaminerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LecturerDAO examinerDAO;

    @Override
    public void init() {
        examinerDAO = new LecturerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve list of examiner
            List<Lecturer> listExaminer = examinerDAO.selectAllExaminers();
            System.out.println("Servlet: Number of examiner retrieved: " + listExaminer.size());
            request.setAttribute("listExaminer", listExaminer);
            
            
            // Forward request to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturer.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving data", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Your doPost method implementation goes here
    }
}
