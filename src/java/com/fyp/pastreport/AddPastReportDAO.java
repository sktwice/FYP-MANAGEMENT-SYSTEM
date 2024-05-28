/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.pastreport;

import java.io.IOException;
import java.io.PrintWriter;
import com.fyp.model.bean.pastReport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AddPastReportDAO{

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

    
    public void AddPastReport (pastReport ps) throws SQLException {
        String sqlpastReport = "INSERT INTO past_project (pro_id, student_id, l_id , pro_title , session) VALUES (?, ?, ?, ?,?)";
        connect();
        
        try{
              jdbcConnection.setAutoCommit(false);
            
              
            PreparedStatement statementRP = jdbcConnection.prepareStatement(sqlpastReport);
            statementRP.setInt(1, ps.getProId());
            statementRP.setInt(2, ps.getStudentId());
            statementRP.setInt(3, ps.getLId());
            statementRP.setString(4, ps.getProTitle());  
            statementRP.setString(5, ps.getSession());  
                
       
            jdbcConnection.commit();
        
        } catch (SQLException ex) {
            
            jdbcConnection.rollback();
            throw new SQLException(ex);
        } finally {
            jdbcConnection.setAutoCommit(true);
            disconnect();
        }
    }
    

}
