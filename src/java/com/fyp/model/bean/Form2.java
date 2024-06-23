/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form2 extends FormTeach {
    
    private int proIdentity;
    private int evidence;
    private int solution;
    private int total;
    private String agreement;
    private String date;

    public Form2(int formtId, int studentId, int tId, int proId, int proIdentity, int evidence, int solution, int total, String agreement, String date) {
        super(formtId);
        this.proIdentity=proIdentity;
        this.evidence=evidence;
        this.solution=solution;
        this.total=total;
        this.agreement=agreement;
        this.date=date;
    }
    
    public Form2(int formtId, int proIdentity, int evidence, int solution, int total, String agreement, String date) {
        super(formtId);
        this.proIdentity=proIdentity;
        this.evidence=evidence;
        this.solution=solution;
        this.total=total;
        this.agreement=agreement;
        this.date=date;
    }

    public int getProIdentity() {
        return proIdentity;
    }

    public int getEvidence() {
        return evidence;
    }

    public int getSolution() {
        return solution;
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

    public void setProIdentity(int proIdentity) {
        this.proIdentity = proIdentity;
    }

    public void setEvidence(int evidence) {
        this.evidence = evidence;
    }

    public void setSolution(int solution) {
        this.solution = solution;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setAgreement(String agreement) {
        this.agreement = agreement;
    }

    public void setDate(String date) {
        this.date= date;
    }
    
    
}
