package com.fyp.Admin.Scope;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.fyp.model.bean.Scope;
import java.util.Random;

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
        return 0 + random.nextInt(10000); // Generates a random digit number
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
}
