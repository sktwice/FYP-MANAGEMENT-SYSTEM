package com.fyp.Student.Upload;

import com.fyp.UserProfile.UserDao;
import com.fyp.model.bean.Form6;
import com.fyp.model.bean.FormTeach;
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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
public class F6StudentServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            // Assume studentId is stored in session
            HttpSession session = request.getSession(false);
            
            int studentId = (int) session.getAttribute("student_id");
            
            // Retrieve the file part from the request
            StudentUploadDao uploadDao = new StudentUploadDao();
            FormTeach ft=uploadDao.getFormtId(studentId);
            int formtId = ft.getFormTId();
            
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
            
            
            
            // Update the project URL in the database
            
            uploadDao.updateProjectUrl(studentId, proPdf);
            
            String stuApproval = "approved";
            LocalDate currentDate = LocalDate.now();
            String submitDate = currentDate.toString();
            
            Form6 f6 = new Form6(formtId,submitDate,stuApproval);
            uploadDao.insertForm6(f6);
            
            // Redirect to a success page
            response.sendRedirect(request.getContextPath()+ "/StudentFormServlet");
        }   catch (SQLException ex) {
            Logger.getLogger(F6StudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles file upload and updates project URL.";
    }
}
