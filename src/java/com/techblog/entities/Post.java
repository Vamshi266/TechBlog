/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

/**
 *
 * @author vamsh
 */
import java.sql.*;

public class Post {

    private int pId;
    private String pTitle;
    private String pContent;
    private String pic;
    private Timestamp regDate;
    private int cId;
    private int uId;

    public Post(int pId, String pTitle, String pContent, String pic, Timestamp regDate, int cId, int uId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pic = pic;
        this.regDate = regDate;
        this.cId = cId;
        this.uId = uId;
    }

    public Post(String pTitle, String pContent, String pic, Timestamp regDate, int cId, int uId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pic = pic;
        this.regDate = regDate;
        this.cId = cId;
        this.uId = uId;
    }

    public Post() {
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

}
