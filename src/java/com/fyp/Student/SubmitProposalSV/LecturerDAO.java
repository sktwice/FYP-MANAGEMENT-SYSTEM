package com.fyp.Student.SubmitProposalSV;

import com.fyp.model.bean.Examiner;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Proposal;
import com.fyp.model.bean.Role;
import com.fyp.model.bean.Supervisor;
import com.fyp.model.bean.Teach;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LecturerDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ALL_LECTURERS = "SELECT * FROM lecturer";
    //private static final String SELECT_SV_BY_LID = "SELECT sv_id FROM supervisor where l_id=?";
    private static final String SELECT_SV_BY_LID = "SELECT sv_id, status FROM supervisor WHERE l_id = ?";
    private static final String SELECT_TC_BY_LID = "SELECT t_id, status FROM teach WHERE l_id = ?";
    private static final String SELECT_EX_BY_LID = "SELECT ex_id, status FROM examiner WHERE l_id = ?";
    private static final String SELECT_PROPOSALS_BY_SUPERVISOR_ID = "SELECT * FROM proposal WHERE sv_id = ?";
    private static final String SELECT_ALL_EXAMINERS = "SELECT * FROM lecturer WHERE position = 'examiner'";
    private static final String CHECK_STUDENT_PROPOSAL = "SELECT COUNT(*) FROM proposal WHERE student_id = ?";
     private static final String SELECT_LECTURER_BY_LOGIN_ID = "SELECT * FROM lecturer WHERE login_id = ?";
    private static final String SELECT_ALL_POSITION_LECTURERS = "SELECT * FROM lecturer WHERE position = 'supervisor'";
    private static final String SELECT_PROPOSALS_BY_STUDENT_ID = "SELECT * FROM proposal WHERE student_id = ?";
    private static final String SELECT_PROPOSALS_BY_LECTURER_ID = "SELECT * FROM proposal WHERE l_id = ?";
    private static final String SELECT_POSITIONS_BY_LECTURER_ID = "SELECT position, status FROM ROLE WHERE l_id = ?";
    private static final String COUNT_ROLES_BY_LECTURER_ID = "SELECT COUNT(*) FROM ROLE WHERE l_id = ?";
    private static final String SELECT_LECTURERS_BY_SUPERVISOR = "SELECT l.*, s.sv_id FROM lecturer l JOIN supervisor s ON l.l_id = s.l_id";

    public LecturerDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connection successful");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Database driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error connecting to the database");
        }
        return connection;
    }
    
     public Teach getTeachByLecturerId(int lecturerId) {
        Teach teach = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TC_BY_LID)) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int tId = rs.getInt("t_id");
                int status = rs.getInt("status");
                teach = new Teach(tId, status, lecturerId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return teach;
    }
     
     public Examiner getExaminerByLecturerId(int lecturerId) {
        Examiner examiner = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EX_BY_LID)) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int exId = rs.getInt("ex_id");
                int status = rs.getInt("status");
                examiner = new Examiner(exId, status, lecturerId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return examiner;
    }
    
     public Supervisor getSupervisorByLecturerId(int lecturerId) {
        Supervisor supervisor = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SV_BY_LID)) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int svId = rs.getInt("sv_id");
                int status = rs.getInt("status");
                supervisor = new Supervisor(svId, status, lecturerId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return supervisor;
    }
    
     public List<Proposal> selectProposalsBySupervisorId(int supervisorId) {
        List<Proposal> proposals = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROPOSALS_BY_SUPERVISOR_ID);) {
            preparedStatement.setInt(1, supervisorId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int proposalId = rs.getInt("proposal_id");
                int studentId = rs.getInt("student_id");
                int svId = rs.getInt("sv_id");
                int scopeId = rs.getInt("scope_id");
                String topic = rs.getString("topic");
                String session = rs.getString("session");
                String pdfUrl = rs.getString("pdf_url");
                String pdfName = rs.getString("pdf_name");
                String status = rs.getString("status");
                String domain = rs.getString("domain");
                proposals.add(new Proposal(proposalId, studentId, svId, scopeId, topic, session, pdfUrl, pdfName, status, domain));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return proposals;
    }

    public List<Lecturer> selectAllLecturers() {
        List<Lecturer> lecturers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LECTURERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                lecturers.add(new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + lecturers.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return lecturers;
    }
    
    public List<Lecturer> selectAllExaminers() {
        List<Lecturer> examiners = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EXAMINERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                examiners.add(new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + examiners.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return examiners;
    }
    
     public boolean studentHasProposal(int studentId) {
        boolean hasProposal = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_STUDENT_PROPOSAL);) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                hasProposal = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return hasProposal;
    }
    
    public Lecturer getLecturerByLoginId(int loginId) {
        Lecturer lecturer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LECTURER_BY_LOGIN_ID);) {
            preparedStatement.setInt(1, loginId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                lecturer = new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return lecturer;
    }
    
    public List<Lecturer> selectAllSupervisor() {
        List<Lecturer> examiners = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION_LECTURERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String lImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                examiners.add(new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + examiners.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return examiners;
    }
    
     public List<Proposal> selectProposalsByStudentId(int studentId) {
        List<Proposal> proposals = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROPOSALS_BY_STUDENT_ID);) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int proposalId = rs.getInt("proposal_id");
                int svId = rs.getInt("sv_id");
                int scopeId = rs.getInt("scope_id");
                String topic = rs.getString("topic");
                String session = rs.getString("session");
                String pdfUrl = rs.getString("pdf_url");
                String pdfName = rs.getString("pdf_name");
                String status = rs.getString("status");
                String domain = rs.getString("domain");
                proposals.add(new Proposal(proposalId, studentId, svId, scopeId, topic, session, pdfUrl, pdfName, status, domain));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return proposals;
    }
    
    public List<Proposal> selectProposalsByLecturerId(int lecturerId) {
        List<Proposal> proposals = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROPOSALS_BY_LECTURER_ID);) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int proposalId = rs.getInt("proposal_id");
                int studentId = rs.getInt("student_id");
                int scopeId = rs.getInt("scope_id");
                String topic = rs.getString("topic");
                String session = rs.getString("session");
                String pdfUrl = rs.getString("pdf_url");
                String pdfName = rs.getString("pdf_name");
                String status = rs.getString("status");
                String domain = rs.getString("domain");
                proposals.add(new Proposal(proposalId, studentId, lecturerId, scopeId, topic, session, pdfUrl, pdfName, status, domain));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proposals;
    }
    
     public List<Role> getRolesByLecturerId(int lecturerId) {
        List<Role> roles = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSITIONS_BY_LECTURER_ID);) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String position = rs.getString("position");
                String status = rs.getString("status");
                roles.add(new Role(position, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return roles;
    }

// Add this method to count roles by lecturer ID
    public int countRolesByLecturerId(int lecturerId) {
        int count = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ROLES_BY_LECTURER_ID);) {
            preparedStatement.setInt(1, lecturerId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return count;
    }
    
    public List<Lecturer> selectLecturersBySupervisor() {
        List<Lecturer> lecturers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LECTURERS_BY_SUPERVISOR)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int lId = rs.getInt("l_id");
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String iImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String lCourse = rs.getString("l_course");
                int svId = rs.getInt("sv_id");
                lecturers.add(new Lecturer(lId, fId, loginId, adminId, position, iImage, lName, phoneNum, email, lCourse, svId));
            }
            System.out.println("DAO: Number of lecturers retrieved: " + lecturers.size());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return lecturers;
    }
}
