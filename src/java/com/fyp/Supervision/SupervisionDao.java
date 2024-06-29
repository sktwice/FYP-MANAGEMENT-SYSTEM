package com.fyp.Supervision;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupervisionDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_SUPERVISIONS = 
        "SELECT p.pro_title, f.student_id, s.s_name, l1.l_name AS supervisor, l2.l_name AS examiner " +
        "FROM formTeach f " +
        "JOIN project p ON f.pro_ID = p.pro_ID " +
        "LEFT JOIN student s ON f.student_id = s.student_id " +
        "LEFT JOIN supervisor sv ON f.sv_id = sv.sv_id " +
        "LEFT JOIN lecturer l1 ON sv.l_id = l1.l_id " +
        "LEFT JOIN examiner ex ON f.ex_id = ex.ex_id " +
        "LEFT JOIN lecturer l2 ON ex.l_id = l2.l_id;";

    // Inner class representing Supervision data
    public static class Supervision {
        private String proTitle;
        private String studentId;
        private String studentName;
        private String supervisorName;
        private String examinerName;

        public Supervision(String proTitle, String studentId, String studentName, String supervisorName, String examinerName) {
            this.proTitle = proTitle;
            this.studentId = studentId;
            this.studentName = studentName;
            this.supervisorName = supervisorName;
            this.examinerName = examinerName;
        }

        // Getters and setters
        public String getProTitle() {
            return proTitle;
        }

        public void setProTitle(String proTitle) {
            this.proTitle = proTitle;
        }

        public String getStudentId() {
            return studentId;
        }

        public void setStudentId(String studentId) {
            this.studentId = studentId;
        }

        public String getStudentName() {
            return studentName;
        }

        public void setStudentName(String studentName) {
            this.studentName = studentName;
        }

        public String getSupervisorName() {
            return supervisorName;
        }

        public void setSupervisorName(String supervisorName) {
            this.supervisorName = supervisorName;
        }

        public String getExaminerName() {
            return examinerName;
        }

        public void setExaminerName(String examinerName) {
            this.examinerName = examinerName;
        }
    }

    // Method to retrieve all supervisions
    public List<Supervision> getAllSupervisions() {
        List<Supervision> supervisions = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUPERVISIONS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String proTitle = rs.getString("pro_title");
                String studentId = rs.getString("student_id");
                String studentName = rs.getString("s_name");
                String supervisorName = rs.getString("supervisor");
                String examinerName = rs.getString("examiner");

                Supervision supervision = new Supervision(proTitle, studentId, studentName, supervisorName, examinerName);
                supervisions.add(supervision);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supervisions;
    }
}
