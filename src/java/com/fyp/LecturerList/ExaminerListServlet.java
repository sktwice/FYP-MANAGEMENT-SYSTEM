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
import java.util.stream.Collectors;

public class ExaminerListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ExaminerListDAO examinerDAO;

    @Override
    public void init() {
        examinerDAO = new ExaminerListDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {


        try{
            listExaminer(request, response);
                    
        }catch(SQLException e){
        }
        

}
    
private void listExaminer(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<Lecturer> listExaminer = examinerDAO.selectAllExaminers();
    
    // Filter the list to include only lecturers with lId > 0
    List<Lecturer> filteredList = listExaminer.stream()
            .filter(lecturer -> lecturer.getlId() > 0)
            .collect(Collectors.toList());
    
    request.setAttribute("listExaminer", filteredList);
    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/Examiner-List.jsp");
    dispatcher.forward(request, response);
}

}
