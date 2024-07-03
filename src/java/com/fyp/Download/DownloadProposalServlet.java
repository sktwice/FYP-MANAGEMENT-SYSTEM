package com.fyp.Download;

import com.fyp.Supervisor.RequestSv.PdfFileDao;
import com.fyp.model.bean.Proposal;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

public class DownloadProposalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PdfFileDao pdfFileDao;

    @Override
    public void init() {
        pdfFileDao = new PdfFileDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int proposalId = Integer.parseInt(request.getParameter("proposalId"));

        Proposal proposal = pdfFileDao.getProposal(proposalId);
        if (proposal != null) {
            String filePath = getServletContext().getRealPath("") + File.separator + proposal.getPdfUrl();
            File downloadFile = new File(filePath);
            
            if (downloadFile.exists()) {
                response.setContentType("application/pdf");
                response.setContentLength((int) downloadFile.length());
                response.setHeader("Content-Disposition", "attachment; filename=\"" + proposal.getPdfName() + "\"");
                
                try (FileInputStream inStream = new FileInputStream(downloadFile);
                        OutputStream outStream = response.getOutputStream()) {
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.getWriter().println("File not found for the id: " + proposalId);
            }
        } else {
            response.getWriter().println("No proposal found for the id: " + proposalId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "DownloadProposalServlet";
    }
}
