package com.fyp.Student.SubmitProposalSV;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Proposal;


public class LecturerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LecturerDAO lecturerDAO;

    @Override
    public void init() {
        lecturerDAO = new LecturerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("../LoginID.jsp"); // Redirect to login if session is invalid
            return;
        }

        int studentId = (int) session.getAttribute("student_id");
        System.out.println("DEBUG: Student ID: " + studentId); // Debug statement to print student_id

        try {
            if(lecturerDAO.studentHasProject(studentId)){
                Lecturer lecturer= lecturerDAO.getLecturerByStudent(studentId);
                LecturerDAO.Total total=lecturerDAO.getMarks(studentId);
                request.setAttribute("lecturer", lecturer);
                request.setAttribute("total", total);
                
                System.out.println("DEBUG: Total 2: " + total.getTotal2());
                System.out.println("DEBUG: Total 3: " + total.getTotal3());
                System.out.println("DEBUG: Total 4: " + total.getTotal4());
                System.out.println("DEBUG: Total 7 Supervisor: " + total.getTotal7sv());
                System.out.println("DEBUG: Total 7 Examiner: " + total.getTotal7ex());
                System.out.println("DEBUG: Total 8 Lecturer: " + total.getTotal8lec());
                System.out.println("DEBUG: Total 8 Supervisor: " + total.getTotal8sv());
                System.out.println("DEBUG: Total 8 Examiner: " + total.getTotal8ex());

                // Forward request to the JSP to display proposals
                RequestDispatcher dispatcher = request.getRequestDispatcher("Result-Student.jsp");
                dispatcher.forward(request, response);
            }else{
                if (lecturerDAO.studentHasProposal(studentId)) {
                    List<Proposal> listProposals = lecturerDAO.selectProposalsByStudentId(studentId);
                    request.setAttribute("listProposals", listProposals);

                    // Forward request to the JSP to display proposals
                    RequestDispatcher dispatcher = request.getRequestDispatcher("StatusProposal.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // Retrieve list of lecturers who are supervisors
                    List<Lecturer> listLecturer = lecturerDAO.selectLecturersBySupervisor();
                    request.setAttribute("listLecturer", listLecturer);

                    // Forward request to the JSP to display lecturers
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturer.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving data", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
