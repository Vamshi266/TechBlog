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

public class User {
    
    private int id;
    private String user_name;
    private String user_email;
    private String user_password;
    private String gender;
    private String about;
    private String profile;

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    //all args constructor
    public User(int id, String user_name, String user_email, String user_password, String gender, String about, Timestamp reg_date) {
        this.id = id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_password = user_password;
        this.gender = gender;
        this.about = about;
        this.reg_date = reg_date;
    }
    private Timestamp reg_date;

    //no args contructor
    public User() {
    }

    
    //all args constructor excluding 'id'
    public User(String user_name, String user_email, String user_password, String gender, String about) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_password = user_password;
        this.gender = gender;
        this.about = about;
    }
    
//    getters and setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }
    
    
    
    
}
