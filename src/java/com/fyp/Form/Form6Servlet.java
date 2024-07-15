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
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Form6Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int formtId = Integer.parseInt(request.getParameter("formtId6"));
        int similarityIndex = Integer.parseInt(request.getParameter("index"));
        String svApproval = request.getParameter("approval");
        LocalDate currentDate = LocalDate.now();
        String dateApprove = currentDate.toString();
        Form6 form6 = new Form6(formtId,similarityIndex, svApproval, dateApprove);
        FormDAO dao = new FormDAO();
        dao.updateForm6(form6);
        response.sendRedirect(request.getContextPath()+ "/FormSVServlet");
    }
}
