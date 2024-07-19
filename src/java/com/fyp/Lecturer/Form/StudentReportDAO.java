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
    private static final String SELECT_F5_SV ="SELECT student.student_id, student.s_name, project.pro_ID, project.pro_title FROM student JOIN project ON student.student_id = project.student_id WHERE project.sv_id = ?;";
    
    private static final String SELECT_REPORTSF8_LEC_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form8lecturer fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.t_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTSF8_LECF2_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form2 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.t_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTSF8_LECF3_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form3 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.t_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTSF8_LECF4_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form4 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.t_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTS_SV_SQL ="SELECT s.student_id, s.s_name, p.pro_title, f.formt_id FROM student s JOIN project p ON s.student_id = p.student_id JOIN formTeach f ON p.student_id = f.student_id WHERE f.sv_Id = ?;";
    private static final String SELECT_REPORTSF6_SV_SQL =
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form6 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.sv_Id = ? AND fe.similarity_index IS NULL;";
    
    private static final String SELECT_REPORTSF7_SV_SQL =
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form7 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.sv_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTSF8_SV_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form8supervisor fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.sv_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTS_EX_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form7examiner fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.ex_Id = ? AND fe.formt_id IS NULL;";
    
    private static final String SELECT_REPORTSF8_EX_SQL = 
    "SELECT s.student_id, s.s_name, p.pro_title, p.pro_url, p.pro_ID, l.l_name AS supervisor_name, f.formt_id " +
    "FROM student s " +
    "JOIN project p ON s.student_id = p.student_id " +
    "JOIN formTeach f ON p.student_id = f.student_id " +
    "LEFT JOIN form8 fe ON f.formt_id = fe.formt_id " +
    "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
    "JOIN lecturer l ON sv.l_id = l.l_id " +
    "WHERE f.ex_Id = ? AND fe.formt_id IS NULL;";

    
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
    
    public List<StudentReport> listAllF5(int svId) throws SQLException {
        List<StudentReport> listReportsF5 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_F5_SV)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                int proId= resultSet.getInt("pro_ID");
                String projectTitle = resultSet.getString("pro_title");
                

                StudentReport report = new StudentReport(studentId, studentName,proId, projectTitle);
                listReportsF5.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF5;
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
    
    public List<StudentReport> listAllReportsF2Lec(int tId) throws SQLException {
        List<StudentReport> listReports = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_LECF2_SQL)) {
            preparedStatement.setInt(1, tId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
    }
    
    public List<StudentReport> listAllReportsF3Lec(int tId) throws SQLException {
        List<StudentReport> listReportsF3 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_LECF3_SQL)) {
            preparedStatement.setInt(1, tId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF3.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF3;
    }
    
    public List<StudentReport> listAllReportsF4Lec(int tId) throws SQLException {
        List<StudentReport> listReportsF4 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_LECF4_SQL)) {
            preparedStatement.setInt(1, tId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF4.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF4;
    }
    
    public List<StudentReport> listAllReportsF8Lec(int tId) throws SQLException {
        List<StudentReport> listReportsF8 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_LEC_SQL)) {
            preparedStatement.setInt(1, tId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF8.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF8;
    }
    
    public List<StudentReport> listAllReportsF7Sv(int svId) throws SQLException {
        List<StudentReport> listReports = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF7_SV_SQL)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
    }
    
    public List<StudentReport> listAllReportsF6Sv(int svId) throws SQLException {
        List<StudentReport> listReportsF6 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF6_SV_SQL)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF6.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF6;
    }
    
    public List<StudentReport> listAllReportsF8SV(int svId) throws SQLException {
        List<StudentReport> listReportsF8 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_SV_SQL)) {
            preparedStatement.setInt(1, svId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF8.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF8;
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
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReports.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReports;
    }
    
    public List<StudentReport> listAllReportsEXF8(int exId) throws SQLException {
        List<StudentReport> listReportsF8 = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORTSF8_EX_SQL)) {
            preparedStatement.setInt(1, exId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                String studentName = resultSet.getString("s_name");
                String projectTitle = resultSet.getString("pro_title");
                String projectUrl = resultSet.getString("pro_url");
                int proId = resultSet.getInt("pro_ID");
                String supervisorName = resultSet.getString("supervisor_name");
                int formtId = resultSet.getInt("formt_id");

                StudentReport report = new StudentReport(studentId, studentName, projectTitle, projectUrl, supervisorName, proId, formtId);
                listReportsF8.add(report);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listReportsF8;
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
        private String supervisorName;
        private int proId;
        private int formtId;

        public StudentReport(int studentId, String studentName, String projectTitle, int formtId) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.projectTitle = projectTitle;
            this.formtId=formtId;
        }
        
        public StudentReport(int studentId, String studentName,int proId, String projectTitle ){
            this.studentId = studentId;
            this.studentName = studentName;
            this.proId = proId;
            this.projectTitle = projectTitle;
        }

            public StudentReport(int studentId, String studentName, String projectTitle, String projectUrl, String supervisorName,int proId, int formtId) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.projectTitle = projectTitle;
            this.projectUrl = projectUrl;
            this.supervisorName = supervisorName;
            this.proId = proId;
            this.formtId = formtId;
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

        public String getSupervisorName() {
            return supervisorName;
        }

        public void setSupervisorName(String supervisorName) {
            this.supervisorName = supervisorName;
        }

        public int getFormtId() {
            return formtId;
        }

        public void setFormtId(int formtId) {
            this.formtId = formtId;
        }

        public int getProId() {
            return proId;
        }

        public void setProId(int proId) {
            this.proId = proId;
        }
    }
}
