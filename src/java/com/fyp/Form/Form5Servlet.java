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
import com.fyp.model.bean.Form5;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form5Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            String dateMeet = request.getParameter("dateMeet");
            String completeActivity = request.getParameter("completeActivity");
            String nextActivity = request.getParameter("nextActivity");
            String approval = request.getParameter("approval");
            
            Form5 form5 = new Form5(formId, studentId, lId, proId, dateMeet, completeActivity, nextActivity, approval);
            FormDAO dao = new FormDAO();
            dao.insertForm5(form5);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form5Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
