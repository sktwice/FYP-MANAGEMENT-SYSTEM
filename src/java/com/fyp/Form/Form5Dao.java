package com.fyp.Form;

import com.fyp.model.bean.Form;
import com.fyp.model.bean.Form3;
import com.fyp.model.bean.Form5;
import com.fyp.model.bean.Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Form5Dao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_FORMS_BY_STUDENT_ID = "SELECT * FROM form WHERE student_id = ?";
    private static final String SELECT_FORM5_BY_FORM_ID = "SELECT * FROM form5 WHERE form_id = ?";
    private static final String SELECT_PROJECT_BY_STUDENT_ID = "SELECT * FROM project WHERE student_id = ?";
    private static final String INSERT_FORM_SQL = "INSERT INTO form (form_id, student_id, l_id, pro_id) VALUES (?, ?, ?, ?)";
    private static final String INSERT_FORM5 = "INSERT INTO form5 (form_id, date_meet, completed_activity) VALUES (?, ?, ?)";

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

    public List<Form> getFormsByStudentId(int studentId) {
        List<Form> forms = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORMS_BY_STUDENT_ID)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int formId = rs.getInt("form_id");
                int lId = rs.getInt("l_id");
                String proId = rs.getString("pro_ID");
                forms.add(new Form(formId, studentId, lId, Integer.parseInt(proId)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return forms;
    }

    public List<Form5> getForm5ByFormId(int formId) {
        List<Form5> form5List = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM5_BY_FORM_ID)) {
            preparedStatement.setInt(1, formId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String dateMeet = rs.getString("date_meet");
                String completeActivity = rs.getString("completed_activity");
                String nextActivity = rs.getString("next_activity");
                String approval = rs.getString("approval");
                Form5 form5 = new Form5(formId, 0, 0, 0, dateMeet, completeActivity, nextActivity, approval);
                form5List.add(form5);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return form5List;
    }

    public Project getProjectByStudentId(int studentId) {
        Project project = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_BY_STUDENT_ID)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int proId = rs.getInt("pro_ID");
                int lId = rs.getInt("l_id");
                String proTitle = rs.getString("pro_title");
                String domain = rs.getString("domain");
                String proUrl = rs.getString("pro_url");
                String session = rs.getString("session");
                int scopeId = rs.getInt("scope_id");
                int proposalId = rs.getInt("proposal_id");
                project = new Project(proId, studentId, lId, proTitle, domain, proUrl, session, scopeId, proposalId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return project;
    }
    

    public void insertForm5(Form5 form5) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_FORM5)) {
            
            preparedStatement1.setInt(1, form5.getFormId());
            preparedStatement1.setInt(2, form5.getStudentId());
            preparedStatement1.setInt(3, form5.getlId());
            preparedStatement1.setInt(4, form5.getProId());
            preparedStatement1.executeUpdate(); 
            
            preparedStatement2.setInt(1, form5.getFormId());
            preparedStatement2.setDate(2, java.sql.Date.valueOf(form5.getDateMeet()));
            preparedStatement2.setString(3, form5.getCompleteActivity());
            preparedStatement2.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
