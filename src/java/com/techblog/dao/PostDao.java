/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

/**
 *
 * @author vamsh
 */
import com.techblog.entities.Category;
import com.techblog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> al = new ArrayList<>();

        try {

            String query = "select * from categories";

            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(query);

            while (rs.next()) {
                int cId = rs.getInt("cid");
                String cName = rs.getString("cname");
                String cDesc = rs.getString("cdesc");

                Category category = new Category(cId, cName, cDesc);

                al.add(category);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return al;
    }

    public boolean savePost(Post post) {
        boolean flag = false;

        try {

            String query = "insert into posts(ptitle,pcontent,pic,uid,cid) values (?,?,?,?,?);";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, post.getpTitle());
            pstmt.setString(2, post.getpContent());
            pstmt.setString(3, post.getPic());
            pstmt.setInt(4, post.getcId());
            pstmt.setInt(5, post.getuId());

            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return flag;
    }

}
