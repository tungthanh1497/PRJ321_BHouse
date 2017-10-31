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
public class RoomContent {
    int roomNum ;
    String cusName ;
    String identityCard;
    String phoneNum;
    String parentPhoneNum;
    java.sql.Date dateJoin ;
    int numPerson ;
    int roomType ;
    int price ;
    int optional;
    int closed;
    String note;

    public RoomContent(int roomNum, String cusName, String identityCard, String phoneNum, String parentPhoneNum, Date dateJoin, int numPerson, int roomType, int price, int optional, int closed, String note) {
        this.roomNum = roomNum;
        this.cusName = cusName;
        this.identityCard = identityCard;
        this.phoneNum = phoneNum;
        this.parentPhoneNum = parentPhoneNum;
        this.dateJoin = dateJoin;
        this.numPerson = numPerson;
        this.roomType = roomType;
        this.price = price;
        this.optional = optional;
        this.closed = closed;
        this.note = note;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getParentPhoneNum() {
        return parentPhoneNum;
    }

    public void setParentPhoneNum(String parentPhoneNum) {
        this.parentPhoneNum = parentPhoneNum;
    }

    public Date getDateJoin() {
        return dateJoin;
    }

    public void setDateJoin(Date dateJoin) {
        this.dateJoin = dateJoin;
    }

    public int getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(int numPerson) {
        this.numPerson = numPerson;
    }

    public int getRoomType() {
        return roomType;
    }

    public void setRoomType(int roomType) {
        this.roomType = roomType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOptional() {
        return optional;
    }

    public void setOptional(int optional) {
        this.optional = optional;
    }

    public int getClosed() {
        return closed;
    }

    public void setClosed(int closed) {
        this.closed = closed;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "RoomContent{" + "roomNum=" + roomNum + ", cusName=" + cusName + ", identityCard=" + identityCard + ", phoneNum=" + phoneNum + ", parentPhoneNum=" + parentPhoneNum + ", dateJoin=" + dateJoin + ", numPerson=" + numPerson + ", roomType=" + roomType + ", price=" + price + ", optional=" + optional + ", closed=" + closed + ", note=" + note + '}';
    }
    
    
    
}
