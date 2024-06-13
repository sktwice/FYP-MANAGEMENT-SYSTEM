/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.io.InputStream;
import java.io.OutputStream;


public class DownloadServlet extends HttpServlet {
    private PdfFileDao pdfFileDao = new PdfFileDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proposalId = Integer.parseInt(request.getParameter("proposalId"));
        Proposal proposal = pdfFileDao.getProposal(proposalId);
        String filePath = getServletContext().getRealPath("") + File.separator + proposal.getPdfUrl();

        // Set content type
        response.setContentType("application/pdf");

        // Set header for downloading the file
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", proposal.getPdfName());
        response.setHeader(headerKey, headerValue);

        // Copy file content to response output stream
        try (InputStream inputStream = new FileInputStream(filePath);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
