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
import com.fyp.model.bean.Form4;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form4Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int formId = Integer.parseInt(request.getParameter("formId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int lId = Integer.parseInt(request.getParameter("lId"));
            int proId = Integer.parseInt(request.getParameter("proId"));
            int design = Integer.parseInt(request.getParameter("design"));
            int description = Integer.parseInt(request.getParameter("description"));
            int model = Integer.parseInt(request.getParameter("model"));
            int total = Integer.parseInt(request.getParameter("total"));
            String approval = request.getParameter("approval");
            String dateApprove = request.getParameter("dateApprove");
            
            Form4 form4 = new Form4(formId, studentId, lId, proId, design, description, model, total, approval, dateApprove);
            FormDAO dao = new FormDAO();
            dao.insertForm4(form4);
            
            response.sendRedirect("success.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Form4Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
