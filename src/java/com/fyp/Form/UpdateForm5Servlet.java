package com.fyp.Form;

import com.fyp.Form.Form5Dao;
import com.fyp.model.bean.Form5;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class UpdateForm5Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Form5Dao form5Dao;

    public void init() {
        form5Dao = new Form5Dao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int formtId = Integer.parseInt(request.getParameter("formId"));
        String nextActivity = request.getParameter("nextActivity");
        String approval = request.getParameter("approval");
        
         System.out.println("Form ID: " + formtId);
    System.out.println("Next Activity: " + nextActivity);
    System.out.println("Approval: " + approval);

        Form5 form5 = new Form5(formtId, null, null, nextActivity, approval);
        form5Dao.updateForm5(form5);

        response.sendRedirect(request.getContextPath() +"/Supervisor/Form-Supervisor.jsp");
    }
}
