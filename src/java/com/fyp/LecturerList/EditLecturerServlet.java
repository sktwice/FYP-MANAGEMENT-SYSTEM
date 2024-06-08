package com.fyp.LecturerList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Lecturer;

public class EditLecturerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;

    public void init() {
        lecturerDAO = new LecturerListDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {


        try{
                    showEditForm(request, response);
                 
        }catch(SQLException e){
        e.printStackTrace();
        }
        

}
    private void listLecturer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Lecturer> listLecturer = lecturerDAO.selectAllLecturers();
        request.setAttribute("listLecturer", listLecturer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ListOfLecturer.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ListLectureForm.jsp");
        dispatcher.forward(request, response);
    }

private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
    int lId = Integer.parseInt(request.getParameter("id"));
    Lecturer existingLecturer = lecturerDAO.selectLecturer(lId);
    
    // Get the f_id from the existingLecturer
    int fId = existingLecturer.getfId();
    
    // Set f_id attribute in request scope
    request.setAttribute("f_id", fId);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ListLecturerForm.jsp");
    request.setAttribute("lecturer", existingLecturer);
    dispatcher.forward(request, response);
}


}
