/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Teach {
    private int tId;
    private int lId;
    private int status;
    
    public Teach(int tId,int lId,int status){
        this.tId=tId;
        this.lId=lId;
        this.status=status;
    }

    public int gettId() {
        return tId;
    }

    public int getlId() {
        return lId;
    }

    public int getStatus() {
        return status;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
