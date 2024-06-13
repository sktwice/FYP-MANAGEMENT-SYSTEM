/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Supervisor.ScopeSV;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Scope;
import com.fyp.Student.Scope.ScopeDao;

import java.io.IOException;
import java.util.List;


public class ScopeSvServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScopeDao dao = new ScopeDao();
        List<Scope> scopes = dao.getScopes();

        request.setAttribute("scopes", scopes);
        request.getRequestDispatcher("Scope-Supervisor.jsp").forward(request, response);
    }
}
