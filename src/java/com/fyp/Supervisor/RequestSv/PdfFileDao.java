/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Supervisor.RequestSv;

import com.fyp.model.bean.Proposal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PdfFileDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_PROPOSAL_BY_ID = "SELECT * FROM proposal WHERE proposal_id = ?";
    private static final String UPDATE_PROPOSAL_STATUS_SQL = "UPDATE proposal SET status = 'accepted' WHERE proposal_id = ?";
    private static final String UPDATE_PROPOSAL_STATUS_SQL_REJECT = "UPDATE proposal SET status = 'rejected' WHERE proposal_id = ?";
    private static final String DELETE_PROPOSAL_SQL = "DELETE FROM proposal WHERE proposal_id = ?";

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

    public Proposal getProposal(int proposalId) {
        Proposal proposal = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROPOSAL_BY_ID)) {
            preparedStatement.setInt(1, proposalId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                proposal = new Proposal(
                    rs.getInt("proposal_id"),
                    rs.getInt("student_id"),
                    rs.getInt("l_id"),
                    rs.getInt("scope_id"),
                    rs.getString("topic"),
                    rs.getString("session"),
                    rs.getString("pdf_url"),
                    rs.getString("pdf_name"),
                    rs.getString("status"),
                    rs.getString("domain")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proposal;
    }

    public void acceptProposal(int proposalId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROPOSAL_STATUS_SQL)) {
            preparedStatement.setInt(1, proposalId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error updating proposal status", e);
        }
    }

    public void rejectProposal(int proposalId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROPOSAL_STATUS_SQL_REJECT)) {
            preparedStatement.setInt(1, proposalId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error updating proposal status", e);
        }
    }

    public void deleteProposal(int proposalId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PROPOSAL_SQL)) {
            preparedStatement.setInt(1, proposalId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting proposal", e);
        }
    }
}
