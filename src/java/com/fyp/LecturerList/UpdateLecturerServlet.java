package com.fyp.LecturerList;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Lecturer;


public class UpdateLecturerServlet extends HttpServlet {

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
                     updateLecturer(request, response);
                     
        }catch(SQLException e){
        e.printStackTrace();
        }
        

}




private void updateLecturer(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
    int lId = Integer.parseInt(request.getParameter("id"));
    String email = request.getParameter("email");
    
    Lecturer existingLecturer = lecturerDAO.selectLecturer(lId);
    System.out.println("Existing Lecturer: " + existingLecturer);

    if (existingLecturer != null) {
        
        String lName = request.getParameter("lName");
        String position = request.getParameter("position");
        int fId = existingLecturer.getfId();

        Lecturer lecturer = new Lecturer(lId, fId, existingLecturer.getLoginId(), existingLecturer.getAdminId(), position, existingLecturer.getiImage(), lName, existingLecturer.getPhoneNum(), email, existingLecturer.getsCourse());

        lecturerDAO.updateLecturer(lecturer);
        response.sendRedirect("LecturerListServlet");
        
    } else {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Lecturer not found");
    }
    
    
}

}
