package com.fyp.Student.Scope;

import com.fyp.model.bean.Scope;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ScopeDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_SCOPES = "SELECT * FROM scope";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Scope> getScopes() {
        List<Scope> scopes = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SCOPES);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int scopeId = rs.getInt("scope_id");
                int adminId = rs.getInt("admin_id");
                int lId = rs.getInt("l_id");
                String scopeName = rs.getString("scope_name");
                String program = rs.getString("program");
                String session = rs.getString("session");

                scopes.add(new Scope(scopeId, adminId, lId, scopeName, program, session));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return scopes;
    }
    private static final String SELECT_SCOPE_STUDENT_COUNT = "SELECT scope_id, COUNT(*) AS student_count FROM project GROUP BY scope_id";

    public Map<Integer, Integer> getScopeStudentCount() throws SQLException {
        Map<Integer, Integer> scopeStudentCount = new HashMap<>();

        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(SELECT_SCOPE_STUDENT_COUNT)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int scopeId = resultSet.getInt("scope_id");
                int studentCount = resultSet.getInt("student_count");
                scopeStudentCount.put(scopeId, studentCount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scopeStudentCount;
    }
}
