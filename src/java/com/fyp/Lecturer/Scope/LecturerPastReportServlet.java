/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.Lecturer.Scope;

import com.fyp.model.bean.PastProject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fyp.Admin.PastReport.AddPastReportDAO;
import com.fyp.model.bean.PastProject;
import jakarta.servlet.RequestDispatcher;
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
import java.util.List;

@MultipartConfig
public class LecturerPastReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private  AddPastReportDAO rpDAO;

    public void init() {
        rpDAO = new AddPastReportDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {
         HttpSession session = request.getSession();
//         int lId = (Integer) session.getAttribute("t_id");
//         System.out.println("Lecturer ID in session: " + lId);
        
        try {
            
  
            int proId = rpDAO.generateId();
            int lId = Integer.parseInt(request.getParameter("l_id"));
            int adminId = Integer.parseInt(request.getParameter("admin_id"));
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
            String fileName = studentId + ".pdf";
            System.out.println("fileName: " + fileName);

            // Specify the directory to save the files
            String uploadPath = getServletContext().getRealPath("") + File.separator + "pdf" + File.separator + "pastReport";
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

            String proPdf = "pdf/pastReport/" + fileName; // Update this to your actual URL path
            
            PastProject pastReport = new PastProject(proId, lId, adminId, studentName, studentId, proTitle, session1, proPdf);

            rpDAO.addPastReport(pastReport);
            
            response.sendRedirect("ListPastReport");

            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException, ServletException {

        try{
         listReport(request, response);
                    
        }catch(SQLException e){
        e.printStackTrace();
        }
        

}
    
private void listReport(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
    List<PastProject> listPastReport =  rpDAO.listPastReports();
    request.setAttribute("listPastReport", listPastReport );
    RequestDispatcher dispatcher = request.getRequestDispatcher("Lecturers/Report-Lecturer.jsp");
    dispatcher.forward(request, response);
}
}