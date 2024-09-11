package com.tech.learnify.dao;

import java.sql.*;
import com.tech.learnify.entities.User;

public class UserDao {
    private Connection con;

    // Constructor to initialize the connection
    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert the user into the database
    public boolean saveUser(User user) {
        boolean isSaved = false;
        String query = "INSERT INTO user (name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            // Execute update
            int rowsAffected = pstmt.executeUpdate();
            isSaved = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }

    // Method to get a user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        String query = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setGender(rs.getString("gender"));
                    user.setAbout(rs.getString("about"));
                    user.setDatetime(rs.getTimestamp("rdate"));
                    user.setProfile(rs.getString("profile"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Method to update user details in the database
    public boolean updateUser(User user) {
        boolean isUpdated = false;
        String query = "UPDATE user SET name = ?, email = ?, password = ?, gender = ?, about = ?, profile = ? WHERE id = ?";
        
        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            // Execute update
            int rowsAffected = pstmt.executeUpdate();
            isUpdated = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
}
