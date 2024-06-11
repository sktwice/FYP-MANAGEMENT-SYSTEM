package com.fyp.model.user;

import com.fyp.model.bean.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

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

 public List<Student> listStudent() throws SQLException {
        List<Student> listStudents = new ArrayList<>();
        String sql = "SELECT * FROM student";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int studentId = resultSet.getInt("student_id");
                int fId = resultSet.getInt("f_id");
                int loginId = resultSet.getInt("login_id");
                int adminId = resultSet.getInt("admin_id");
                String sName = resultSet.getString("s_name");
                int semester = resultSet.getInt("semester");
                String sImage = resultSet.getString("s_image");
                String sCourse = resultSet.getString("s_course");
                int phoneNum = resultSet.getInt("phone_num");

                Student student = new Student(studentId, fId, loginId, adminId, sName, semester, sImage, sCourse, phoneNum);
                listStudents.add(student);
            }
        } finally {
            disconnect();
        }
        
return listStudents;
}
 
}
