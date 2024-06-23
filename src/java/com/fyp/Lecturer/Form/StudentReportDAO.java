/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Lecturer.Form;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentReportDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private Connection jdbcConnection;

    private static final String SELECT_REPORTS_SQL = "SELECT s.student_id, s.s_name, p.pro_title, ft.formt_id FROM student s JOIN formTeach ft ON s.student_id = ft.student_id JOIN project p ON ft.pro_ID = p.pro_ID WHERE ft.t_id =? ;";
    private static final String SELECT_REPORTS_SV_SQL ="SELECT s.student_id, s.s_name, p.pro_title, f.formt_id FROM student s JOIN project p ON s.student_id = p.student_id JOIN formTeach f ON p.student_id = f.student_id WHERE f.sv_Id = ?;";
    private static final String SELECT_REPORTS_EX_SQL ="SELECT s.student_id, s.s_name, p.pro_title, f.formt_id FROM student s JOIN project p ON s.student_id = p.student_id JOIN formTeach f ON p.student_id = f.student_id WHERE f.ex_Id = ?;";
    
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

    public List<StudentReport> listAllReports(int teacherId) throws SQLException {
        List<StudentReport> listReports = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTS_SQL)) {
            preparedStatement.setInt(1, teacherId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                int formtId= resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
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
                int formtId= resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
    }
    
    public List<StudentReport> listAllReportsEX(int exId) throws SQLException {
        List<StudentReport> listReports = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTS_EX_SQL)) {
            preparedStatement.setInt(1, exId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                int formtId= resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
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
        private int formtId;

        public StudentReport(int studentId, String studentName, String projectTitle, int formtId) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.projectTitle = projectTitle;
            this.formtId=formtId;
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

        public int getFormtId() {
            return formtId;
        }

        public void setFormtId(int formtId) {
            this.formtId = formtId;
        }
    }
}
