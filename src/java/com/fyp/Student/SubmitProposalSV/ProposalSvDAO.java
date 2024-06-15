package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Proposal;
import com.fyp.model.bean.Scope;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ProposalSvDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_PROPOSAL_SQL = "INSERT INTO proposal (proposal_id, student_id, l_id, scope_id, topic, session, pdf_url, pdf_name, status, domain) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public ProposalSvDAO() {}

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

    public void insertProposal(Proposal proposal) throws SQLException {
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROPOSAL_SQL)) {
            preparedStatement.setInt(1, proposal.getProposalId());
            preparedStatement.setInt(2, proposal.getStudentId());
            preparedStatement.setInt(3, proposal.getlId());
            preparedStatement.setInt(4, proposal.getScopeId());
            preparedStatement.setString(5, proposal.getTopic());
            preparedStatement.setString(6, proposal.getSemester());
            preparedStatement.setString(7, proposal.getPdfUrl());
            preparedStatement.setString(8, proposal.getPdfName());
            preparedStatement.setString(9, proposal.getStatus());
            preparedStatement.setString(10, proposal.getDomain());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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

    public List<Scope> getAllScopes() throws SQLException {
        List<Scope> scopeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM scope")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int scopeId = rs.getInt("scope_id");
                int adminId = rs.getInt("admin_id");
                int lId = rs.getInt("l_id");
                String scopeName = rs.getString("scope_name");
                String program = rs.getString("program");
                String session = rs.getString("session");
                Scope scope = new Scope(scopeId, adminId, lId, scopeName, program, session);
                scopeList.add(scope);
            }
        }
        return scopeList;
    }
}
