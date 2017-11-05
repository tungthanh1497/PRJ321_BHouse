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
    private boolean optional;
    private boolean closed;
    private int price;
    private String note;

    public RoomTypeTBL(int roomTypeID, boolean optional, boolean closed, int price, String note) {
        this.roomTypeID = roomTypeID;
        this.optional = optional;
        this.closed = closed;
        this.price = price;
        this.note = note;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public boolean isOptional() {
        return optional;
    }

    public void setOptional(boolean optional) {
        this.optional = optional;
    }

    public boolean isClosed() {
        return closed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
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
