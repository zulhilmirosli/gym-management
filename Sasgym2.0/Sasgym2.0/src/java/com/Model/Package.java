/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author Muhammad Zulhilmi Bin Rosli S61807
 */
public class Package {

    private String packageID;
    private String packageDesc;
    private int price;

    public Package(String packageID, String packageDesc, int price) {
        this.packageID = packageID;
        this.packageDesc = packageDesc;
        this.price = price;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
