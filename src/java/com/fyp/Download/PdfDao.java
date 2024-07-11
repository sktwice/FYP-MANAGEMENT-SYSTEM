/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Download;

import com.fyp.model.bean.Proposal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class PdfDao {
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
    
    public String getPdfPathById(int proposalId) throws SQLException {
        String pdfPath = null;
        String sql = "SELECT pdf_url FROM proposal WHERE proposal_id = ?";

        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, proposalId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                pdfPath = resultSet.getString("pdf_url");
            }
        } finally {
            disconnect();
        }

        return pdfPath;
    }
    
    public String getProjectPathById(int proId) throws SQLException {
        String pdfPath = null;
        String sql = "SELECT pro_url FROM project WHERE pro_ID = ?";

        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, proId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                pdfPath = resultSet.getString("pro_url");
            }
        } finally {
            disconnect();
        }

        return pdfPath;
    }
}
