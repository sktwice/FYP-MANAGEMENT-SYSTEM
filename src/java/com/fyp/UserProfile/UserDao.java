package com.fyp.UserProfile;
import com.fyp.model.bean.Admin;
import com.fyp.model.bean.Lecturer;
import com.fyp.model.bean.Login;
import com.fyp.model.bean.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/fyp?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String SELECT_ADMIN_BY_ID = "SELECT * FROM admin WHERE admin_id = ?";
    private static final String SELECT_PASSWORD = "SELECT * FROM login WHERE login_id = ?";
    private static final String SELECT_LECTURER_BY_ID = "SELECT * FROM lecturer WHERE l_id = ?";
    private static final String SELECT_STUDENT_BY_ID = "SELECT * FROM student WHERE student_id = ?";
    private static final String UPDATE_PASSWORD = "UPDATE login SET password=? where login_id=?";
    private static final String UPDATE_PROFILE_ADMIN = "UPDATE admin SET a_image = ?, a_name = ?, phone_num = ?, email = ? WHERE admin_id = ?";
    private static final String SELECT_FORM6 = "SELECT form6. * FROM form6 JOIN formTeach ON form6.formt_id = formTeach.formt_id WHERE formTeach.student_id = ?;";
    private static final String HAS_PROJECT = "SELECT * from project where student_id=?";
    
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Error loading JDBC driver", e);
        }
        return connection;
    }
    
    public void updatePassword(String newPassword,int loginId) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD)) {

        preparedStatement.setString(1, newPassword);
        preparedStatement.setInt(2, loginId);


        preparedStatement.executeUpdate();
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean studentHasForm6(int studentId) {
        boolean hasForm6 = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM6);) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                hasForm6 = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return hasForm6;
    }
    
    public boolean studentHasProject(int studentId) {
        boolean hasProject = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(HAS_PROJECT);) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                hasProject = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error executing SQL query");
        }
        return hasProject;
    }

    
    public Admin selectAdmin(int adminId) {
        Admin admin = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_ID)) {
            preparedStatement.setInt(1, adminId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int loginId = rs.getInt("login_id");
                String aImage = rs.getString("a_image");
                String aName = rs.getString("a_name");
                int phoneNum = rs.getInt("phone_num");
                String email = rs.getString("email");
                admin = new Admin(adminId, loginId, aImage, aName, phoneNum, email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    
    public Login selectLogin(int loginId) {
        Login login = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PASSWORD)) {
            preparedStatement.setInt(1, loginId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String category = rs.getString("category");
                login = new Login(loginId, username, password, category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return login;
    }
    public Lecturer selectLecturer(int lId) {
        Lecturer lecturer = null;
        try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LECTURER_BY_ID)) {
        preparedStatement.setInt(1, lId);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            int fId = rs.getInt("f_id");
            int loginId = rs.getInt("login_id");
            int adminId = rs.getInt("admin_id");
            String position = rs.getString("position");
            String lImage = rs.getString("l_image");
            String lName = rs.getString("l_name");
            int phoneNum = rs.getInt("phone_num");
            String email = rs.getString("email");
            String lCourse = rs.getString("l_course");
            
            System.out.println(lImage);

            lecturer = new Lecturer(lId, fId, loginId, adminId, position, lImage, lName, phoneNum, email, lCourse);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return lecturer;
}
    
     public Student selectStudent(int studentId) {
        Student student = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            preparedStatement.setInt(1, studentId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
            int fId = rs.getInt("f_id");
            int loginId = rs.getInt("login_id");
            int adminId = rs.getInt("admin_id");
            String sName = rs.getString("s_name");
            int semester = rs.getInt("semester");
            String sImage = rs.getString("s_image");
            String sCourse = rs.getString("s_course");
            int phoneNum = rs.getInt("phone_num");

            student = new Student(studentId, fId, loginId, adminId, sName, semester, sImage, sCourse, phoneNum);
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public boolean updateAdmin(Admin admin) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROFILE_ADMIN)) {
            preparedStatement.setString(1, admin.getaImage());
            preparedStatement.setString(2, admin.getaName());
            preparedStatement.setInt(3, admin.getPhoneNum());
            preparedStatement.setString(4, admin.getEmail());
            preparedStatement.setInt(5, admin.getAdminId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}