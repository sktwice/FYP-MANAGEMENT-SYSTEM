package com.fyp.model.bean;

import java.util.List;
import java.util.stream.Collectors;

public class Lecturer {
    private int lId;
    private int fId;
    private int loginId;
    private int adminId;
    private String position;
    private String iImage;
    private String lName;
    private int phoneNum;
    private String email;
    private String lCourse;
    private String positions;
    private int svId;
    private int exId;

    // Add a new constructor to include positions
    public Lecturer(int lId, int fId, int loginId, int adminId, String position, String iImage, String lName, int phoneNum, String email, String lCourse, String positions) {
        this.lId = lId;
        this.fId = fId;
        this.loginId = loginId;
        this.adminId = adminId;
        this.position = position;
        this.iImage = iImage;
        this.lName = lName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.lCourse = lCourse;
        this.positions = positions;
    }
    
    public Lecturer(int lId,int fId,int loginId,int adminId,String position, String iImage,String lName, int phoneNum,String email,String lCourse){
        this.lId=lId;
        this.fId=fId;
        this.loginId=loginId;
        this.adminId=adminId;
        this.position=position;
        this.iImage=iImage;
        this.lName=lName;
        this.phoneNum=phoneNum;
        this.email=email;
        this.lCourse=lCourse;
    }
    
    public Lecturer(int lId, int fId, int loginId, int adminId, String position, String iImage, String lName, int phoneNum, String email, String lCourse, int svId) {
        this.lId = lId;
        this.fId = fId;
        this.loginId = loginId;
        this.adminId = adminId;
        this.position = position;
        this.iImage = iImage;
        this.lName = lName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.lCourse = lCourse;
        this.svId = svId; // Set the supervisor ID
    }

    public Lecturer() {
        
    }

    public Lecturer(int lId, String lName, int phoneNum, String email) {
        this.lId=lId;
        this.lName=lName;
        this.phoneNum=phoneNum;
        this.email=email;
    }

    public Lecturer(int id, String name, String position, String email) {
        this.lId = lId;
        this.fId = fId;
        this.loginId = loginId;
        this.adminId = adminId;
        this.position = position;
        this.iImage = iImage;
        this.lName = lName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.lCourse = lCourse;
        this.svId = svId; // Set the supervisor ID
    }


    public int getlId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public int getLoginId() {
        return loginId;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getiImage() {
        return iImage;
    }

    public void setiImage(String iImage) {
        this.iImage = iImage;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public int getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLCourse() {
        return lCourse;
    }

    public void setsCourse(String lCourse) {
        this.lCourse = lCourse;
    }

    public String getPositions() {
        return positions;
    }

     public void setPositions(String positions) {
        this.positions = positions;
    }
     
     public int getSvId() {
        return svId;
    }

    public void setSvId(int svId) {
        this.svId = svId;
    }
    
     public int getExId() {
        return exId;
    }

    public void setExId(int exId) {
        this.exId = exId;
    }
}