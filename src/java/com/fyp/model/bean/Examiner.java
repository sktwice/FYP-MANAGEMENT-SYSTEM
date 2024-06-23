/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Examiner {
    private int exId;
    private int lId;
    private int status;
    
    public Examiner(int exId,int lId, int status){
        this.exId=exId;
        this.lId=lId;
        this.status=status;
    }

    public int getExId() {
        return exId;
    }

    public int getlId() {
        return lId;
    }

    public int getStatus() {
        return status;
    }

    public void setExId(int exId) {
        this.exId = exId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
