package com.fyp.Form;

import com.fyp.model.bean.Form5;
import com.fyp.Form.Form5Dao;
import com.fyp.model.bean.Form;
import com.fyp.model.bean.FormTeach;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class SupervisorProjectDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Form5Dao form5DAO;

    @Override
    public void init() throws ServletException {
        super.init();
        form5DAO = new Form5Dao(); // Initialize your DAO instance
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        int proId = Integer.parseInt(request.getParameter("proId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        List<Form5> forms = form5DAO.getFormsByStudentId(studentId);
        if (forms.isEmpty()) {
            request.setAttribute("message", "No forms found for the student ID: " + studentId);
        } else {
            List<Form5> form5List = new ArrayList<>();
            for (Form5 form : forms) {
                form5List.addAll(form5DAO.getForm5ByFormId(form.getFormId()));
            }
            request.setAttribute("form5List", form5List);
        }
        request.getRequestDispatcher("Supervisor/F5.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to doPost method for handling post requests
        doPost(request, response);
    }
}
