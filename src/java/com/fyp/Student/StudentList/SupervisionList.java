/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Student.StudentList;

import com.fyp.model.user.SupervisionDAO;
import com.fyp.model.bean.Supervision;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;




/**
 *
 * @author Acer
 */
public class SupervisionList extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private SupervisionDAO studentDAO;

    public void init() {
        studentDAO = new SupervisionDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {


        try{
                    listSupervision(request, response);
                    
        }catch(SQLException e){
        e.printStackTrace();
        }
}
    
private void listSupervision(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<Supervision> listSupervision = studentDAO.listSupervision();
    request.setAttribute("listSupervision", listSupervision);
    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/StudentList-Supervision-Admin.jsp");
    dispatcher.forward(request, response);
}

}
