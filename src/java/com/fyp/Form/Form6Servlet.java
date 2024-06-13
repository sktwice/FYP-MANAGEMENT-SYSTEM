/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Form;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fyp.model.bean.Form6;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form6Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            String submitDate = request.getParameter("submitDate");
            String stuApproval = request.getParameter("stuApproval");
            int similarityIndex = Integer.parseInt(request.getParameter("similarityIndex"));
            String svApproval = request.getParameter("svApproval");
            String svDate = request.getParameter("svDate");
            String dateApprove = request.getParameter("dateApprove");
            
            Form6 form6 = new Form6(formId, studentId, lId, proId, submitDate, stuApproval, similarityIndex, svApproval, svDate, dateApprove);
            FormDAO dao = new FormDAO();
            dao.insertForm6(form6);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form6Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
