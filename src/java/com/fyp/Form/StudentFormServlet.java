package com.fyp.Form;

import com.fyp.Form.Form5Dao;
import com.fyp.model.bean.Form5;
import com.fyp.model.bean.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class StudentFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Form5Dao formDAO;

    @Override
    public void init() {
        formDAO = new Form5Dao();
    }
    private int generateFormId() {
        Random random = new Random();
        return random.nextInt(10000) + 1; // Generates a random number between 1 and 10000
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("../LoginID.jsp"); // Redirect to login if session is invalid
            return;
        }

        int studentId = (int) session.getAttribute("student_id");
        System.out.println("DEBUG: Student ID: " + studentId); // Debug statement to print student_id

        List<Form5> forms = formDAO.getFormsByStudentId(studentId);
        if (forms.isEmpty()) {
            request.setAttribute("message", "No forms found for the student ID: " + studentId);
        } else {
            List<Form5> form5List = new ArrayList<>();
            for (Form5 form : forms) {
                form5List.addAll(formDAO.getForm5ByFormId(form.getFormId()));
            }
            request.setAttribute("form5List", form5List);
        }
        request.getRequestDispatcher("Students/Form-Student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("../LoginID.jsp"); // Redirect to login if session is invalid
            return;
        }

        String action = request.getParameter("action");

        if (action != null && action.equals("addForm5")) {
    int studentId = (int) session.getAttribute("student_id");
    
    int formId = generateFormId();

    // Retrieve Project details based on studentId
    Project project = formDAO.getProjectByStudentId(studentId);
    if (project == null) {
        // Handle case where project details are not found
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Project details not found for student ID: " + studentId);
        return;
    }

    // Use retrieved values from project to create Form5 entry
    int lId = project.getSvId();
    int proId = project.getProId();

    // Read data from the modal form
    String dateMeet = request.getParameter("dateMeet");
    String completeActivity = request.getParameter("completeActivity");

    // Create Form5 object and insert into database
    Form5 form5 = new Form5(formId, dateMeet, completeActivity, null, null, proId);
    formDAO.insertForm5(form5);

    // Redirect back to doGet to refresh the page with updated data
    response.sendRedirect(request.getContextPath() + "/Form5Servlet");
}
    }
}
