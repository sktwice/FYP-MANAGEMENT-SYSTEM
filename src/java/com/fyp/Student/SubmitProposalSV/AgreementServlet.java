package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Project;
import com.fyp.model.bean.Proposal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;


public class AgreementServlet extends HttpServlet {

    private ProposalSvDAO proposalSvDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        proposalSvDAO = new ProposalSvDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate a random proposalId
        Random rand = new Random();
         int proposalId = Integer.parseInt(request.getParameter("proposalId"));

        try {
            // Fetch the proposal details using the generated proposalId
            Proposal proposal = proposalSvDAO.getProposalById(proposalId);

            if (proposal != null) {
                // Generate a unique pro_ID (as integer) for the project using Random
                int proId = rand.nextInt(1000000); // Example range: 0 to 999999
                String pro_url="in progress";
                

                // Create a new project object with null pro_url
                Project project = new Project(
                        proId,
                        proposal.getStudentId(),
                        proposal.getTopic(), // Assuming pro_title is the same as topic
                        proposal.getDomain(),
                        pro_url, // pro_url initially null as per requirement
                        proposal.getSemester(), // Assuming session is the same as semester
                        proposal.getScopeId(),
                        proposal.getProposalId(),
                        proposal.getSvId()
                );

                // Insert into project table
                proposalSvDAO.insertProject(project);

                

                // Redirect to a success page or appropriate destination
                response.sendRedirect("Students/Dashboard.jsp");
            } else {
                // Proposal not found
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
