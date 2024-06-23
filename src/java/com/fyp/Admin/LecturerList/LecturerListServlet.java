package com.fyp.Admin.LecturerList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Role;

public class LecturerListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LecturerListDAO lecturerDAO;

    public void init() {
        lecturerDAO = new LecturerListDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            listLecturer(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listLecturer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Lecturer> listLecturer = lecturerDAO.selectAllLecturers();
        Map<Integer, List<Role>> roles = lecturerDAO.selectAllRoles().stream()
            .collect(Collectors.groupingBy(Role::getlId));

        for (Lecturer lecturer : listLecturer) {
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

        request.setAttribute("listLecturer", listLecturer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ListOfLecturer.jsp");
        dispatcher.forward(request, response);
    }
}
