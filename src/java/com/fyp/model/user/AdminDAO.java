package com.fyp.model.user;

import com.fyp.model.bean.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

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

    public Admin getAdminByLoginId(int loginId) throws SQLException {
        String sql = "SELECT * FROM admin WHERE login_id = ?";
        Admin admin = null;
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, loginId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int adminId = resultSet.getInt("admin_id");
                String aImage = resultSet.getString("a_image");
                String aName = resultSet.getString("a_name");
                int phoneNum = resultSet.getInt("phone_num");
                String email = resultSet.getString("email");

                admin = new Admin(adminId, loginId, aImage, aName, phoneNum, email);
            }
        } finally {
            disconnect();
        }

        return admin;
    }
}
