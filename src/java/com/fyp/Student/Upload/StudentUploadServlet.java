package com.fyp.Student.Upload;

import com.fyp.UserProfile.UserDao;
import com.fyp.model.bean.Student;
import jakarta.servlet.RequestDispatcher;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class StudentUploadServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);

        int studentId = (int) session.getAttribute("student_id");
        Student existingStudent = userDao.selectStudent(studentId);
        boolean hasForm6 = userDao.studentHasForm6(studentId);
        boolean hasProject = userDao.studentHasProject(studentId);

        if (existingStudent != null) {
            request.setAttribute("Student", existingStudent);
            request.setAttribute("hasForm6", hasForm6);
            request.setAttribute("hasProject", hasProject);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("Students/Proposal.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the file part from the request
        Part filePart = request.getPart("pdfFile");
        String fileName = filePart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        // Specify the directory to save the files
        String uploadPath = getServletContext().getRealPath("") + File.separator + "pdf" + File.separator + "proposalReport";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the file
        String filePath = uploadPath + File.separator + fileName;
        try (InputStream inputStream = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(new File(filePath))) {
            int read;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        }

        String proPdf = "pdf/proposalReport/" + fileName; // Update this to your actual URL path

        // Assume studentId is stored in session
        HttpSession session = request.getSession(false);

        int studentId = (int) session.getAttribute("student_id");

        // Update the project URL in the database
        StudentUploadDao uploadDao = new StudentUploadDao();
        uploadDao.updateProjectUrl(studentId, proPdf);

        // Redirect to a success page
        response.sendRedirect("StudentUploadServlet");
    }

    @Override
    public String getServletInfo() {
        return "Handles file upload and updates project URL.";
    }
}
