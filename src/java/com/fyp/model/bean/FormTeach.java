/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class FormTeach {
    private int formTId;
    private int studentId;
    private int tId;
    private int proId;
    
    public FormTeach(int formTId, int studentId, int tId, int proId){
        this.formTId=formTId;
        this.studentId=studentId;
        this.tId=tId;
        this.proId=proId;
    }
    
    public FormTeach(int formTId){
        this.formTId=formTId;
    }

    public int getFormTId() {
        return formTId;
    }

    public int getStudentId() {
        return studentId;
    }

    public int gettId() {
        return tId;
    }

    public int getProId() {
        return proId;
    }

    public void setFormTId(int formTId) {
        this.formTId = formTId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }
    
    
    
}
