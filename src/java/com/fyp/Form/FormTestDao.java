/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Form;

import com.fyp.model.bean.Form2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FormTestDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_FORM_SQL = "INSERT INTO form (form_id, student_id, l_id, pro_id) VALUES (?, ?, ?, ?)";
    private static final String INSERT_FORM2_SQL = "INSERT INTO form2 (form_id, prob_identify, evidence, solution, total, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?)";

    public FormTestDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertForm(Form2 form2) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_FORM2_SQL)) {

            preparedStatement1.setInt(1, form2.getFormId());
            preparedStatement1.setInt(2, form2.getStudentId());
            preparedStatement1.setInt(3, form2.getlId());
            preparedStatement1.setInt(4, form2.getProId());
            preparedStatement1.executeUpdate();

            preparedStatement2.setInt(1, form2.getFormId());
            preparedStatement2.setInt(2, form2.getProIdentity());
            preparedStatement2.setInt(3, form2.getEvidence());
            preparedStatement2.setInt(4, form2.getSolution());
            preparedStatement2.setInt(5, form2.getTotal());
            preparedStatement2.setString(6, form2.getApproval());
            preparedStatement2.setDate(7, java.sql.Date.valueOf(form2.getDateApprove()));
            preparedStatement2.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
