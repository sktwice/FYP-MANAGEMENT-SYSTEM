/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form3 extends FormTeach {
    
    private int relevance;
    private int knowledge;
    private int writing;
    private int total;
    private String agreement;
    private String date;
    
    public Form3(int formtId
                ,int relevance, int knowledge, int writing, int total, String agreement, String date) {
        super(formtId);
        this.relevance=relevance;
        this.knowledge=knowledge;
        this.writing=writing;
        this.total=total;
        this.agreement=agreement;
        this.date=date;
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
    
    
}
