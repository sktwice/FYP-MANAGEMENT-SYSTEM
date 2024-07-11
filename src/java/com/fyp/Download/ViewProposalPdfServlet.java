package com.fyp.Download;

import com.fyp.Admin.PastReport.AddPastReportDAO;
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


public class ViewProposalPdfServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PdfDao PR;

    @Override
    public void init() {
        PR = new PdfDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int proposalId = Integer.parseInt(request.getParameter("proposalId"));

        try {
            String pdfPath = PR.getPdfPathById(proposalId);
            if (pdfPath != null) {
                File pdfFile = new File(getServletContext().getRealPath("") + File.separator + pdfPath);
                if (pdfFile.exists()) {
                    response.setContentType("application/pdf");
                    response.addHeader("Content-Disposition", "inline; filename=" + pdfFile.getName());
                    response.setContentLength((int) pdfFile.length());

                    try (FileInputStream fileInputStream = new FileInputStream(pdfFile);
                         OutputStream responseOutputStream = response.getOutputStream()) {
                        int bytes;
                        while ((bytes = fileInputStream.read()) != -1) {
                            responseOutputStream.write(bytes);
                        }
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
