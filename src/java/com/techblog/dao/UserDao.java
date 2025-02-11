/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.entities.User;
import java.sql.*;

/**
 *
 * @author vamsh
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //add user
    public boolean saveUser(User user) {
        boolean flag = false;

        try {

            String query = "INSERT INTO users(user_name,user_email,user_password,gender,about) values(?,?,?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getUser_email());
            pstmt.setString(3, user.getUser_password());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.execute();

            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {

        User user = null;

        try {

            String query = "select * from users where user_email=? and user_password=?";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rset = pstmt.executeQuery();

            //if user exists
            if (rset.next()) {
                user = new User();

                user.setId(rset.getInt("id"));
                user.setUser_name(rset.getString("user_name"));
                user.setUser_email(rset.getString("user_email"));
                user.setUser_password(rset.getString("user_password"));
                user.setGender(rset.getString("gender"));
                user.setAbout(rset.getString("about"));
                user.setReg_date(rset.getTimestamp("reg_date"));
                user.setProfile(rset.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean flag = false;

        try {

            String query = "update users set user_name=?,user_email=?,user_password=?,gender=?,about=?,profile=? where id = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getUser_email());
            pstmt.setString(3, user.getUser_password());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());

            pstmt.execute();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public User getUserByUserId(int userId) {
        User user = null;

        String query = "select * from users where id=?";

        try {

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_password(rs.getString("user_password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setReg_date(rs.getTimestamp("reg_date"));
                user.setProfile(rs.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
