package com.fyp.Lecturer.List;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AssignDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
    
    public boolean assignExaminer(int studentId, int examinerId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            conn.setAutoCommit(false);

            // Update project table
            String updateProjectSql = "UPDATE project SET ex_id = ? WHERE student_id = ?";
            stmt = conn.prepareStatement(updateProjectSql);
            stmt.setInt(1, examinerId);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
            stmt.close();

            // Update formTeach table (if needed)
            String updateFormTeachSql = "UPDATE formTeach SET ex_id = ? WHERE student_id = ?";
            stmt = conn.prepareStatement(updateFormTeachSql);
            stmt.setInt(1, examinerId);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
            stmt.close();

            conn.commit();
            success = true;
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    public List<ProjectStudent> listProjectsWithoutExaminer() throws SQLException {
        List<ProjectStudent> projectStudents = new ArrayList<>();
        String sql = "SELECT s.student_id, s.s_name, p.pro_title FROM student s JOIN project p ON s.student_id = p.student_id WHERE p.ex_id IS NULL";
        
        connect();
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            int studentId = resultSet.getInt("student_id");
            String studentName = resultSet.getString("s_name");
            String projectTitle = resultSet.getString("pro_title");

            ProjectStudent projectStudent = new ProjectStudent(studentId, studentName, projectTitle);
            projectStudents.add(projectStudent);
        }
        
        resultSet.close();
        statement.close();
        
        disconnect();
        
        return projectStudents;
    }

    public List<Examiner> listExaminers() throws SQLException {
        List<Examiner> examiners = new ArrayList<>();
        String sql = "SELECT e.ex_id, l.l_name FROM examiner e JOIN lecturer l ON e.l_id = l.l_id";
        
        connect();
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            int exId = resultSet.getInt("ex_id");
            String lName = resultSet.getString("l_name");

            Examiner examiner = new Examiner(exId, lName);
            examiners.add(examiner);
        }
        
        resultSet.close();
        statement.close();
        
        disconnect();
        
        return examiners;
    }

    public static class ProjectStudent {
        private int studentId;
        private String studentName;
        private String projectTitle;

        public ProjectStudent(int studentId, String studentName, String projectTitle) {
            this.studentId = studentId;
            this.studentName = studentName;
            this.projectTitle = projectTitle;
        }

        // Getters and setters
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
    }

    public static class Examiner {
        private int exId;
        private String lName;

        public Examiner(int exId, String lName) {
            this.exId = exId;
            this.lName = lName;
        }

        // Getters and setters
        public int getExId() {
            return exId;
        }

        public void setExId(int exId) {
            this.exId = exId;
        }

        public String getLName() {
            return lName;
        }

        public void setLName(String lName) {
            this.lName = lName;
        }
    }
}
