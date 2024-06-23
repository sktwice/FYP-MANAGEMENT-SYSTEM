package com.fyp.Admin.LecturerList;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Faculty;
import com.fyp.Admin.LecturerList.AddLecturerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig // Added annotation to handle file uploads
public class AddLecturerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddLecturerDAO AL;

    @Override
    public void init() {
        AL = new AddLecturerDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Faculty> facultyList = AL.listFaculty();
            List<String> courseList = AL.courseList();
            request.setAttribute("facultyList", facultyList);
            request.setAttribute("courseList", courseList);
            request.getRequestDispatcher("/Admin/Add-Lecturer.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer adminId = (Integer) session.getAttribute("admin_id");
        if (adminId == null) {
            response.sendRedirect("RegisterLecturerServlet");
            return;
        }

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String position = request.getParameter("position");

            String l_name = request.getParameter("l_name");
            int phone_num = Integer.parseInt(request.getParameter("phone_num"));
            String email = request.getParameter("email");
            int f_id = Integer.parseInt(request.getParameter("f_id"));
            String l_course = request.getParameter("l_course");

            // Generate a single ID and use it for both login_id and l_id
            int generatedId = AL.generateId();

            Login lo = new Login(username, password, "lecturer");
            lo.setLoginId(generatedId); // Set the generated login ID

            Faculty f = AL.getFacultyById(f_id);
            if (f == null) {
                throw new Exception("Faculty not found with ID: " + f_id);
            }

            Part filePart = request.getPart("l_image");
            String fileName = filePart.getSubmittedFileName();

            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = uploadPath + File.separator + fileName;

            try (InputStream inputStream = filePart.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(new File(filePath))) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            }

            Lecturer l = new Lecturer(generatedId, f_id, generatedId, adminId, position, filePath, l_name, phone_num, email, l_course);

            // Check if "teachesCsp600" checkbox is checked
            String teachesCsp600 = request.getParameter("teaches_csp600");

            // Pass position and teachesCsp600 to registerLecturer method
            AL.registerLecturer(lo, f, l, position, teachesCsp600);

            response.sendRedirect("LecturerListServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e); // Propagate the exception properly
        }
    }
}
