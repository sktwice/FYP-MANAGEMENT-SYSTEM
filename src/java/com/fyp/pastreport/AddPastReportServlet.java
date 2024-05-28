/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.pastreport;


import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fyp.pastreport.AddPastReportDAO;

import java.io.IOException;


public class AddPastReportServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          try {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            int stu_id = Integer.parseInt(request.getParameter("student_id"));
            int l_id = Integer.parseInt(request.getParameter("l_id"));
            String pro_title = request.getParameter("pro_title");
            String session = request.getParameter("session");
        
        
        
        
       
    }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }



}
}
