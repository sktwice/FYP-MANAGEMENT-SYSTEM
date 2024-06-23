package com.fyp.Admin.LecturerList;

import com.fyp.model.bean.Examiner;
import java.util.Random;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Faculty;
import com.fyp.model.bean.Role;
import com.fyp.model.bean.Supervisor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddLecturerDAO {
    
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

    public int generateId() {
        Random random = new Random();
        return 1 + random.nextInt(10000); // Generates a random digit number
    }

    public List<Faculty> listFaculty() throws SQLException {
        List<Faculty> listFaculty = new ArrayList<>();
        String sql = "SELECT * FROM faculty";
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int f_id = resultSet.getInt("f_id");
                String f_name = resultSet.getString("f_name");
                String f_course = resultSet.getString("f_course");

                Faculty f = new Faculty(f_id, f_name, f_course);
                listFaculty.add(f);
            }
        } finally {
            disconnect();
        }
        
        return listFaculty;
    }

    public Faculty getFacultyById(int fId) throws SQLException {
        String sqlFaculty = "SELECT * FROM faculty WHERE f_id = ?";
        Faculty f = null;
        connect();
        try (PreparedStatement statementFaculty = jdbcConnection.prepareStatement(sqlFaculty)) {
            statementFaculty.setInt(1, fId);
            ResultSet resultSet = statementFaculty.executeQuery();

            if (resultSet.next()) {
                String fName = resultSet.getString("f_name");
                String fCourse = resultSet.getString("f_course");
                f = new Faculty(fId, fName, fCourse);
            }
        } finally {
            disconnect();
        }
        return f;
    }
    
    public List<String> courseList() throws SQLException {
        List<String> listCourses = new ArrayList<>();
        String sql = "SELECT f_course FROM faculty"; 
        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String l_course = resultSet.getString("f_course");
                listCourses.add(l_course );
            }
        } finally {
            disconnect();
        }
        return listCourses;
    }

    public void registerLecturer(Login log, Faculty f, Lecturer user, String position, String teachesCsp600) throws SQLException {
        String sqlLogin = "INSERT INTO login (login_id, username, password, category) VALUES (?, ?, ?, ?)";
        String sqlLecturer = "INSERT INTO lecturer (l_id, f_id, login_id, admin_id, position, l_image, l_name, phone_num, email, l_course) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlRole = "INSERT INTO role (role_id, l_id, position, status) VALUES (?, ?, ?, ?)";
        String sqlSupervisor = "INSERT INTO supervisor (sv_id, status, l_id) VALUES (?, ?, ?)";
        String sqlExaminer = "INSERT INTO examiner (ex_id, l_id, status) VALUES (?, ?, ?)";
        String sqlTeach = "INSERT INTO teach (t_id, l_id, status) VALUES (?, ?, ?)"; // Removed student_id and added status

        connect();

        try {
            jdbcConnection.setAutoCommit(false);

            // Insert into login table
            PreparedStatement statementLogin = jdbcConnection.prepareStatement(sqlLogin);
            statementLogin.setInt(1, log.getLoginId());
            statementLogin.setString(2, log.getUsername());
            statementLogin.setString(3, log.getPassword());
            statementLogin.setString(4, log.getCategory());
            statementLogin.executeUpdate();
            
            int svId = generateSupervisorId();

            // Insert into lecturer table
            PreparedStatement statementLecturer = jdbcConnection.prepareStatement(sqlLecturer);
            statementLecturer.setInt(1, user.getlId());
            statementLecturer.setInt(2, user.getfId());
            statementLecturer.setInt(3, user.getLoginId());
            statementLecturer.setInt(4, user.getAdminId());
            statementLecturer.setString(5, user.getPosition());
            statementLecturer.setString(6, user.getiImage());
            statementLecturer.setString(7, user.getlName());
            statementLecturer.setInt(8, user.getPhoneNum());
            statementLecturer.setString(9, user.getEmail());
            statementLecturer.setString(10, user.getLCourse());
            statementLecturer.executeUpdate();

            // Insert into role table based on selected position
            if (position.equals("Supervisor")) {
                int roleId = generateRoleId();
                Role role = new Role(roleId, user.getlId(), "Supervisor", "Active");
                PreparedStatement statementRole = jdbcConnection.prepareStatement(sqlRole);
                statementRole.setInt(1, role.getRoleId());
                statementRole.setInt(2, role.getlId());
                statementRole.setString(3, role.getPosition());
                statementRole.setString(4, role.getStatus());
                statementRole.executeUpdate();

                
                Supervisor supervisor = new Supervisor(svId, 1, user.getlId()); // Assuming status 1 for active
                PreparedStatement statementSupervisor = jdbcConnection.prepareStatement(sqlSupervisor);
                statementSupervisor.setInt(1, supervisor.getSvId());
                statementSupervisor.setInt(2, supervisor.getStatus());
                statementSupervisor.setInt(3, supervisor.getLId());
                statementSupervisor.executeUpdate();
            }

            if (position.equals("Examiner")) {
                int roleId = generateRoleId();
                Role role = new Role(roleId, user.getlId(), "Examiner", "Active");
                PreparedStatement statementRole = jdbcConnection.prepareStatement(sqlRole);
                statementRole.setInt(1, role.getRoleId());
                statementRole.setInt(2, role.getlId());
                statementRole.setString(3, role.getPosition());
                statementRole.setString(4, role.getStatus());
                statementRole.executeUpdate();

                int exId = generateExaminerId();
                Examiner examiner = new Examiner(exId, user.getlId(), 1); // Assuming status 1 for active
                PreparedStatement statementExaminer = jdbcConnection.prepareStatement(sqlExaminer);
                statementExaminer.setInt(1, examiner.getExId());
                statementExaminer.setInt(2, examiner.getlId());
                statementExaminer.setInt(3, examiner.getStatus());
                statementExaminer.executeUpdate();
            }

            if (position.equals("Both")) {
                int roleIdSupervisor = generateRoleId();
                Role roleSupervisor = new Role(roleIdSupervisor, user.getlId(), "Supervisor", "Active");
                PreparedStatement statementRoleSupervisor = jdbcConnection.prepareStatement(sqlRole);
                statementRoleSupervisor.setInt(1, roleSupervisor.getRoleId());
                statementRoleSupervisor.setInt(2, roleSupervisor.getlId());
                statementRoleSupervisor.setString(3, roleSupervisor.getPosition());
                statementRoleSupervisor.setString(4, roleSupervisor.getStatus());
                statementRoleSupervisor.executeUpdate();

                
                Supervisor supervisor = new Supervisor(svId, 1, user.getlId()); // Assuming status 1 for active
                PreparedStatement statementSupervisor = jdbcConnection.prepareStatement(sqlSupervisor);
                statementSupervisor.setInt(1, supervisor.getSvId());
                statementSupervisor.setInt(2, supervisor.getStatus());
                statementSupervisor.setInt(3, supervisor.getLId());
                statementSupervisor.executeUpdate();

                int roleIdExaminer = generateRoleId();
                Role roleExaminer = new Role(roleIdExaminer, user.getlId(), "Examiner", "Active");
                PreparedStatement statementRoleExaminer = jdbcConnection.prepareStatement(sqlRole);
                statementRoleExaminer.setInt(1, roleExaminer.getRoleId());
                statementRoleExaminer.setInt(2, roleExaminer.getlId());
                statementRoleExaminer.setString(3, roleExaminer.getPosition());
                statementRoleExaminer.setString(4, roleExaminer.getStatus());
                statementRoleExaminer.executeUpdate();

                int exId = generateExaminerId();
                Examiner examiner = new Examiner(exId, user.getlId(), 1); // Assuming status 1 for active
                PreparedStatement statementExaminer = jdbcConnection.prepareStatement(sqlExaminer);
                statementExaminer.setInt(1, examiner.getExId());
                statementExaminer.setInt(2, examiner.getlId());
                statementExaminer.setInt(3, examiner.getStatus());
                statementExaminer.executeUpdate();
            }

            // Insert into teach table if teachesCsp600 is selected
            if (teachesCsp600 != null && teachesCsp600.equals("yes")) {
                int tId = generateTeachId();
                int status = 1; // Assuming initial status for teaching
                PreparedStatement statementTeach = jdbcConnection.prepareStatement(sqlTeach);
                statementTeach.setInt(1, tId);
                statementTeach.setInt(2, user.getlId());
                statementTeach.setInt(3, status);
                statementTeach.executeUpdate();

                // Insert into role table with position "teaching"
                int roleIdTeaching = generateRoleId();
                Role roleTeaching = new Role(roleIdTeaching, user.getlId(), "teaching", "Active");
                PreparedStatement statementRoleTeaching = jdbcConnection.prepareStatement(sqlRole);
                statementRoleTeaching.setInt(1, roleTeaching.getRoleId());
                statementRoleTeaching.setInt(2, roleTeaching.getlId());
                statementRoleTeaching.setString(3, roleTeaching.getPosition());
                statementRoleTeaching.setString(4, roleTeaching.getStatus());
                statementRoleTeaching.executeUpdate();
            }

            jdbcConnection.commit();
        } catch (SQLException e) {
            jdbcConnection.rollback();
            throw e;
        } finally {
            jdbcConnection.setAutoCommit(true);
            disconnect();
        }
    }

    private int generateRoleId() {
        Random random = new Random();
        return random.nextInt(10000) + 1; // Generates a random number between 1 and 10000
    }

    private int generateSupervisorId() {
        Random random = new Random();
        return random.nextInt(10000) + 1; // Generates a random number between 1 and 10000
    }

    private int generateExaminerId() {
        Random random = new Random();
        return random.nextInt(10000) + 1; // Generates a random number between 1 and 10000
    }

    private int generateTeachId() {
        Random random = new Random();
        return random.nextInt(10000) + 1; // Generates a random number between 1 and 10000
    }
}
