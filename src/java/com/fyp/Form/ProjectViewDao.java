package com.fyp.Form;

import com.fyp.model.bean.Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectViewDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_PROJECTS_SQL = "SELECT pro_ID, student_id, l_id, pro_title FROM project";

    public ProjectViewDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PROJECTS_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int proId = rs.getInt("pro_ID");
                int studentId = rs.getInt("student_id");
                int lId = rs.getInt("l_id");
                String proTitle = rs.getString("pro_title");

                Project project = new Project(proId, studentId, lId, proTitle, "", "", "", 0, 0); // Simplified constructor
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
}
