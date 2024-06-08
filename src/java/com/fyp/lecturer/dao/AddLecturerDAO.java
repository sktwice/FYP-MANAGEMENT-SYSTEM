package com.fyp.lecturer.dao;

import java.util.Random;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Faculty;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AddLecturerDAO {
    
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

    public int generateId() {
        Random random = new Random();
        return 1 + random.nextInt(10000); // Generates a random digit number
    }

public List<Faculty> listFaculty() throws SQLException {
    List<Faculty> listFaculty = new ArrayList<>();
    String sql = "SELECT * FROM faculty";
    connect();

    try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {

        while (resultSet.next()) {
            int f_id = resultSet.getInt("f_id");
            String f_name = resultSet.getString("f_name");
            String f_course = resultSet.getString("f_course");

            Faculty f = new Faculty(f_id, f_name, f_course);
            listFaculty.add(f);
        }
    } finally {
        disconnect();
    }
    
    return listFaculty;
}


    public Faculty getFacultyById(int fId) throws SQLException {
        String sqlFaculty = "SELECT * FROM faculty WHERE f_id = ?";
        Faculty f = null;
        connect();
        try (PreparedStatement statementFaculty = jdbcConnection.prepareStatement(sqlFaculty)) {
            statementFaculty.setInt(1, fId);
            ResultSet resultSet = statementFaculty.executeQuery();

            if (resultSet.next()) {
                String fName = resultSet.getString("f_name");
                String fCourse = resultSet.getString("f_course");
                f = new Faculty(fId, fName, fCourse);
            }
        } finally {
            disconnect();
        }
        return f;
    }
    
    
    public List<String> courseList() throws SQLException {
    List<String> listCourses = new ArrayList<>();
    String sql = "SELECT f_course FROM faculty"; 
    connect();

    try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {

        while (resultSet.next()) {
            String l_course = resultSet.getString("f_course");
            listCourses.add(l_course );
        }
    } finally {
        disconnect();
    }
    return listCourses;
}

    public void registerLecturer(Login log, Faculty f, Lecturer user) throws SQLException {
        String sqlLogin = "INSERT INTO login (login_id, username, password, category) VALUES (?, ?, ?, ?)";
        String sqlLecturer = "INSERT INTO lecturer (l_id, f_id, login_id, admin_id, position, l_image, l_name, phone_num, email, l_course) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        connect();
        try {
            jdbcConnection.setAutoCommit(false);

            // Insert into login table
            PreparedStatement statementLogin = jdbcConnection.prepareStatement(sqlLogin);
            statementLogin.setInt(1, log.getLoginId());
            statementLogin.setString(2, log.getUsername());
            statementLogin.setString(3, log.getPassword());
            statementLogin.setString(4, log.getCategory());
            statementLogin.executeUpdate();

            // Insert into lecturer table
            PreparedStatement statementLecturer = jdbcConnection.prepareStatement(sqlLecturer);
            statementLecturer.setInt(1, user.getlId());
            statementLecturer.setInt(2, user.getfId());
            statementLecturer.setInt(3, user.getLoginId());
            statementLecturer.setInt(4, user.getAdminId());
            statementLecturer.setString(5, user.getPosition());
            statementLecturer.setString(6, user.getiImage());
            statementLecturer.setString(7, user.getlName());
            statementLecturer.setInt(8, user.getPhoneNum());
            statementLecturer.setString(9, user.getEmail());
            statementLecturer.setString(10, user.getsCourse());
            statementLecturer.executeUpdate();

            jdbcConnection.commit();
        } catch (SQLException ex) {
            jdbcConnection.rollback();
            throw new SQLException(ex);
        } finally {
            jdbcConnection.setAutoCommit(true);
            disconnect();
        }
    }
}
