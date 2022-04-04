/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author area1
 */
public class Payment {

    private int id;
    private Contract contractID;
    private Timestamp paidDate;
    private String paymentMethod;
    private String note;
    private double amount;
    private Timestamp startDate;
    private PaymentMethod paymentMethod2;

    public Payment(int id, Contract contractID, Timestamp paidDate, String paymentMethod, String note, double amount, Timestamp startDate, PaymentMethod paymentMethod2) {
        this.id = id;
        this.contractID = contractID;
        this.paidDate = paidDate;
        this.paymentMethod = paymentMethod;
        this.note = note;
        this.amount = amount;
        this.startDate = startDate;
        this.paymentMethod2 = paymentMethod2;
    }

    public PaymentMethod getPaymentMethod2() {
        return paymentMethod2;
    }

    public void setPaymentMethod2(PaymentMethod paymentMethod2) {
        this.paymentMethod2 = paymentMethod2;
    }
    
    

    public Payment() {
    }

    
    public Payment(int id, Contract contractID, Timestamp paidDate, String paymentMethod, String note, double amount, Timestamp startDate) {
        this.id = id;
        this.contractID = contractID;
        this.paidDate = paidDate;
        this.paymentMethod = paymentMethod;
        this.note = note;
        this.amount = amount;
        this.startDate = startDate;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Contract getContractID() {
        return contractID;
    }

    public void setContractID(Contract contractID) {
        this.contractID = contractID;
    }

    public Timestamp getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Timestamp paidDate) {
        this.paidDate = paidDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
}
