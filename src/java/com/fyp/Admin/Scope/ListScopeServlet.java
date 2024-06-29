package com.fyp.Admin.Scope;

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

public class ListScopeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AddScopeDAO scopeDAO;

    public void init() {
        scopeDAO = new AddScopeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        try {
            listScope(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listScope(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Scope> listScope = scopeDAO.getAllScopes();
        Map<Integer, Integer> scopeStudentCount = scopeDAO.getScopeStudentCount();

        request.setAttribute("listScope", listScope);
        request.setAttribute("scopeStudentCount", scopeStudentCount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Scope-Admin.jsp");
        dispatcher.forward(request, response);
    }
}
