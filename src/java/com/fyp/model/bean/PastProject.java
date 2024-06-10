package com.fyp.model.bean;

public class PastProject {
    private int proId;
    private int lId;
    private int adminId;
    private String studentName;
    private int studentId;
    private String proTitle;
    private String session;
    private String proPdf;

    public PastProject(int proId, int lId, int adminId, String studentName, int studentId, String proTitle, String session, String proPdf) {
        this.proId = proId;
        this.lId = lId;
        this.adminId = adminId;
        this.studentName = studentName;
        this.studentId = studentId;
        this.proTitle = proTitle;
        this.session = session;
        this.proPdf = proPdf;
    }

    // Getters
    public int getProId() {
        return proId;
    }

    public int getLId() {
        return lId;
    }

    public int getAdminId() {
        return adminId;
    }

    public String getStudentName() {
        return studentName;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getProTitle() {
        return proTitle;
    }

    public String getSession() {
        return session;
    }

    public String getProPdf() {
        return proPdf;
    }

    // Setters
    public void setProId(int proId) {
        this.proId = proId;
    }

    public void setLId(int lId) {
        this.lId = lId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setProTitle(String proTitle) {
        this.proTitle = proTitle;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public void setProPdf(String proPdf) {
        this.proPdf = proPdf;
    }
}




