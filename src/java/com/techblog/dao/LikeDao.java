/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import java.sql.*;

/**
 *
 * @author vamsh
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pId, int uId) {
        boolean flag = false;
        try {

            String query = "insert into likes(pid,uid) values(?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pId);
            pstmt.setInt(2, uId);

            pstmt.executeUpdate();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        String query = "select count(*) from likes where pid=?";

        try {

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikedByUser(int pId, int uId) {
        boolean flag = false;

        try {

            String query = "select * from likes where pid=? and uid=?";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, pId);
            pstmt.setInt(2, uId);

            pstmt.executeUpdate();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean deleteLike(int pId, int uId) {
        boolean flag = false;

        try {

            String query = "delete from likes where pid=? and uid=?";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pId);
            pstmt.setInt(2, uId);

            pstmt.executeUpdate();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

}
