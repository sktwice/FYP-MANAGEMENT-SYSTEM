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
import com.fyp.model.bean.Form7;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form7Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            String presentDate = request.getParameter("presentDate");
            int knowledge = Integer.parseInt(request.getParameter("knowledge"));
            int overallProject = Integer.parseInt(request.getParameter("overallProject"));
            int presentMaterial = Integer.parseInt(request.getParameter("presentMaterial"));
            int delivery = Integer.parseInt(request.getParameter("delivery"));
            int total = Integer.parseInt(request.getParameter("total"));
            String comment = request.getParameter("comment");
            String name = request.getParameter("name");
            String termSv = request.getParameter("termSv");
            String dateTSv = request.getParameter("dateTSv");
            
            Form7 form7 = new Form7(formId, studentId, lId, proId, presentDate, knowledge, overallProject, presentMaterial, delivery, total, comment, name, termSv, dateTSv);
            FormDAO dao = new FormDAO();
            dao.insertForm7(form7);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form7Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
