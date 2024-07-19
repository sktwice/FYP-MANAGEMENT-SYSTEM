/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Student.SubmitProposalSV;

import com.fyp.Supervisor.RequestSv.PdfFileDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


public class DeleteForm6Servlet extends HttpServlet {
    private PdfFileDao pdfFileDao = new PdfFileDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int formtId = Integer.parseInt(request.getParameter("formtId"));
        try {
            pdfFileDao.deleteForm6(formtId);
            response.sendRedirect(request.getContextPath() + "/StudentFormServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error deleting proposal", e);
        }
    }
}
