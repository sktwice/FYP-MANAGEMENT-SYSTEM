/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form5{
    
    private int formId;
    private String dateMeet;
    private String completeActivity;
    private String nextActivity;
    private String approval;
    private int proId;
    
    public Form5(int formId,String dateMeet, String completeActivity, String nextActivity, String approval, int proId) {
        this.formId=formId;
        this.dateMeet=dateMeet;
        this.completeActivity=completeActivity;
        this.nextActivity = nextActivity;
        this.approval=approval;
        this.proId=proId;
        
    }

    public Form5(int formId, int proId) {
        this.formId=formId;
        this.proId=proId;
    }

    public Form5(int formId, String dateMeet, String completeActivity, String nextActivity, String approval) {
        this.formId=formId;
        this.dateMeet=dateMeet;
        this.completeActivity=completeActivity;
        this.nextActivity = nextActivity;
        this.approval=approval;
    }

    public String getDateMeet() {
        return dateMeet;
    }

    public String getCompleteActivity() {
        return completeActivity;
    }

    public String getNextActivity() {
        return nextActivity;
    }

    public String getApproval() {
        return approval;
    }

    public void setDateMeet(String dateMeet) {
        this.dateMeet = dateMeet;
    }

    public void setCompleteActivity(String completeActivity) {
        this.completeActivity = completeActivity;
    }

    public void setNextActivity(String nextActivity) {
        this.nextActivity = nextActivity;
    }

    public void setApproval(String approval) {
        this.approval = approval;
    }

    public int getFormId() {
        return formId;
    }

    public int getProId() {
        return proId;
    }

    public void setFormId(int formId) {
        this.formId = formId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }
    
    
    
}
