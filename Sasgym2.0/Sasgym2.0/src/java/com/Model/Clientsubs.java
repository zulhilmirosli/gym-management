/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author Muhammad Zulhilmi Bin Rosli S61807
 */
public class Clientsubs {

    protected int subsNo, id;
    protected String packageID, packageDesc;
    protected String bookingDate;
    //protected int trainer;

    public Clientsubs(int id, String packageID, String packageDesc, String bookingDate) {
        super();
        this.packageID = packageID;
        this.packageDesc = packageDesc;
        this.bookingDate = bookingDate;
        this.id = id;
    }
    

    public Clientsubs(int subsNo, int id, String packageID, String packageDesc, String bookingDate) {
        super();
        this.subsNo = subsNo;
        this.packageID = packageID;
        this.packageDesc = packageDesc;
        this.bookingDate = bookingDate;
        this.id = id;
    }

    public int getSubsNo() {
        return subsNo;
    }

    public void setSubsNo(int subsNo) {
        this.subsNo = subsNo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPackageID() {
        return packageID;
    }

    public void setPackageID(String packageID) {
        this.packageID = packageID;
    }

    public String getPackageDesc() {
        return packageDesc;
    }

    public void setPackageDesc(String packageDesc) {
        this.packageDesc = packageDesc;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

}
