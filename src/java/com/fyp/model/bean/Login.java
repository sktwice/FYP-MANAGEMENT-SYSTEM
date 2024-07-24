/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Login {
    private int loginId;
    private String username;
    private String password;
    private String category;
    
    
    public Login(String username, String password, String category) {
        
        this.username=username;
        this.password=password;
        this.category=category;
    }
    
    public Login(int loginId, String username, String password, String category) {
        this.loginId=loginId;
        this.username=username;
        this.password=password;
        this.category=category;
    }
    public Login(){}

    public int getLoginId() {
        return loginId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getCategory() {
        return category;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
}
