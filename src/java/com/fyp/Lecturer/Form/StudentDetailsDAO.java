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

public class StudentDetailsDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private static final String QUERY = "SELECT s.s_name AS student_name, s.student_id, s.s_course AS program, " +
            "l.l_name AS supervisor_name, p.pro_title AS project_title " +
            "FROM student s " +
            "JOIN project p ON s.student_id = p.student_id " +
            "JOIN supervisor sv ON p.sv_id = sv.sv_id " +
            "JOIN lecturer l ON sv.l_id = l.l_id " +
            "WHERE s.student_id = ?;";

    public StudentDetails getStudentDetails(int studentId) {
        StudentDetails studentDetails = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = conn.prepareStatement(QUERY)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                studentDetails = new StudentDetails();
                studentDetails.setStudentName(rs.getString("student_name"));
                studentDetails.setStudentId(rs.getInt("student_id"));
                studentDetails.setProgram(rs.getString("program"));
                studentDetails.setSupervisorName(rs.getString("supervisor_name"));
                studentDetails.setProjectTitle(rs.getString("project_title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentDetails;
    }

    public static class StudentDetails {
        private String studentName;
        private int studentId;
        private String program;
        private String supervisorName;
        private String projectTitle;

        // Getters and Setters

        public String getStudentName() {
            return studentName;
        }

        public void setStudentName(String studentName) {
            this.studentName = studentName;
        }

        public int getStudentId() {
            return studentId;
        }

        public void setStudentId(int studentId) {
            this.studentId = studentId;
        }

        public String getProgram() {
            return program;
        }

        public void setProgram(String program) {
            this.program = program;
        }

        public String getSupervisorName() {
            return supervisorName;
        }

        public void setSupervisorName(String supervisorName) {
            this.supervisorName = supervisorName;
        }

        public String getProjectTitle() {
            return projectTitle;
        }

        public void setProjectTitle(String projectTitle) {
            this.projectTitle = projectTitle;
        }
    }
}
