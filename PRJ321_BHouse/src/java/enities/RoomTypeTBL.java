/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enities;

/**
 *
 * @author Chu Anh
 */
public class RoomTypeTBL {
    private int roomTypeID;
    private byte optional;
    private byte bit;
    private int price;
    private String note;

    public RoomTypeTBL(int roomTypeID, byte optional, byte bit, int price, String note) {
        this.roomTypeID = roomTypeID;
        this.optional = optional;
        this.bit = bit;
        this.price = price;
        this.note = note;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public byte getOptional() {
        return optional;
    }

    public void setOptional(byte optional) {
        this.optional = optional;
    }

    public byte getBit() {
        return bit;
    }

    public void setBit(byte bit) {
        this.bit = bit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
