package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Proposal;
import com.fyp.model.bean.Scope;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

@MultipartConfig
public class ProposalSvServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProposalSvDAO proposalSvDAO = new ProposalSvDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("../LoginID.jsp"); // Redirect to login if session is invalid
            return;
        }

        int studentId = (int) session.getAttribute("student_id");
        try {
            int lecturerId = Integer.parseInt(request.getParameter("lecturerId"));
            int scopeId = Integer.parseInt(request.getParameter("scopeId"));
            String topic = request.getParameter("topic");
            String semester = request.getParameter("semester");
            int svId = Integer.parseInt(request.getParameter("svId")); // Retrieve sv_id

            Part filePart = request.getPart("pdfFile");
            String fileName = studentId + ".pdf"; // Rename the file using the student ID

            // Generate a random proposal ID
            Random rand = new Random();
            int proposalId = rand.nextInt(1000000);

            // Specify the directory to save the files
            String uploadPath = getServletContext().getRealPath("") + File.separator + "pdf" + File.separator + "proposalSV";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save the file
            String filePath = uploadPath + File.separator + fileName;
            try (InputStream inputStream = filePart.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(new File(filePath))) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            }

            String pdfUrl = "pdf/proposalSV/" + fileName;
            String pdfName = fileName;
            String status = "pending";
            String domain = request.getParameter("domain");

            Proposal proposal = new Proposal(proposalId, studentId, svId, scopeId, topic, semester, pdfUrl, pdfName, status, domain);
            proposalSvDAO.insertProposal(proposal);

            System.out.println("Proposal inserted successfully.");
            response.sendRedirect("Students/Dashboard.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve list of scopes
            List<Scope> scopeList = proposalSvDAO.getAllScopes();
            request.setAttribute("scopeList", scopeList);

            // Forward request to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Students/Submit-Proposal-SV.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving data", e);
        }
    }
}
