
package com.fyp.Student.StudentList;

import com.fyp.model.user.StudentDAO;
import com.fyp.model.bean.Student;
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
public class StudentListServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {


        try{
                    listStudent(request, response);
                    
        }catch(SQLException e){
        e.printStackTrace();
        }
}
    
private void listStudent(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<Student> listStudent = studentDAO.listStudent();
    request.setAttribute("listStudent", listStudent);
    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Student-List.jsp");
    dispatcher.forward(request, response);
}

}
