/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fyp.model.user;

import com.fyp.model.bean.Supervision;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupervisionDAO {

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
    
    
public List<Supervision> listSupervision() throws SQLException {
    List<Supervision> listSupervision = new ArrayList<>();
    String sql = "SELECT p.pro_title, l.l_name, p.student_id, p.session " +
                 "FROM project p " +
                 "JOIN lecturer l ON p.l_id = l.l_id " +  
                 "JOIN student s ON p.student_id = s.student_id" 
            ;

    connect();

    try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery()) {

        while (resultSet.next()) {
            String protitle = resultSet.getString("pro_title");
            String lecturerName = resultSet.getString("l_name");
            int studentId = resultSet.getInt("student_id");
            String session = resultSet.getString("session");

            Supervision su = new Supervision(protitle, lecturerName, studentId, session);
            listSupervision.add(su);
        }
    } finally {
        disconnect();
    }

    return listSupervision;
}


}
