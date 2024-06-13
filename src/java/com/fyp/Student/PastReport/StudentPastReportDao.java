package com.fyp.Student.PastReport;

import com.fyp.model.bean.PastProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentPastReportDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_PAST_PROJECTS = "SELECT * FROM past_project";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<PastProject> getPastProjects() {
        List<PastProject> pastProjects = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PAST_PROJECTS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int proId = rs.getInt("pro_ID");
                int lId = rs.getInt("l_id");
                int adminId = rs.getInt("admin_id");
                String studentName = rs.getString("student_name");
                int studentId = rs.getInt("student_id");
                String proTitle = rs.getString("pro_title");
                String session = rs.getString("session");
                String proPdf = rs.getString("pro_pdf");

                pastProjects.add(new PastProject(proId, lId, adminId, studentName, studentId, proTitle, session, proPdf));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pastProjects;
    }
}
