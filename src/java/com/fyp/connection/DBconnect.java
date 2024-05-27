import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnect {
    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        try {
            // Registering the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establishing a connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
            
            // Creating a statement
            statement = connection.createStatement();
            
            // Executing a query
            resultSet = statement.executeQuery("SELECT * FROM login");
            
            // Printing out the data
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                
                System.out.println("Username: " + username + ", Password: " + password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Closing resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
