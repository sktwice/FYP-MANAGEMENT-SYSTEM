package com.fyp.Admin.SupervisorList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SupervisorListDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private Connection jdbcConnection;

    private static final String LISTSV = "SELECT l.l_name AS supervisor_name, l.l_id, r.position, l.email, r.status " +
                                         "FROM supervisor s " +
                                         "JOIN lecturer l ON s.l_id = l.l_id " +
                                         "JOIN role r ON l.l_id = r.l_id " +
                                         "WHERE r.position = 'supervisor'";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

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

    public List<Supervisor> listSupervisors() throws SQLException {
        List<Supervisor> supervisors = new ArrayList<>();

        connect();
        try (Statement stmt = jdbcConnection.createStatement(); ResultSet rs = stmt.executeQuery(LISTSV)) {
            while (rs.next()) {
                Supervisor supervisor = new Supervisor();
                supervisor.setName(rs.getString("supervisor_name"));
                supervisor.setLecturerId(rs.getInt("l_id"));
                supervisor.setPosition(rs.getString("position"));
                supervisor.setEmail(rs.getString("email"));
                supervisor.setStatus(rs.getString("status"));
                supervisors.add(supervisor);
            }
        } finally {
            disconnect();
        }
        return supervisors;
    }

    public void disableSupervisor(int lecturerId) throws SQLException {
        updateSupervisorStatus(lecturerId, "deactive");
    }

    public void enableSupervisor(int lecturerId) throws SQLException {
        updateSupervisorStatus(lecturerId, "active");
    }

    private void updateSupervisorStatus(int lecturerId, String status) throws SQLException {
        String sql = "UPDATE role SET status = ? WHERE l_id = ?";

        connect();
        try (PreparedStatement pstmt = jdbcConnection.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, lecturerId);
            pstmt.executeUpdate();
        } finally {
            disconnect();
        }
    }

    public class Supervisor {
        private String name;
        private int lecturerId;
        private String position;
        private String email;
        private String status;

        // Constructor
        public Supervisor() {
        }

        // Getters and Setters
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getLecturerId() {
            return lecturerId;
        }

        public void setLecturerId(int lecturerId) {
            this.lecturerId = lecturerId;
        }

        public String getPosition() {
            return position;
        }

        public void setPosition(String position) {
            this.position = position;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }
    }
}
