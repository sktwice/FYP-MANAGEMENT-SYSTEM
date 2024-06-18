/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form3 extends Form {
    
    private int relevance;
    private int knowledge;
    private int writing;
    private int total;
    private String agreement;
    private String date;
    private int loginId;
    
    public Form3(int formId, int studentId, int lId, int proId
                ,int relevance, int knowledge, int writing, int total, String agreement, String date, int loginId) {
        super(formId, studentId, lId, proId);
        this.relevance=relevance;
        this.knowledge=knowledge;
        this.writing=writing;
        this.total=total;
        this.agreement=agreement;
        this.date=date;
        this.loginId=loginId;
    }
    
    

    public int getRelevance() {
        return relevance;
    }

    public int getKnowledge() {
        return knowledge;
    }

    public int getWriting() {
        return writing;
    }

    public int getTotal() {
        return total;
    }

    public String getAgreement() {
        return agreement;
    }

    public String getDate() {
        return date;
    }

    public void setRelevance(int relevance) {
        this.relevance = relevance;
    }

    public void setKnowledge(int knowledge) {
        this.knowledge = knowledge;
    }

    public void setWriting(int writing) {
        this.writing = writing;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setAgreement(String agreement) {
        this.agreement= agreement;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getLoginId() {
        return loginId;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }
    
    
}
