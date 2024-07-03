/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Supervisor.Progress;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ProgressDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private Connection jdbcConnection;

    
    private static final String SELECT_REPORTS_SV_SQL ="SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID FROM student s JOIN project p ON s.student_id = p.student_id WHERE p.sv_Id = ?;";
    private static final String SELECT_SV_NAME="select l.l_name from lecturer l join supervisor s on l.l_id=s.l_id where sv_id=?;";
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    
    public List<StudentReport> listAllReportsSV(int svId) throws SQLException {
        List<StudentReport> listReports = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTS_SV_SQL)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                String proId = resultSet.getString("pro_ID");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, proId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
    }
    
    public List<String> getLecturerNamesBySvId(int svId) throws SQLException {
        List<String> lecturerNames = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SV_NAME)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String lecturerName = resultSet.getString("l_name");
                lecturerNames.add(lecturerName);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return lecturerNames;
    }
    

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public class StudentReport {
        private int studentId;
        private String studentName;
        private String projectTitle;
        private String projectUrl;
        private String proId;

        public StudentReport(int studentId, String studentName, String projectTitle, String projectUrl, String proId) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.projectTitle = projectTitle;
            this.projectUrl = projectUrl;
            this.proId = proId;
        }

        // Getters and Setters
        public int getStudentId() {
            return studentId;
        }

        public void setStudentId(int studentId) {
            this.studentId = studentId;
        }

        public String getStudentName() {
            return studentName;
        }

        public void setStudentName(String studentName) {
            this.studentName = studentName;
        }

        public String getProjectTitle() {
            return projectTitle;
        }

        public void setProjectTitle(String projectTitle) {
            this.projectTitle = projectTitle;
        }

        public String getProjectUrl() {
            return projectUrl;
        }

        public void setProjectUrl(String projectUrl) {
            this.projectUrl = projectUrl;
        }

        public String getProId() {
            return proId;
        }

        public void setProId(String proId) {
            this.proId = proId;
        }
        
    }
    
}
