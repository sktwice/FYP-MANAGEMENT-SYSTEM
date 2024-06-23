/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.Form;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.fyp.model.bean.Form1;
import com.fyp.model.bean.Form2;
import com.fyp.model.bean.Form3;
import com.fyp.model.bean.Form4;
import com.fyp.model.bean.Form5;
import com.fyp.model.bean.Form6;
import com.fyp.model.bean.Form7;
import com.fyp.model.bean.Form8;

public class FormDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_FORM_SQL = "INSERT INTO form (form_id, student_id, l_id, pro_id) VALUES (?, ?, ?, ?)";
    private static final String INSERT_FORM8_SQL = "INSERT INTO form8 (formt_id, handover_date, pro_background, objective, significance, literature, pro_methodology, present_report, progress_evaluate, total, comment, role, agreement, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public FormDAO() {}

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

     //Method to insert Form2
    public void insertForm2(Form2 form2) throws SQLException {
        String sql = "INSERT INTO form2 (formt_id, prob_identify, evidence, solution, total, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(sql)) {
            
            preparedStatement2.setInt(1, form2.getFormTId());
            preparedStatement2.setInt(2, form2.getProIdentity());
            preparedStatement2.setInt(3, form2.getEvidence());
            preparedStatement2.setInt(4, form2.getSolution());
            preparedStatement2.setInt(5, form2.getTotal());
            preparedStatement2.setString(6, form2.getAgreement());
             preparedStatement2.setDate(7, java.sql.Date.valueOf(form2.getDate()));
            preparedStatement2.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form3
    public void insertForm3(Form3 form3) throws SQLException {
        String sql = "INSERT INTO form3 (form_id, relevance, knowledge, writing, total, agreement, date, login_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(sql)) {
            
            preparedStatement1.setInt(1, form3.getFormId());
            preparedStatement1.setInt(2, form3.getStudentId());
            preparedStatement1.setInt(3, form3.getlId());
            preparedStatement1.setInt(4, form3.getProId());
            preparedStatement1.executeUpdate(); 
            
            preparedStatement2.setInt(1, form3.getFormId());
            preparedStatement2.setInt(2, form3.getRelevance());
            preparedStatement2.setInt(3, form3.getKnowledge());
            preparedStatement2.setInt(4, form3.getWriting());
            preparedStatement2.setInt(5, form3.getTotal());
            preparedStatement2.setString(6, form3.getAgreement());
            preparedStatement2.setDate(7, java.sql.Date.valueOf(form3.getDate()));
            preparedStatement2.setInt(8, form3.getLoginId());
            preparedStatement2.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form4
    public void insertForm4(Form4 form4) throws SQLException {
        String sql = "INSERT INTO form4 (form_id, design, description, model, total, agreement, date, login_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(sql)) {
            
            preparedStatement1.setInt(1, form4.getFormId());
            preparedStatement1.setInt(2, form4.getStudentId());
            preparedStatement1.setInt(3, form4.getlId());
            preparedStatement1.setInt(4, form4.getProId());
            preparedStatement1.executeUpdate();  
            
            preparedStatement2.setInt(1, form4.getFormId());
            preparedStatement2.setInt(2, form4.getDesign());
            preparedStatement2.setInt(3, form4.getDescription());
            preparedStatement2.setInt(4, form4.getModel());
            preparedStatement2.setInt(5, form4.getTotal());
            preparedStatement2.setString(6, form4.getAgreement());
            preparedStatement2.setDate(7, java.sql.Date.valueOf(form4.getDate()));
            preparedStatement2.setInt(8, form4.getLoginId());
            preparedStatement2.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form5
    public void insertForm5(Form5 form5) throws SQLException {
        String sql = "INSERT INTO form5 (form_id, date_meet, completed_activity, next_activity, approval) VALUES (?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form5.getFormId());
            preparedStatement.setString(2, form5.getDateMeet());
            preparedStatement.setString(3, form5.getCompleteActivity());
            preparedStatement.setString(4, form5.getNextActivity());
            preparedStatement.setString(5, form5.getApproval());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form6
    public void insertForm6(Form6 form6) throws SQLException {
        String sql = "INSERT INTO form6 (form_id, submit_date, stu_approval, similarity_index, sv_approval, sv_date, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form6.getFormId());
            preparedStatement.setString(2, form6.getSumbitDate());
            preparedStatement.setString(3, form6.getStuApproval());
            preparedStatement.setInt(4, form6.getSimilarityIndex());
            preparedStatement.setString(5, form6.getSvApproval());
            preparedStatement.setString(6, form6.getSvDate());
            preparedStatement.setString(7, form6.getDateApprove());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form7
    public void insertForm7(Form7 form7) throws SQLException {
        String sql = "INSERT INTO form7 (formt_id, present_date, knowledge, overall_project, present_material, delivery, total, comment, role, agreement, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
            PreparedStatement preparedStatement2 = connection.prepareStatement(sql)) {
            
            preparedStatement2.setInt(1, form7.getFormTId());
            preparedStatement2.setString(2, form7.getPresentDate());
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
    
    public void insertForm8(Form8 form8) throws SQLException {
        //String sql = "INSERT INTO form7 (formt_id, present_date, knowledge, overall_project, present_material, delivery, total, comment, role, agreement, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
            //PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
            PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_FORM8_SQL)) {
            
            preparedStatement2.setInt(1, form8.getFormTId());
            preparedStatement2.setDate(2, java.sql.Date.valueOf(form8.getHandoverDate()));
            preparedStatement2.setInt(3, form8.getProBackground());
            preparedStatement2.setInt(4, form8.getObjective());
            preparedStatement2.setInt(5, form8.getSignificance());
            preparedStatement2.setInt(6, form8.getLiterature());
            preparedStatement2.setInt(7, form8.getProMethodology());
            preparedStatement2.setInt(8, form8.getPresentReport());
            preparedStatement2.setInt(9, form8.getProgressEvaluate());
            preparedStatement2.setInt(10, form8.getTotal());
            preparedStatement2.setString(11, form8.getComment());
            preparedStatement2.setString(12, form8.getRole());
            preparedStatement2.setString(13, form8.getAgreement());
            preparedStatement2.setDate(14, java.sql.Date.valueOf(form8.getDate()));
            preparedStatement2.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    // Method to insert Form8
   

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
