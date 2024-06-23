package com.fyp.Supervisor.RequestSv;

import com.fyp.Student.SubmitProposalSV.LecturerDAO;
import com.fyp.model.bean.Proposal;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


public class ViewProposalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LecturerDAO lecturerDAO;

    @Override
    public void init() {
        lecturerDAO = new LecturerDAO();
    }

     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int svId = (int) session.getAttribute("sv_id"); // Retrieve sv_id from session
        
        List<Proposal> proposals = lecturerDAO.selectProposalsBySupervisorId(svId);
        request.setAttribute("listProposals", proposals);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Request-Supervision-Supervisor.jsp");
        dispatcher.forward(request, response);
    }
}
