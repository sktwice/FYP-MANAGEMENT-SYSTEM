package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Proposal {
    private int proposalId;
    private int studentId;
    private int lId;
    private int scopeId;
    private String topic;
    private String semester;
    private String pdfUrl;
    private String pdfName;
    
    public Proposal(int proposalId,int studentId, int lId,int scopeId, String topic,String semester,String pdfUrl, String pdfName){
        this.proposalId=proposalId;
        this.studentId=studentId;
        this.lId=lId;
        this.scopeId=scopeId;
        this.topic=topic;
        this.semester=semester;
        this.pdfUrl=pdfUrl;
        this.pdfName=pdfName;
    }

    public int getProposalId() {
        return proposalId;
    }

    public int getStudentId() {
        return studentId;
    }

    public int getlId() {
        return lId;
    }

    public int getScopeId() {
        return scopeId;
    }

    public String getTopic() {
        return topic;
    }

    public String getSemester() {
        return semester;
    }

    public String getPdfUrl() {
        return pdfUrl;
    }

    public String getPdfName() {
        return pdfName;
    }

    public void setProposalId(int proposalId) {
        this.proposalId = proposalId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    public void setScopeId(int scopeId) {
        this.scopeId = scopeId;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setPdfUrl(String pdfUrl) {
        this.pdfUrl = pdfUrl;
    }

    public void setPdfName(String pdfName) {
        this.pdfName = pdfName;
    }
    
    
}