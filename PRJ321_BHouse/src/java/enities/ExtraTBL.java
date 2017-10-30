/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enities;

import java.sql.Date;

/**
 *
 * @author Chu Anh
 */
public class ExtraTBL {
    private int extraID;
    private int roomNumber;
    private String extraName;
    private int extraNumber;
    private int price;
    private String detail;
    private java.sql.Date extraDate;

    public ExtraTBL(int extraID, int roomNumber, String extraName, int extraNumber, int price, String detail, Date extraDate) {
        this.extraID = extraID;
        this.roomNumber = roomNumber;
        this.extraName = extraName;
        this.extraNumber = extraNumber;
        this.price = price;
        this.detail = detail;
        this.extraDate = extraDate;
    }

    public int getExtraID() {
        return extraID;
    }

    public void setExtraID(int extraID) {
        this.extraID = extraID;
    }   

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getExtraName() {
        return extraName;
    }

    public void setExtraName(String extraName) {
        this.extraName = extraName;
    }

    public int getExtraNumber() {
        return extraNumber;
    }

    public void setExtraNumber(int extraNumber) {
        this.extraNumber = extraNumber;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getExtraDate() {
        return extraDate;
    }

    public void setExtraDate(Date extraDate) {
        this.extraDate = extraDate;
    }
    
    
}
