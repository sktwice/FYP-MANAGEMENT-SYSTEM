/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form5 extends Form {
    
    private String dateMeet;
    private String completeActivity;
    private String nextActivity;
    private String approval;
    
    public Form5(int formId, int studentId, int lId, int proId,
            String dateMeet, String completeActivity, String nextActivity, String approval) {
        super(formId, studentId, lId, proId);
        
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
    
    
    
}
