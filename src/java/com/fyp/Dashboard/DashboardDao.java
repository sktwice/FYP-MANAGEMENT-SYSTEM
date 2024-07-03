package com.fyp.Dashboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String COUNT_STUDENTS_SQL = "SELECT COUNT(*) AS total_students FROM student";
    private static final String COUNT_PROJECT_SQL = "SELECT COUNT(*) AS total_project FROM project";
    private static final String COUNT_PASTPROJECT_SQL = "SELECT COUNT(*) AS total_past FROM past_project";
    private static final String COUNT_SCOPE_SQL = "SELECT COUNT(*) AS total_scope FROM scope";
    private static final String COUNT_LECTURER_SQL = "SELECT COUNT(*) AS total_lecturer FROM teach";
    private static final String COUNT_EXAMINER_SQL = "SELECT COUNT(*) AS total_examiner FROM lecturer WHERE position = 'Examiner' OR position = 'examiner'";
    private static final String COUNT_SUPERVISOR_SQL = "SELECT COUNT(*) AS total_supervisor FROM lecturer WHERE position = 'Supervisor' OR position = 'supervisor'";

    public int getTotalStudents() {
        int totalStudents = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_STUDENTS_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalStudents = rs.getInt("total_students");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalStudents;
    }
    public int getTotalProject() {
        int totalProject = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_PROJECT_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalProject = rs.getInt("total_project");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalProject;
    }
    
    public int getTotalPastProject() {
        int totalPastProject = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_PASTPROJECT_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalPastProject = rs.getInt("total_past");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalPastProject;
    }
    
    public int getTotalScope() {
        int totalScope = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_SCOPE_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalScope = rs.getInt("total_scope");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalScope;
    }
    
    public int getTotalLecturer() {
        int totalLecturer = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_LECTURER_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalLecturer = rs.getInt("total_lecturer");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalLecturer;
    }
    
    public int getTotalExaminer() {
        int totalExaminer = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_EXAMINER_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalExaminer = rs.getInt("total_examiner");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalExaminer;
    }
    
    public int getTotalSupervisor() {
        int totalSupervisor = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_SUPERVISOR_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                totalSupervisor = rs.getInt("total_supervisor");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalSupervisor;
    }
    
}
