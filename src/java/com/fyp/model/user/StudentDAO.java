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

    public StudentDAO() {}

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                System.out.println("Database connection successful");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println("Database driver not found");
                throw new SQLException(e);
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error connecting to the database");
                throw e;
            }
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    private static final String SELECT_STUDENT_ID_BY_LOGIN_ID = "SELECT student_id FROM student WHERE login_id = ?";

    public int getStudentIdByLoginId(int loginId) {
        int studentId = -1; // Default value if not found
        try {
            connect();
            try (PreparedStatement preparedStatement = jdbcConnection.prepareStatement(SELECT_STUDENT_ID_BY_LOGIN_ID)) {
                preparedStatement.setInt(1, loginId);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        studentId = rs.getInt("student_id");
                    }
                }
            } finally {
                disconnect();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return studentId;
    }

    public List<Student> listStudents() throws SQLException {
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
