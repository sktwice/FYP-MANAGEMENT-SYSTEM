/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Supervisor.ScopeSV;

import com.fyp.Admin.Scope.AddScopeDAO;
import com.fyp.model.bean.Scope;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


public class InsertScopeSupervisorServlet extends HttpServlet {

 private static final long serialVersionUID = 1L;
    private AddScopeDAO addScopeDAO;
    

    public void init() {
        addScopeDAO = new AddScopeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    HttpSession session = request.getSession();
          
        try {
         
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        int lId = Integer.parseInt(request.getParameter("lId"));
        String scopeName = request.getParameter("scopeName");
        String program = request.getParameter("program");
        String sessions = request.getParameter("session");
        
        int generatescopeid = addScopeDAO.generateId();

        Scope scope = new Scope(generatescopeid, adminId, lId, scopeName, program, sessions);

        addScopeDAO.insertScope(scope);
        response.sendRedirect("Supervisor/ScopeSvServlet");
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
    }
}

