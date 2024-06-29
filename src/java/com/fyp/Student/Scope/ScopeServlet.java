package com.fyp.Student.Scope;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Scope;
import com.fyp.Student.Scope.ScopeDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ScopeServlet")
public class ScopeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ScopeDao dao = new ScopeDao();
        List<Scope> scopes = dao.getScopes();
        Map<Integer, Integer> scopeStudentCount = null;
        try {
            scopeStudentCount = dao.getScopeStudentCount();
        } catch (SQLException ex) {
            Logger.getLogger(ScopeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("scopes", scopes);
        request.setAttribute("scopeStudentCount", scopeStudentCount);
        request.getRequestDispatcher("Scope-Student.jsp").forward(request, response);
    }
}
