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
import com.fyp.model.bean.Form8;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form8Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            String handoverDate = request.getParameter("handoverDate");
            int proBackground = Integer.parseInt(request.getParameter("proBackground"));
            int objective = Integer.parseInt(request.getParameter("objective"));
            int significance = Integer.parseInt(request.getParameter("significance"));
            int literature = Integer.parseInt(request.getParameter("literature"));
            int proMethodology = Integer.parseInt(request.getParameter("proMethodology"));
            int presentReport = Integer.parseInt(request.getParameter("presentReport"));
            int progressEvaluate = Integer.parseInt(request.getParameter("progressEvaluate"));
            int total = Integer.parseInt(request.getParameter("total"));
            String comment = request.getParameter("comment");
            String name = request.getParameter("name");
            String termSv = request.getParameter("termSv");
            String dateTSv = request.getParameter("dateTSv");
            
            Form8 form8 = new Form8(formId, studentId, lId, proId, handoverDate, proBackground, objective, significance, literature, proMethodology, presentReport, progressEvaluate, total, comment, name, termSv, dateTSv);
            FormDAO dao = new FormDAO();
            dao.insertForm8(form8);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form8Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
