package com.fyp.Student.Upload;

import com.fyp.model.bean.Examiner;
import com.fyp.model.bean.Form6;
import com.fyp.model.bean.FormTeach;
import com.fyp.model.bean.Proposal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentUploadDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void updateProjectUrl(int studentId, String fileUrl) {
        String sql = "UPDATE project SET pro_url = ? WHERE student_id = ?";
        
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, fileUrl);
            preparedStatement.setInt(2, studentId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public FormTeach getFormtId(int studentId) {
        FormTeach ft = null;
        String sql="SELECT formt_id FROM formteach WHERE student_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int formtId = rs.getInt("formt_id");
                ft = new FormTeach(formtId, studentId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return ft;
    }
    
     public void insertForm6(Form6 f6) throws SQLException {
         String sql = "INSERT INTO form6 (formt_id, submit_date, stu_approval) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, f6.getFormTId());
            preparedStatement.setString(2, f6.getSumbitDate());
            preparedStatement.setString(3, f6.getStuApproval());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
    }
}
