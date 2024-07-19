/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fyp.model.bean;

/**
 *
 * @author User
 */
public class Form6 extends FormTeach {
    
    private String submitDate;
    private String stuApproval;
    private int similarityIndex;
    private String svApproval;
    private String svDate;
    private String dateApprove; 
    
    
    public Form6(int formtId, 
            String submitDate, String stuApproval, int similarityIndex, String svApproval, String svDate, String dateApprove) {
        super(formtId);
        this.submitDate=submitDate;
        this.stuApproval=stuApproval;
        this.similarityIndex=similarityIndex;
        this.svApproval=svApproval;
        this.svDate=svDate;
        this.dateApprove=dateApprove;
    }

    public Form6(int formtId, String submitDate, String stuApproval) {
        super(formtId);
        this.submitDate=submitDate;
        this.stuApproval=stuApproval;
    } 
    
    public Form6(int formtId,int similarityIndex, String svApproval, String dateApprove) {
        super(formtId);
        this.similarityIndex=similarityIndex;
        this.svApproval=svApproval;
        this.dateApprove=dateApprove;
    }

    public String getSumbitDate() {
        return submitDate;
    }

    public String getStuApproval() {
        return stuApproval;
    }

    public int getSimilarityIndex() {
        return similarityIndex;
    }

    public String getSvApproval() {
        return svApproval;
    }

    public String getSvDate() {
        return svDate;
    }

    public String getDateApprove() {
        return dateApprove;
    }

    public void setSumbitDate(String submitDate) {
        this.submitDate = submitDate;
    }

    public void setStuApproval(String stuApproval) {
        this.stuApproval = stuApproval;
    }

    public void setSimilarityIndex(int similarityIndex) {
        this.similarityIndex = similarityIndex;
    }

    public void setSvApproval(String svApproval) {
        this.svApproval = svApproval;
    }

    public void setSvDate(String svDate) {
        this.svDate = svDate;
    }

    public void setDateApprove(String dateApprove) {
        this.dateApprove = dateApprove;
    }
    
}
