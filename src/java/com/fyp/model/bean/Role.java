/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Role {
    private int roleId;
    private int lId;
    private String position;
    private String status;
    
    public Role(int roleId, int lId, String position, String status){
        this.roleId=roleId;
        this.lId=lId;
        this.position=position;
        this.status=status;
    }

    public Role(String position, String status) {
        this.position = position;
        this.status = status;
    }

    public int getRoleId() {
        return roleId;
    }

    public int getlId() {
        return lId;
    }

    public String getPosition() {
        return position;
    }

    public String getStatus() {
        return status;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
