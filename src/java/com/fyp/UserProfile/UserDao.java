/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.UserProfile;
import com.fyp.model.bean.Student;
import com.fyp.model.bean.Admin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_STUDENT_BY_ID = "SELECT * FROM student WHERE student_id = ?";
     private static final String SELECT_ADMIN_BY_ID = "SELECT * FROM Admin WHERE admin_id = ?";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Error loading JDBC driver", e);
        }
        return connection;
    }

    public Student getStudentById(int studentId) {
        Student student = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setfId(rs.getInt("f_id"));
                student.setLoginId(rs.getInt("login_id"));
                student.setAdminId(rs.getInt("admin_id"));
                student.setsName(rs.getString("s_name"));
                student.setSemester(rs.getInt("semester"));
                student.setsImage(rs.getString("s_image"));
                student.setsCourse(rs.getString("s_course"));
                student.setPhoneNum(rs.getInt("phone_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }
    
    
    
public Admin selectAdmin(int adminId) {
    Admin admin = null;
    String query = "SELECT * FROM admin WHERE admin_id = ?";
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, adminId);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            int loginId = rs.getInt("login_id");
            String aImage = rs.getString("a_image");
            String aName = rs.getString("a_name");
            int phoneNum = rs.getInt("phone_num");
            String email = rs.getString("email");
            admin = new Admin(adminId, loginId, aImage, aName, phoneNum, email);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return admin;
}

}
