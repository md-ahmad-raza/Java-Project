// UserDAO.java
package com.yourpackage.dao;

import com.yourpackage.model.User;
import java.sql.*;

public class UserDAO {
    private Connection connection;
    
    public UserDAO() {
        // Initialize your database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/yourdatabase", 
                "username", 
                "password");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET name=?, email=?, phone=?, about=?, avatar_path=?, password=? WHERE id=?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getAbout());
            statement.setString(5, user.getAvatarPath());
            statement.setString(6, user.getPassword());
            statement.setInt(7, user.getId());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Close connection when done
    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}