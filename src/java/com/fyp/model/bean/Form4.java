/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form4 extends Form {
    
    private int design;
    private int description;
    private int model;
    private int total;
    private String agreement;
    private String date;
    private int loginId;
    
    public Form4(int formId, int studentId, int lId, int proId, 
            int design, int description, int model, int total, String agreement, String date, int loginId) {
        super(formId, studentId, lId, proId);
        this.design=design;
        this.description=description;
        this.model=model;
        this.total=total;
        this.agreement=agreement;
        this.date=date;
        this.loginId=loginId;
    }
    
    

    public int getDesign() {
        return design;
    }

    public int getDescription() {
        return description;
    }

    public int getModel() {
        return model;
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

    public void setDesign(int design) {
        this.design = design;
    }

    public void setDescription(int description) {
        this.description = description;
    }

    public void setModel(int model) {
        this.model = model;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setAgreement(String agreement) {
        this.agreement = agreement;
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
