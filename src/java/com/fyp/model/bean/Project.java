
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Project {
    private int proId;
    private int studentId;
    private int lId;
    private String proTitle;
    private String domain;
    private String proUrl;
    private String session;
    private int scopeId;
    private int proposalId;
    
    public Project(int proId,int studentId, int lId, String proTitle,String domain,String proUrl, String session, int scopeId, int proposalId ){
        this.proId=proId;
        this.studentId=studentId;
        this.lId=lId;
        this.domain=domain;
        this.proUrl=proUrl;
        this.proTitle=proTitle;
        this.session=session;
        this.scopeId=scopeId;
        this.proposalId=proposalId;
    }

    public int getProId() {
        return proId;
    }

    public int getStudentId() {
        return studentId;
    }

    public int getlId() {
        return lId;
    }

    public String getProTitle() {
        return proTitle;
    }

    public String getDomain() {
        return domain;
    }

    public String getProUrl() {
        return proUrl;
    }

    public String getSession() {
        return session;
    }

    public int getScopeId() {
        return scopeId;
    }

    public int getProposalId() {
        return proposalId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public void setProTitle(String proTitle) {
        this.proTitle = proTitle;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public void setProUrl(String proUrl) {
        this.proUrl = proUrl;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public void setScopeId(int scopeId) {
        this.scopeId = scopeId;
    }

    public void setProposalId(int proposalId) {
        this.proposalId = proposalId;
    }
    
    

    
    
}
