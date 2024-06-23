/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Supervisor {
    private int svId;
    private int status;
    private int lId;
    
    public Supervisor(int svId, int status, int lId){
        this.svId=svId;
        this.status=status;
        this.lId=lId;
    }

    public Supervisor(int svId, int lId) {
        this.svId=svId;
        this.lId=lId;
    }

    public int getSvId() {
        return svId;
    }

    public int getStatus() {
        return status;
    }

    public void setSvId(int svId) {
        this.svId = svId;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }
    
    
}
