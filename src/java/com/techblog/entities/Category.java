/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

/**
 *
 * @author vamsh
 */
public class Category {

    private int cId;
    private String cName;
    private String cDesc;

    public Category(int cId, String cName, String cDesc) {
        this.cId = cId;
        this.cName = cName;
        this.cDesc = cDesc;
    }

    public Category() {
    }

    public Category(String cName, String cDesc) {
        this.cName = cName;
        this.cDesc = cDesc;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDesc() {
        return cDesc;
    }

    public void setcDesc(String cDesc) {
        this.cDesc = cDesc;
    }

}
