package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Lecturer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LecturerDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_LECTURERS = "SELECT * FROM lecturer";
    private static final String SELECT_ALL_EXAMINERS = "SELECT * FROM lecturer WHERE position = 'examiner'";

    public LecturerDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connection successful");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Database driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error connecting to the database");
        }
        return connection;
    }

    public List<Lecturer> selectAllLecturers() {
        List<Lecturer> lecturers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LECTURERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                lecturers.add(new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + lecturers.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return lecturers;
    }
    
    public List<Lecturer> selectAllExaminers() {
        List<Lecturer> examiners = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EXAMINERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                examiners.add(new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + examiners.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return examiners;
    }
}
