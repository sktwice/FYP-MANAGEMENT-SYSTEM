/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Supervisor.RequestSv;

import com.fyp.Supervisor.RequestSv.PdfFileDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


public class AcceptProposalServlet extends HttpServlet {
    private PdfFileDao pdfFileDao = new PdfFileDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proposalId = Integer.parseInt(request.getParameter("proposalId"));
        try {
            pdfFileDao.acceptProposal(proposalId);
            response.sendRedirect("Supervisor/ViewProposalServlet"); // Redirect to the proposals page
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error accepting proposal", e);
        }
    }
}
