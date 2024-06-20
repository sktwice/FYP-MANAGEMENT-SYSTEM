package com.fyp.Form;

import com.fyp.Form.Form5Dao;
import com.fyp.model.bean.Project;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


public class SupervisorViewServlet extends HttpServlet {
    private Form5Dao form5Dao;

    public void init() {
        form5Dao = new Form5Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int lecturerId = (int) session.getAttribute("lecturer_id"); // Assuming lecturer_id is stored in session

        List<Project> projects = form5Dao.getProjectsByLecturerIdWithForm5(lecturerId);

        request.setAttribute("projects", projects);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Supervisor/SupervisorView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
