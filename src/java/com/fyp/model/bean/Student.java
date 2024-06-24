/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Student {
    private int studentId;
    private int fId;
    private int loginId;
    private int adminId;
    private String sName;
    private int semester;
    private String sImage;
    private String sCourse;
    private int phoneNum;
    
    public Student(int studentId,int fId,int loginId, int adminId, String sName, int semester, String sImage,String sCourse, int phoneNum){
        this.studentId=studentId;
        this.fId=fId;
        this.loginId=loginId;
        this.adminId=adminId;
        this.sName=sName;
        this.semester=semester;
        this.sImage=sImage;
        this.sCourse=sCourse;
        this.phoneNum=phoneNum;
    }

    public Student() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    

    public int getStudentId() {
        return studentId;
    }

    public int getfId() {
        return fId;
    }

    public String getsName() {
        return sName;
    }

    public int getSemester() {
        return semester;
    }

    public String getsImage() {
        return sImage;
    }

    public int getPhoneNum() {
        return phoneNum;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    
    public void setsImage(String sImage) {
        this.sImage = sImage;
    }

    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getLoginId() {
        return loginId;
    }

    public int getAdminId() {
        return adminId;
    }

    public String getsCourse() {
        return sCourse;
    }

    public void setsCourse(String sCourse) {
        this.sCourse = sCourse;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
    
    
}
