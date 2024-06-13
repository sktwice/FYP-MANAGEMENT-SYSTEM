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

    private String jdbcURL = "jdbc:mysql://localhost:3306/yourdatabase";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

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

//    // Method to insert Form1
//    public void insertForm1(Form1 form1) throws SQLException {
//        String sql = "INSERT INTO form1 (form_id, student_id, l_id, pro_id, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?);";
//        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//            preparedStatement.setInt(1, form1.getFormId());
//            preparedStatement.setInt(2, form1.getStudentId());
//            preparedStatement.setInt(3, form1.getLId());
//            preparedStatement.setInt(4, form1.getProId());
//            preparedStatement.setString(5, form1.getApproval());
//            preparedStatement.setString(6, form1.getDateApprove());
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//    }

    // Method to insert Form2
    public void insertForm2(Form2 form2) throws SQLException {
        String sql="INSERT INTO form2 (form_id, prob_identify, evidence, solution, total, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form2.getFormId());
            preparedStatement.setInt(2, form2.getProIdentity());
            preparedStatement.setInt(3, form2.getEvidence());
            preparedStatement.setInt(4, form2.getSolution());
            preparedStatement.setInt(5, form2.getTotal());
            preparedStatement.setString(6, form2.getApproval());
            preparedStatement.setString(7, form2.getDateApprove());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    // Method to insert Form3
    public void insertForm3(Form3 form3) throws SQLException {
        String sql = "INSERT INTO form3 (form_id, relevance, knowledge, writing, total, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form3.getFormId());
            preparedStatement.setInt(2, form3.getRelevance());
            preparedStatement.setInt(3, form3.getKnowledge());
            preparedStatement.setInt(4, form3.getWriting());
            preparedStatement.setInt(5, form3.getTotal());
            preparedStatement.setString(6, form3.getApproval());
            preparedStatement.setString(7, form3.getDateApprove());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form4
    public void insertForm4(Form4 form4) throws SQLException {
        String sql = "INSERT INTO form4 (form_id, design, description, model, total, approval, date_approve) VALUES (?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form4.getFormId());
            preparedStatement.setInt(2, form4.getDesign());
            preparedStatement.setInt(3, form4.getDescription());
            preparedStatement.setInt(4, form4.getModel());
            preparedStatement.setInt(5, form4.getTotal());
            preparedStatement.setString(6, form4.getApproval());
            preparedStatement.setString(7, form4.getDateApprove());
            preparedStatement.executeUpdate();
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
        String sql = "INSERT INTO form7 (form_id, present_date, knowledge, overall_project, present_material, delivery, total, comment, name, term_sv, dateT_sv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form7.getFormId());
            preparedStatement.setString(2, form7.getPresentDate());
            preparedStatement.setInt(3, form7.getKnowledge());
            preparedStatement.setInt(4, form7.getOverallProject());
            preparedStatement.setInt(5, form7.getPresentMaterial());
            preparedStatement.setInt(6, form7.getDelivery());
            preparedStatement.setInt(7, form7.getTotal());
            preparedStatement.setString(8, form7.getComment());
            preparedStatement.setString(9, form7.getName());
            preparedStatement.setString(10, form7.getTermSv());
            preparedStatement.setString(11, form7.getDateTSv());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Method to insert Form8
    public void insertForm8(Form8 form8) throws SQLException {
        String sql = "INSERT INTO form8 (form_id, handover_date, pro_background, objective, significance, literature, pro_methodology, present_report, progress_evaluate, total, comment, name, term_sv, dateT_sv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, form8.getFormId());
            preparedStatement.setString(2, form8.getHandoverDate());
            preparedStatement.setInt(3, form8.getProBackground());
            preparedStatement.setInt(4, form8.getObjective());
            preparedStatement.setInt(5, form8.getSignificance());
            preparedStatement.setInt(6, form8.getLiterature());
            preparedStatement.setInt(7, form8.getProMethodology());
            preparedStatement.setInt(8, form8.getPresentReport());
            preparedStatement.setInt(9, form8.getProgressEvaluate());
            preparedStatement.setInt(10, form8.getTotal());
            preparedStatement.setString(11, form8.getComment());
            preparedStatement.setString(12, form8.getName());
            preparedStatement.setString(13, form8.getTermSv());
            preparedStatement.setString(14, form8.getDateTSv());
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
}
