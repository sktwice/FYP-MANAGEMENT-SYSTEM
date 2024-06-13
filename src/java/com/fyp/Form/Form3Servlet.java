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
import com.fyp.Form.FormDAO;
import com.fyp.model.bean.Form3;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form3Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            int relevance = Integer.parseInt(request.getParameter("relevance"));
            int knowledge = Integer.parseInt(request.getParameter("knowledge"));
            int writing = Integer.parseInt(request.getParameter("writing"));
            int total = Integer.parseInt(request.getParameter("total"));
            String approval = request.getParameter("approval");
            String dateApprove = request.getParameter("dateApprove");
            
            Form3 form3 = new Form3(formId, studentId, lId, proId, relevance, knowledge, writing, total, approval, dateApprove);
            FormDAO dao = new FormDAO();
            dao.insertForm3(form3);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form3Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
