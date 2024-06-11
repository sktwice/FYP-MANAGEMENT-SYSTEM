
package com.fyp.model.bean;


public class Supervision {

    private String protitle;
    private String lecturerName;
    private int matricId;
    private String Session;

    public Supervision(String protitle, String lecturerName , int matricId , String Session) {
        this.protitle = protitle;
        this.lecturerName = lecturerName;
        this.matricId = matricId;
        this.Session = Session;
    }

    public int getMatricId() {
        return matricId;
    }

    public void setMatricId(int matricId) {
        this.matricId = matricId;
    }

    public String getSession() {
        return Session;
    }

    public void setSession(String Session) {
        this.Session = Session;
    }

    public String getProtitle() {
        return protitle;
    }

    public void setProtitle(String protitle) {
        this.protitle = protitle;
    }

 

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }
}

