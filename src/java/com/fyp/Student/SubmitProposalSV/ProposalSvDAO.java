package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Project;
import com.fyp.model.bean.Proposal;
import com.fyp.model.bean.Scope;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ProposalSvDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_PROPOSAL_SQL = "INSERT INTO proposal (proposal_id, student_id, sv_id, scope_id, topic, session, pdf_url, pdf_name, status, domain) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PROPOSAL_BY_ID_SQL = "SELECT * FROM proposal WHERE proposal_id = ?";
    private static final String INSERT_PROJECT_SQL = "INSERT INTO project (pro_ID, student_id, l_id, pro_title, domain, pro_url, session, scope_id, proposal_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_FORMTEACH="UPDATE formteach set pro_ID=?, sv_Id=? where student_id=?";

    public ProposalSvDAO() {}

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

    public void insertProposal(Proposal proposal) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROPOSAL_SQL)) {
            preparedStatement.setInt(1, proposal.getProposalId());
            preparedStatement.setInt(2, proposal.getStudentId());
            preparedStatement.setInt(3, proposal.getSvId());
            preparedStatement.setInt(4, proposal.getScopeId());
            preparedStatement.setString(5, proposal.getTopic());
            preparedStatement.setString(6, proposal.getSemester());
            preparedStatement.setString(7, proposal.getPdfUrl());
            preparedStatement.setString(8, proposal.getPdfName());
            preparedStatement.setString(9, proposal.getStatus());
            preparedStatement.setString(10, proposal.getDomain());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Proposal getProposalById(int proposalId) throws SQLException {
        Proposal proposal = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROPOSAL_BY_ID_SQL)) {
            preparedStatement.setInt(1, proposalId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int studentId = rs.getInt("student_id");
                int svId = rs.getInt("sv_id");
                int scopeId = rs.getInt("scope_id");
                String topic = rs.getString("topic");
                String semester = rs.getString("session");
                String pdfUrl = rs.getString("pdf_url");
                String pdfName = rs.getString("pdf_name");
                String status = rs.getString("status");
                String domain = rs.getString("domain");

                proposal = new Proposal(proposalId, studentId, svId, scopeId, topic, semester, pdfUrl, pdfName, status, domain);
            }
        }
        return proposal;
    }

    public void transferProposalToProject(Proposal proposal) throws SQLException {
    String proId = generateProId();
    String proTitle = proposal.getTopic();
    String session = proposal.getSemester();

    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL);
         PreparedStatement preparedStatement2 = connection.prepareStatement(UPDATE_FORMTEACH)) {
        
        // Insert into project table
        preparedStatement.setString(1, proId);
        preparedStatement.setInt(2, proposal.getStudentId());
        preparedStatement.setInt(3, proposal.getSvId());
        preparedStatement.setString(4, proTitle);
        preparedStatement.setString(5, proposal.getDomain());
        preparedStatement.setString(6, null); // pro_url set to null
        preparedStatement.setString(7, session);
        preparedStatement.setInt(8, proposal.getScopeId());
        preparedStatement.setInt(9, proposal.getProposalId());
        preparedStatement.executeUpdate();

        // Update formteach table
        preparedStatement2.setString(1, proId);
        preparedStatement2.setInt(2, proposal.getSvId());
        preparedStatement2.setInt(3, proposal.getStudentId());
        int rowsUpdated = preparedStatement2.executeUpdate();

        // Check if the update was successful
        if (rowsUpdated == 0) {
            throw new SQLException("Updating formteach failed, no rows affected.");
        }

    } catch (SQLException e) {
        printSQLException(e);
    }
}

    private String generateProId() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("PROJ%06d", number);
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

    public List<Scope> getAllScopes() throws SQLException {
        List<Scope> scopeList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM scope")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int scopeId = rs.getInt("scope_id");
                int adminId = rs.getInt("admin_id");
                int lId = rs.getInt("l_id");
                String scopeName = rs.getString("scope_name");
                String program = rs.getString("program");
                String session = rs.getString("session");
                Scope scope = new Scope(scopeId, adminId, lId, scopeName, program, session);
                scopeList.add(scope);
            }
        }
        return scopeList;
    }
    
    public void insertProject(Project project) throws SQLException {
    String INSERT_PROJECT_SQL = "INSERT INTO project (pro_ID, student_id, pro_title, domain, pro_url, session, scope_id, proposal_id, sv_id) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL);
         PreparedStatement preparedStatement2 = connection.prepareStatement(UPDATE_FORMTEACH))  {
        // Auto-generated pro_ID in MySQL, assuming it's an auto_increment column
        preparedStatement.setInt(1, project.getProId()); // MySQL auto-increment will handle this
        preparedStatement.setInt(2, project.getStudentId());
        preparedStatement.setString(3, project.getProTitle());
        preparedStatement.setString(4, project.getDomain());
        preparedStatement.setString(5, project.getProUrl());
        preparedStatement.setString(6, project.getSession());
        preparedStatement.setInt(7, project.getScopeId());
        preparedStatement.setInt(8, project.getProposalId());
        preparedStatement.setInt(9, project.getSvId());

        preparedStatement.executeUpdate();
        
        preparedStatement2.setInt(1, project.getProId());
        preparedStatement2.setInt(2, project.getSvId());
        preparedStatement2.setInt(3, project.getStudentId());
        int rowsUpdated = preparedStatement2.executeUpdate();

        // Check if the update was successful
        if (rowsUpdated == 0) {
            throw new SQLException("Updating formteach failed, no rows affected.");
        }

    }
}

public void deleteProposal(int proposalId) throws SQLException {
    String DELETE_PROPOSAL_SQL = "DELETE FROM proposal WHERE proposal_id = ?";

    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PROPOSAL_SQL)) {
        preparedStatement.setInt(1, proposalId);
        preparedStatement.executeUpdate();
    }
}

}
