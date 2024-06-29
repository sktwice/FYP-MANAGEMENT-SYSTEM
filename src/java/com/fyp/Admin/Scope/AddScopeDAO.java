package com.fyp.Admin.Scope;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import com.fyp.model.bean.Scope;

public class AddScopeDAO {

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

    private static final String INSERT_SCOPE = "INSERT INTO scope (scope_id, admin_id, l_id, scope_name, program, session) VALUES (?, ?, ?, ?, ?, ?)";

    public boolean insertScope(Scope scope) throws SQLException {
        connect();
        try (PreparedStatement statement = jdbcConnection.prepareStatement(INSERT_SCOPE)) {
            statement.setInt(1, scope.getScopeId());
            statement.setInt(2, scope.getAdminId());
            statement.setInt(3, scope.getlId());
            statement.setString(4, scope.getScopeName());
            statement.setString(5, scope.getProgram());
            statement.setString(6, scope.getSession());

            boolean rowInserted = statement.executeUpdate() > 0;
            return rowInserted;
        } finally {
            disconnect();
        }
    }

    public int generateId() {
        Random random = new Random();
        return random.nextInt(10000); // Generates a random number up to 9999
    }

    private static final String SELECT_ALL_SCOPES = "SELECT scope_id, scope_name, program, session FROM scope";

    public List<Scope> getAllScopes() throws SQLException {
        List<Scope> listScope = new ArrayList<>();
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(SELECT_ALL_SCOPES)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int scopeId = resultSet.getInt("scope_id");
                String scopeName = resultSet.getString("scope_name");
                String program = resultSet.getString("program");
                String session = resultSet.getString("session");

                Scope s = new Scope(scopeId, 0, 0, scopeName, program, session);
                listScope.add(s);
            }
        } finally {
            disconnect();
        }

        return listScope;
    }

    private static final String SELECT_SCOPE_STUDENT_COUNT = "SELECT scope_id, COUNT(*) AS student_count FROM project GROUP BY scope_id";

    public Map<Integer, Integer> getScopeStudentCount() throws SQLException {
        Map<Integer, Integer> scopeStudentCount = new HashMap<>();
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(SELECT_SCOPE_STUDENT_COUNT)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int scopeId = resultSet.getInt("scope_id");
                int studentCount = resultSet.getInt("student_count");
                scopeStudentCount.put(scopeId, studentCount);
            }
        } finally {
            disconnect();
        }

        return scopeStudentCount;
    }
}
