/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Scope;

import com.fyp.model.bean.Scope;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Acer
 */
public class ListScopeServlet extends HttpServlet {

        

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
        request.setAttribute("listScope", listScope);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Scope-Admin.jsp");
        dispatcher.forward(request, response);
    }




}
