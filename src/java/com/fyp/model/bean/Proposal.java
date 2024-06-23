package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Proposal {
    private int proposalId;
    private int studentId;
    private int svId;
    private int scopeId;
    private String topic;
    private String semester;
    private String pdfUrl;
    private String pdfName;
    private String status;
    private String domain;
    
    /**
     *
     * @param proposalId
     * @param studentId
     * @param lId
     * @param scopeId
     * @param topic
     * @param semester
     * @param pdfUrl
     * @param pdfName
     * @param status
     */
  

    public Proposal(int proposalId, int studentId, int svId, int scopeId, String topic, String session, String pdfUrl, String pdfName, String status, String domain) {
        this.proposalId=proposalId;
        this.studentId=studentId;
        this.svId=svId;
        this.scopeId=scopeId;
        this.topic=topic;
        this.semester=session;
        this.pdfUrl=pdfUrl;
        this.pdfName=pdfName;
        this.status=status;
        this.domain=domain;
    }
    
    

    public int getProposalId() {
        return proposalId;
    }

    public int getStudentId() {
        return studentId;
    }

    public int getSvId() {
        return svId;
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

    public void setSvId(int svId) {
        this.svId = svId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }
    
    
}