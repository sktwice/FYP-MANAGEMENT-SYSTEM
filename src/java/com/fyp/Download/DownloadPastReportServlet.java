package com.fyp.Download;

import com.fyp.Admin.PastReport.AddPastReportDAO;
import com.fyp.model.bean.PastProject;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DownloadPastReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddPastReportDAO PR;

    @Override
    public void init() {
        PR = new AddPastReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int proId = Integer.parseInt(request.getParameter("proId"));

        try {
            PastProject pastProject = PR.getPastReportById(proId);

            if (pastProject != null) {
                String filePath = getServletContext().getRealPath("") + File.separator + pastProject.getProPdf();
                File downloadFile = new File(filePath);

                if (downloadFile.exists()) {
                    response.setContentType("application/pdf");
                    response.setContentLength((int) downloadFile.length());
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFile.getName() + "\"");

                    try (FileInputStream inStream = new FileInputStream(downloadFile);
                         OutputStream outStream = response.getOutputStream()) {
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;
                        while ((bytesRead = inStream.read(buffer)) != -1) {
                            outStream.write(buffer, 0, bytesRead);
                        }
                    }
                } else {
                    response.getWriter().println("File not found for the id: " + proId);
                }
            } else {
                response.getWriter().println("No project found for the id: " + proId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving the file: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "DownloadPastReportServlet";
    }
}
