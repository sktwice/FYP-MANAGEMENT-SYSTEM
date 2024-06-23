/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Lecturer.Form;

import com.fyp.model.bean.Form7;
import com.fyp.model.bean.Form7Lecturer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class Form7Dao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_FORM_SQL = "INSERT INTO form (form_id, student_id, l_id, pro_id) VALUES (?, ?, ?, ?)";
    private static final String INSERT_FORM8_SQL = "INSERT INTO form8 (formt_id, handover_date, pro_background, objective, significance, literature, pro_methodology, present_report, progress_evaluate, total, comment, role, agreement, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public Form7Dao() {}

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
    public void insertForm7(Form7Lecturer form7) throws SQLException {
        String sql = "INSERT INTO form7examiner (formt_id, present_date, knowledge, overall_project, present_material, delivery, total, comment, role, agreement, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
            PreparedStatement preparedStatement2 = connection.prepareStatement(sql)) {
            
            preparedStatement2.setInt(1, form7.getFormTId());
            preparedStatement2.setDate(2, java.sql.Date.valueOf(form7.getDate()));
            preparedStatement2.setInt(3, form7.getKnowledge());
            preparedStatement2.setInt(4, form7.getOverallProject());
            preparedStatement2.setInt(5, form7.getPresentMaterial());
            preparedStatement2.setInt(6, form7.getDelivery());
            preparedStatement2.setInt(7, form7.getTotal());
            preparedStatement2.setString(8, form7.getComment());
            preparedStatement2.setString(9, form7.getRole());
            preparedStatement2.setString(10, form7.getAgreement());
            preparedStatement2.setDate(11, java.sql.Date.valueOf(form7.getDate()));
            preparedStatement2.executeUpdate();
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
}
