package com.fyp.Admin.LecturerList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Faculty;
import com.fyp.model.bean.Role;

public class LecturerListDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private Connection jdbcConnection;

    private static final String INSERT_LECT_SQL = "INSERT INTO lecturer (l_id, f_id, login_id, admin_id, position, l_image, l_name, phone_num, email, l_course) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_LECT = "SELECT * FROM lecturer";
    private static final String SELECT_ALL_ROLES = "SELECT * FROM role";
    private static final String DELETE_LECT_SQL = "DELETE FROM lecturer WHERE l_id = ?";
    private static final String DELETE_LOGIN_SQL = "DELETE FROM login WHERE login_id = ?";
    private static final String DELETE_PROPOSAL_SQL = "DELETE FROM proposal WHERE l_id = ?";
    private static final String DELETE_SCOPE_SQL = "DELETE FROM scope WHERE l_id = ?";
    private static final String DELETE_PROJECT_SQL = "DELETE FROM project WHERE l_id = ?";
    private static final String UPDATE_LECT_SQL = "UPDATE lecturer SET position = ?, l_name = ?, email = ? WHERE l_id = ?";
    private static final String SELECT_ALL_FACULTY = "SELECT * FROM faculty";
    private static final String SELECT_TEACHING_LEC = "SELECT l.l_name, l.l_id, r.status, r.role_id, l.email FROM lecturer l JOIN teach t ON l.l_id = t.l_id JOIN ROLE r ON l.l_id = r.l_id WHERE r.position = 'teaching';";
    private static final String SELECT_SUPERVISOR_LEC = "SELECT l.l_name, l.l_id, r.status,r.role_id, l.email FROM lecturer l JOIN supervisor t ON l.l_id = t.l_id JOIN ROLE r ON l.l_id = r.l_id WHERE r.position = 'supervisor';";
    private static final String SELECT_EXAMINER_LEC = "SELECT l.l_name, l.l_id,l.phone_num, r.status,r.role_id, l.email FROM lecturer l JOIN examiner t ON l.l_id = t.l_id JOIN ROLE r ON l.l_id = r.l_id WHERE r.position = 'examiner';";
    private static final String UPDATE_ACTIVE = "UPDATE role SET status = 'Active' WHERE role_id = ?";
    private static final String UPDATE_UNACTIVE = "UPDATE role SET status = 'Unactive' WHERE role_id = ?";
    
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
    
    public boolean updateRoleActive(int roleId) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACTIVE)) {
            preparedStatement.setInt(1, roleId);
            System.out.println("Rows updated: " + roleId);
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateRoleUnActive(int roleId) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_UNACTIVE)) {
            preparedStatement.setInt(1, roleId);
            System.out.println("Rows updated: " + roleId);
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<LecturerRole> teachingLecturer() {
        List<LecturerRole> teaching = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHING_LEC)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String lName=rs.getString("l_name");
                int lId = rs.getInt("l_id");
                String status = rs.getString("status");
                String email = rs.getString("email");
                int roleId = rs.getInt("role_id");
                teaching.add(new LecturerRole(lName,lId,status,email, roleId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return teaching;
    }
    
    public List<LecturerRole> supervisorLecturer() {
        List<LecturerRole> supervisor = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPERVISOR_LEC)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String lName=rs.getString("l_name");
                int lId = rs.getInt("l_id");
                String status = rs.getString("status");
                String email = rs.getString("email");
                int roleId = rs.getInt("role_id");
                supervisor.add(new LecturerRole(lName,lId,status,email,roleId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return supervisor;
    }
    
    public List<LecturerRole> examinerLecturer() {
        List<LecturerRole> examiner = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXAMINER_LEC)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String lName=rs.getString("l_name");
                int lId = rs.getInt("l_id");
                int phoneNum=rs.getInt("phone_num");
                String status = rs.getString("status");
                String email = rs.getString("email");
                int roleId = rs.getInt("role_id");
                examiner.add(new LecturerRole(lName,lId,phoneNum,status,email, roleId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return examiner;
    }

    public List<Faculty> selectAllFaculties() {
        List<Faculty> faculties = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACULTY)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int fId = rs.getInt("f_id");
                String fName = rs.getString("f_name");
                String fCourse = rs.getString("f_course");
                faculties.add(new Faculty(fId, fName, fCourse));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return faculties;
    }

    public Faculty getFacultyById(int fId) throws SQLException {
        String sql = "SELECT * FROM faculty WHERE f_id = ?";
        Faculty faculty = null;
        connect();
        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, fId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String fName = resultSet.getString("f_name");
                String fCourse = resultSet.getString("f_course");
                faculty = new Faculty(fId, fName, fCourse);
            }
        } finally {
            disconnect();
        }
        return faculty;
    }

    public void insertLecturer(Lecturer lecturer) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LECT_SQL)) {
            preparedStatement.setInt(1, lecturer.getlId());
            preparedStatement.setInt(2, lecturer.getfId());
            preparedStatement.setInt(3, lecturer.getLoginId());
            preparedStatement.setInt(4, lecturer.getAdminId());
            preparedStatement.setString(5, lecturer.getPosition());
            preparedStatement.setString(6, lecturer.getiImage());
            preparedStatement.setString(7, lecturer.getlName());
            preparedStatement.setInt(8, lecturer.getPhoneNum());
            preparedStatement.setString(9, lecturer.getEmail());
            preparedStatement.setString(10, lecturer.getLCourse());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Lecturer selectLecturer(int lId) {
        Lecturer lecturer = null;
        String query = "SELECT * FROM lecturer WHERE l_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, lId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int fId = rs.getInt("f_id");
                int loginId = rs.getInt("login_id");
                int adminId = rs.getInt("admin_id");
                String position = rs.getString("position");
                String iImage = rs.getString("l_image");
                String lName = rs.getString("l_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                String sCourse = rs.getString("l_course");
                lecturer = new Lecturer(lId, fId, loginId, adminId, position, iImage, lName, phoneNum, email, sCourse);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return lecturer;
    }

    public List<Lecturer> selectAllLecturers() {
        List<Lecturer> lecturers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LECT)) {
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
                String sCourse = rs.getString("l_course");
                lecturers.add(new Lecturer(lId, fId, loginId, adminId, position, iImage, lName, phoneNum, email, sCourse));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return lecturers;
    }

    public List<Role> selectAllRoles() {
        List<Role> roles = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ROLES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("role_id");
                int lId = rs.getInt("l_id");
                String position = rs.getString("position");
                String status = rs.getString("status");
                roles.add(new Role(roleId, lId, position, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return roles;
    }

    public boolean deleteLecturer(int lId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_LECT_SQL)) {
            statement.setInt(1, lId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean deleteLogin(int loginId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_LOGIN_SQL)) {
            statement.setInt(1, loginId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean deleteProposal(int lId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PROPOSAL_SQL)) {
            statement.setInt(1, lId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean deleteProject(int lId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_SQL)) {
            statement.setInt(1, lId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean deleteScope(int lId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SCOPE_SQL)) {
            statement.setInt(1, lId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateLecturer(Lecturer lecturer) throws SQLException {
    boolean rowUpdated;
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(UPDATE_LECT_SQL)) {
        statement.setString(1, lecturer.getPosition());
        statement.setString(2, lecturer.getlName());
        statement.setString(3, lecturer.getEmail());
        statement.setInt(4, lecturer.getlId());
        rowUpdated = statement.executeUpdate() > 0;
    }
    return rowUpdated;
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
    
    public class LecturerRole {
    private String lName;
    private int lId;
    private String status;
    private String email;
    private int roleId;
    private int phoneNum;

    // Constructor
    public LecturerRole(String lName, int lId, String status, String email, int roleId) {
        this.lName = lName;
        this.lId = lId;
        this.status = status;
        this.email = email;
        this.roleId = roleId;
    }
    
    public LecturerRole(String lName, int lId,int phoneNum, String status, String email, int roleId) {
        this.lName = lName;
        this.lId = lId;
        this.phoneNum = phoneNum;
        this.status = status;
        this.email = email;
        this.roleId = roleId;
    }

    // Getters
    public String getLName() {
        return lName;
    }

    public int getLId() {
        return lId;
    }

    public String getStatus() {
        return status;
    }

    public String getEmail() {
        return email;
    }

    // Setters
    public void setLName(String lName) {
        this.lName = lName;
    }

    public void setLId(int lId) {
        this.lId = lId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setEmail(String email) {
        this.email = email;
    }

        public int getRoleId() {
            return roleId;
        }

        public void setRoleId(int roleId) {
            this.roleId = roleId;
        }

        public int getPhoneNum() {
            return phoneNum;
        }

        public void setPhoneNum(int phoneNum) {
            this.phoneNum = phoneNum;
        }
        
        

}

}