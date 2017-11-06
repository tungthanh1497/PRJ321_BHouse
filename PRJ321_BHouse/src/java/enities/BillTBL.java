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
public class BillTBL {

    private int numPer;
    private int roomNumber;
    private int defaultFee;
    private int electricity;
    private int extraFee;
    private java.sql.Date monthBill;

    public BillTBL(int numPer, int roomNumber, int defaultFee, int electricity, int extraFee, Date monthBill) {
        this.numPer = numPer;
        this.roomNumber = roomNumber;
        this.defaultFee = defaultFee;
        this.electricity = electricity;
        this.extraFee = extraFee;
        this.monthBill = monthBill;
    }

    public int getNumPer() {
        return numPer;
    }

    public void setNumPer(int numPer) {
        this.numPer = numPer;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getDefaultFee() {
        return defaultFee;
    }

    public void setDefaultFee(int defaultFee) {
        this.defaultFee = defaultFee;
    }

    public int getElectricity() {
        return electricity;
    }

    public void setElectricity(int electricity) {
        this.electricity = electricity;
    }

    public int getExtraFee() {
        return extraFee;
    }

    public void setExtraFee(int extraFee) {
        this.extraFee = extraFee;
    }

    public Date getMonthBill() {
        return monthBill;
    }

    public void setMonthBill(Date monthBill) {
        this.monthBill = monthBill;
    }

    @Override
    public String toString() {
        return "BillTBL{" + "roomNumber=" + roomNumber + ", defaultFee=" + defaultFee + ", electricity=" + electricity + ", extraFee=" + extraFee + ", monthBill=" + monthBill + '}';
    }
}
