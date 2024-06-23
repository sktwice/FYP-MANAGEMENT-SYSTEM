/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form8Supervisor extends FormTeach {
    
    private String handoverDate;         
    private int proBackground;         
    private int objective;             
    private int significance;          
    private int literature;            
    private int proMethodology;        
    private int presentReport;         
    private int progressEvaluate;      
    private int total;                 
    private String comment;            
    private String role;               
    private String agreement;             
    private String date;

    public Form8Supervisor(int formtId,String handoverDate, int proBackground, int objective,
                 int significance, int literature, int proMethodology, int presentReport,
                 int progressEvaluate, int total, String comment, String role,
                 String agreement, String date) {
        super(formtId);
        
        this.handoverDate = handoverDate;
        this.proBackground = proBackground;
        this.objective = objective;
        this.significance = significance;
        this.literature = literature;
        this.proMethodology = proMethodology;
        this.presentReport = presentReport;
        this.progressEvaluate = progressEvaluate;
        this.total = total;
        this.comment = comment;
        this.role = role;
        this.agreement = agreement;
        this.date = date;
    }

    public String getHandoverDate() {
        return handoverDate;
    }

    public int getProBackground() {
        return proBackground;
    }

    public int getObjective() {
        return objective;
    }

    public int getSignificance() {
        return significance;
    }

    public int getLiterature() {
        return literature;
    }

    public int getProMethodology() {
        return proMethodology;
    }

    public int getPresentReport() {
        return presentReport;
    }

    public int getProgressEvaluate() {
        return progressEvaluate;
    }

    public int getTotal() {
        return total;
    }

    public String getComment() {
        return comment;
    }
    
    public String getAgreement() {
        return agreement;
    }

    public String getDate() {
        return date;
    }

    public void setHandoverDate(String handoverDate) {
        this.handoverDate = handoverDate;
    }

    public void setProBackground(int proBackground) {
        this.proBackground = proBackground;
    }

    public void setObjective(int objective) {
        this.objective = objective;
    }

    public void setSignificance(int significance) {
        this.significance = significance;
    }

    public void setLiterature(int literature) {
        this.literature = literature;
    }

    public void setProMethodology(int proMethodology) {
        this.proMethodology = proMethodology;
    }

    public void setPresentReport(int presentReport) {
        this.presentReport = presentReport;
    }

    public void setProgressEvaluate(int progressEvaluate) {
        this.progressEvaluate = progressEvaluate;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setAgreement(String agreement) {
        this.agreement = agreement;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
