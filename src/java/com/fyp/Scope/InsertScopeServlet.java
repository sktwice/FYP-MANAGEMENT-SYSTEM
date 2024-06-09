package com.fyp.Scope;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.fyp.model.bean.Scope;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsertScopeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddScopeDAO addScopeDAO;
    

    public void init() {
        addScopeDAO = new AddScopeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     {    
    }
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
         Integer adminId = (Integer) session.getAttribute("admin_id");
        
          if (adminId == null) {
            response.sendRedirect("ListScopeServlet");
            return;
        }
          
        try {
        
        int lId = Integer.parseInt(request.getParameter("lId"));
        String scopeName = request.getParameter("scopeName");
        String program = request.getParameter("program");
        String sessions = request.getParameter("session");
        
        int generatescopeid = addScopeDAO.generateId();

        Scope scope = new Scope(generatescopeid, adminId, lId, scopeName, program, sessions);

        
            addScopeDAO.insertScope(scope);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ListScopeServlet"); // Redirect to the scope list page or another page
    }
}
