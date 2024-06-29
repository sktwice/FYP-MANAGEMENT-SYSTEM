package com.fyp.Supervision;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SupervisionServlet extends HttpServlet {

    private SupervisionDao supervisionDao;

    public void init() {
        supervisionDao = new SupervisionDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<SupervisionDao.Supervision> listSupervision = supervisionDao.getAllSupervisions();
        request.setAttribute("listSupervision", listSupervision);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturers/StudentList-Supervision.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
