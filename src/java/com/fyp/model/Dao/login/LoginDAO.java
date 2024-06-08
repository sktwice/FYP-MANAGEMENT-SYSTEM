package com.fyp.model.Dao.login;

import com.fyp.model.bean.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    public Login validate(String username, String password) throws SQLException, ClassNotFoundException {
        Login login = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp?useSSL=false", "root", "");
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT login_id, category FROM login WHERE username = ? AND password = ?")) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                login = new Login();
                login.setLoginId(rs.getInt("login_id")); // Retrieve loginId from database
                login.setCategory(rs.getString("category")); // Retrieve category from database
                login.setUsername(username); // Set username
                login.setPassword(password); // Set password
            }
        }
        return login;
    }

    public String getLecturerPosition(int loginId) throws ClassNotFoundException {
        String position = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp?useSSL=false", "root", "");
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT position FROM lecturer WHERE login_id = ?")) {
            
            preparedStatement.setInt(1, loginId);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                position = rs.getString("position");
            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return position;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
