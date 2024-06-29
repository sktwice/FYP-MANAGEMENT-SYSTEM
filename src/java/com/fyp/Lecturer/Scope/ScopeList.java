/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Scope;


import com.fyp.model.bean.Scope;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.fyp.Admin.Scope.AddScopeDAO;
import com.fyp.model.bean.Scope;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Acer
 */
public class ScopeList extends HttpServlet {

        

 private static final long serialVersionUID = 1L;
    private AddScopeDAO ScopeDAO;

    public void init() {
        ScopeDAO = new AddScopeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
     
        try{
          listScope(request, response);
                 
        }catch(SQLException e){
        e.printStackTrace();
        }
        
}
    private void listScope(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Scope> listScope = ScopeDAO.getAllScopes();
        Map<Integer, Integer> scopeStudentCount = ScopeDAO.getScopeStudentCount();
        request.setAttribute("scopeStudentCount", scopeStudentCount);
        request.setAttribute("listScope", listScope);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturers/Scope-Lecturer.jsp");
        dispatcher.forward(request, response);
    }




}
