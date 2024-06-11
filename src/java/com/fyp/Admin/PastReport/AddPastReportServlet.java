package com.fyp.Admin.PastReport;

import com.fyp.model.bean.PastProject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@MultipartConfig
public class AddPastReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddPastReportDAO PR;

    public void init() {
        PR = new AddPastReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests here if needed
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session = request.getSession();
         Integer adminId = (Integer) session.getAttribute("admin_id");
         System.out.println("Admin ID in session: " + adminId);
          if (adminId == null) {
            response.sendRedirect("RegisterLecturerServlet");
            return;
        }
        
        try {
            
  
            int proId = PR.generateId();
            
            int lId = Integer.parseInt(request.getParameter("l_id"));
            String studentName = request.getParameter("stu_name");
            int studentId = Integer.parseInt(request.getParameter("student_id"));
            String proTitle = request.getParameter("pro_title");
            String session1 = request.getParameter("session");

            // Debugging log statements
            System.out.println("proId: " + proId);
            System.out.println("lId: " + lId);
            System.out.println("adminId: " + adminId);
            System.out.println("studentName: " + studentName);
            System.out.println("studentId: " + studentId);
            System.out.println("proTitle: " + proTitle);
            System.out.println("session: " + session1);

            Part filePart = request.getPart("pdfFile");
            String fileName = filePart.getSubmittedFileName();
            System.out.println("fileName: " + fileName);

            // Specify the directory to save the files
            String uploadPath = getServletContext().getRealPath("") + File.separator + "pdf" + File.separator + "proposalSV";
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

            String proPdf = "pdf/proposalSV/" + fileName; // Update this to your actual URL path
            
            PastProject pastReport = new PastProject(proId, lId, adminId, studentName, studentId, proTitle, session1, proPdf);

            PR.addPastReport(pastReport);
            
            response.sendRedirect("ListPastReport");

            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }
}
