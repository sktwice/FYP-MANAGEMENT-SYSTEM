package com.fyp.Form;

import com.fyp.model.bean.Form;
import com.fyp.model.bean.Form5;
import com.fyp.model.bean.FormTeach;
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

    private static final String SELECT_FORMS_BY_STUDENT_ID = "SELECT f.* FROM form5 f JOIN project p ON f.pro_ID = p.pro_ID WHERE p.student_id =?;";
    private static final String SELECT_FORM5_BY_FORM_ID = "SELECT * FROM form5 WHERE form_id = ? ORDER BY date_meet";
    private static final String SELECT_FORM5_BY_PRO_ID = "SELECT * FROM form5 WHERE pro_ID = ? ORDER BY date_meet";

    private static final String SELECT_PROJECT_BY_STUDENT_ID = "SELECT * FROM project WHERE student_id = ?";
    private static final String SELECT_PROJECTS_BY_LECTURER_ID = "SELECT * FROM project WHERE sv_id = ?";
    private static final String INSERT_FORM_SQL = "INSERT INTO form (form_id, student_id, l_id, pro_id) VALUES (?, ?, ?, ?)";
    private static final String INSERT_FORM5 = "INSERT INTO form5 (form_id, date_meet, completed_activity, pro_ID) VALUES (?, ?, ?,?)";
    private static final String UPDATE_FORM5_SQL = "UPDATE form5 SET next_activity = ?, approval = ? WHERE form_id = ?";
    private static final String SELECT_PROJECTS_BY_LECTURER_ID_WITH_FORM5 ="SELECT DISTINCT p.pro_ID, p.student_id, p.sv_id, p.pro_title, p.domain, p.pro_url, p.session, p.scope_id, p.proposal_id FROM project p JOIN form5 f5 ON p.pro_ID = f5.pro_ID WHERE p.sv_id = ?;";
        


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

    public List<Form5> getFormsByStudentId(int studentId) {
        List<Form5> forms = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORMS_BY_STUDENT_ID)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int formId = rs.getInt("form_id");
                String proId = rs.getString("pro_ID");
                forms.add(new Form5(formId, Integer.parseInt(proId)));
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
                Form5 form5 = new Form5(formId, dateMeet, completeActivity, nextActivity, approval);
                form5List.add(form5);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return form5List;
    }
    
    public List<Form5> getForm5ByProId(int proId) {
        List<Form5> form5List = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM5_BY_PRO_ID)) {
            preparedStatement.setInt(1, proId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int formId = rs.getInt("formId");
                String dateMeet = rs.getString("date_meet");
                String completeActivity = rs.getString("completed_activity");
                String nextActivity = rs.getString("next_activity");
                String approval = rs.getString("approval");
                Form5 form5 = new Form5(formId, dateMeet, completeActivity, nextActivity, approval);
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
                int svId = rs.getInt("sv_id");
                String proTitle = rs.getString("pro_title");
                String domain = rs.getString("domain");
                String proUrl = rs.getString("pro_url");
                String session = rs.getString("session");
                int scopeId = rs.getInt("scope_id");
                int proposalId = rs.getInt("proposal_id");
                project = new Project(proId, studentId, svId, proTitle, domain, proUrl, session, scopeId, proposalId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return project;
    }

    public List<Project> getProjectsByLecturerId(int svId) {
        List<Project> projects = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECTS_BY_LECTURER_ID)) {
            preparedStatement.setInt(1, svId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int proId = rs.getInt("pro_ID");
                int studentId = rs.getInt("student_id");
                String proTitle = rs.getString("pro_title");
                String domain = rs.getString("domain");
                String proUrl = rs.getString("pro_url");
                String session = rs.getString("session");
                int scopeId = rs.getInt("scope_id");
                int proposalId = rs.getInt("proposal_id");
                Project project = new Project(proId, studentId, svId, proTitle, domain, proUrl, session, scopeId, proposalId);
                projects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }

    public void insertForm5(Form5 form5) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_FORM_SQL);
             PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_FORM5)) {


            preparedStatement2.setInt(1, form5.getFormId());
            preparedStatement2.setDate(2, java.sql.Date.valueOf(form5.getDateMeet()));
            preparedStatement2.setString(3, form5.getCompleteActivity());
            preparedStatement2.setInt(4, form5.getProId());
            preparedStatement2.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Project> getProjectsByLecturerIdWithForm5(int suvId) {
        List<Project> projects = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECTS_BY_LECTURER_ID_WITH_FORM5)) {
            preparedStatement.setInt(1, suvId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int proId = rs.getInt("pro_ID");
                int studentId = rs.getInt("student_id");
                int svId = rs.getInt("sv_id");
                String proTitle = rs.getString("pro_title");
                String domain = rs.getString("domain");
                String proUrl = rs.getString("pro_url");
                String session = rs.getString("session");
                int scopeId = rs.getInt("scope_id");
                int proposalId = rs.getInt("proposal_id");
                Project project = new Project(proId, studentId, svId, proTitle, domain, proUrl, session, scopeId, proposalId);
                projects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }
    
    public List<Form5> selectForm5ByProIdAndStudentId(int proId, int studentId) {
        List<Form5> form5List = new ArrayList<>();

        String sql = "SELECT f5.formt_id, f5.date_meet, f5.completed_activity, f5.next_activity, f5.approval " +
                     "FROM form5 f5 " +
                     "JOIN formteach f ON f5.formt_id = f.formt_id " +
                     "WHERE f.pro_ID = ? AND f.student_id = ?";
        
        try (Connection connection = getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, proId);
            stmt.setInt(2, studentId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int formtId = rs.getInt("formt_id");
                String dateMeet = rs.getString("date_meet");
                String completedActivity = rs.getString("completed_activity");
                String nextActivity = rs.getString("next_activity");
                String approval = rs.getString("approval");

                // Create Form5 object
                Form5 form5 = new Form5(formtId,dateMeet, completedActivity, nextActivity, approval);
                form5List.add(form5);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return form5List;
    }
    
    public void updateForm5(Form5 form5) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FORM5_SQL)) {
           System.out.println("Updating Form5:");
        System.out.println("Next Activity: " + form5.getNextActivity());
        System.out.println("Approval: " + form5.getApproval());
        System.out.println("Form ID: " + form5.getFormId());

        preparedStatement.setString(1, form5.getNextActivity());
        preparedStatement.setString(2, form5.getApproval());
        preparedStatement.setInt(3, form5.getFormId());

        // Print the statement to check values
        System.out.println("Executing update: " + preparedStatement);

        preparedStatement.executeUpdate();
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int getFormtIdByStudentAndProject(int studentId) {
    int formtId = -1;
    String sql = "SELECT formt_id FROM formteach WHERE student_id = ?";
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setInt(1, studentId);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            formtId = rs.getInt("formt_id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return formtId;
}


}
