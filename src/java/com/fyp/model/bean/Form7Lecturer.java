/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form7Lecturer extends FormTeach {     
    private String presentDate;    
    private int knowledge;         
    private int overallProject;    
    private int presentMaterial;   
    private int delivery;          
    private int total;             
    private String comment;        
    private String role ;           
    private String agreement;         
    private String date;

    public Form7Lecturer(int formtId, String presentDate, int knowledge, int overallProject,
                 int presentMaterial, int delivery, int total, String comment,
                 String role, String agreement, String date) {
        super(formtId);
        this.presentDate = presentDate;
        this.knowledge = knowledge;
        this.overallProject = overallProject;
        this.presentMaterial = presentMaterial;
        this.delivery = delivery;
        this.total = total;
        this.comment = comment;
        this.role = role;
        this.agreement = agreement;
        this.date = date;
    }
    
    

    public String getPresentDate() {
        return presentDate;
    }

    public int getKnowledge() {
        return knowledge;
    }

    public int getOverallProject() {
        return overallProject;
    }

    public int getPresentMaterial() {
        return presentMaterial;
    }

    public int getDelivery() {
        return delivery;
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

    public void setPresentDate(String presentDate) {
        this.presentDate = presentDate;
    }

    public void setKnowledge(int knowledge) {
        this.knowledge = knowledge;
    }

    public void setOverallProject(int overallProject) {
        this.overallProject = overallProject;
    }

    public void setPresentMaterial(int presentMaterial) {
        this.presentMaterial = presentMaterial;
    }

    public void setDelivery(int delivery) {
        this.delivery = delivery;
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
