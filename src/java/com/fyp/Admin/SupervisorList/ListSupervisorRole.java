package com.fyp.Admin.SupervisorList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListSupervisorRole extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SupervisorListDao SVDAO;

    public ListSupervisorRole() {
        this.SVDAO = new SupervisorListDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            
            List<SupervisorListDao.Supervisor> listSupervisors = SVDAO.listSupervisors();
            request.setAttribute("listSupervisors", listSupervisors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Examiner-List.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}