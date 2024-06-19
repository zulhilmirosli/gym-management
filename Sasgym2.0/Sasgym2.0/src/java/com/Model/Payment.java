/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author Muhammad Ariq Iskandar S62678
 */
public class Payment {

    private String full_name, card_number, expiry, cvv_cvc;
    private int amount, subsID;

    public Payment(int subsID, String full_name, String card_number, String expiry, String cvv_cvc, int amount) {
        this.subsID = subsID;
        this.full_name = full_name;
        this.card_number = card_number;
        this.expiry = expiry;
        this.cvv_cvc = cvv_cvc;
        this.amount = amount;
    }

    public Payment() {
    }

    public int getSubsID() {
        return subsID;
    }

    public String getFull_name() {
        return full_name;
    }

    public String getCard_number() {
        return card_number;
    }

    public String getExpiry() {
        return expiry;
    }

    public String getCvv_cvc() {
        return cvv_cvc;
    }

    public int getAmount() {
        return amount;
    }

}
