/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Admin {
    private int adminId;
    private int loginId;
    private String aImage;
    private String aName;
    private int phoneNum;
    private String email;
    
    public Admin(int adminId, int loginId, String aImage, String aName, int phoneNum, String email ){
        this.adminId=adminId;
        this.loginId=loginId;
        this.aImage=aImage;
        this.aName=aName;
        this.phoneNum=phoneNum;
        this.email=email;
    }

    public Admin() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getAdminId() {
        return adminId;
    }

    public int getLoginId() {
        return loginId;
    }

    public String getaImage() {
        return aImage;
    }

    public String getaName() {
        return aName;
    }

    public int getPhoneNum() {
        return phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    public void setaImage(String aImage) {
        this.aImage = aImage;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    
}
