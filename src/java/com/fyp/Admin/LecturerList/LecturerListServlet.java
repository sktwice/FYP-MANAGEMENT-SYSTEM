package com.fyp.Admin.LecturerList;

import com.fyp.model.bean.Faculty;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Role;
import com.fyp.Admin.LecturerList.LecturerListDAO;
import com.fyp.Admin.LecturerList.AddLecturerDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class LecturerListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;
    private AddLecturerDAO addLecturerDAO;

    @Override
    public void init() {
        lecturerDAO = new LecturerListDAO();
        addLecturerDAO = new AddLecturerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            // List all lecturers
            List<Lecturer> lecturerList = lecturerDAO.selectAllLecturers();
            Map<Integer, List<Role>> roles = lecturerDAO.selectAllRoles().stream()
                .collect(Collectors.groupingBy(Role::getlId));

            for (Lecturer lecturer : lecturerList) {
                List<Role> lecturerRoles = roles.get(lecturer.getlId());
                if (lecturerRoles != null && !lecturerRoles.isEmpty()) {
                    String positions = lecturerRoles.stream()
                        .map(Role::getPosition)
                        .collect(Collectors.joining(", "));
                    lecturer.setPositions(positions);
                } else {
                    lecturer.setPositions("N/A");
                }
            }

            // Set attributes for the lecturer list
            request.setAttribute("lecturerList", lecturerList);

            // List all faculties and courses
            List<Faculty> facultyList = addLecturerDAO.listFaculty();
            List<Lecturer> lecturers = lecturerDAO.selectAllLecturers();
            List<String> courseList = addLecturerDAO.courseList();
            List<LecturerListDAO.LecturerRole> teaching = lecturerDAO.teachingLecturer();
            List<LecturerListDAO.LecturerRole> supervisor = lecturerDAO.supervisorLecturer();
            List<LecturerListDAO.LecturerRole> examiner = lecturerDAO.examinerLecturer();
            request.setAttribute("lecturers", lecturers);
            request.setAttribute("facultyList", facultyList);
            request.setAttribute("courseList", courseList);
            request.setAttribute("teaching", teaching);
            request.setAttribute("supervisor", supervisor);
            request.setAttribute("examiner", examiner);

            // Forward to the list page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/ListOfLecturer.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();  // Consider logging this exception
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
