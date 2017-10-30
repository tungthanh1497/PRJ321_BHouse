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
public class RoomInfoTBL {
    private int roomNumber;
    private int roomTypeID;
    private int numPerson;
    private byte available;

    public RoomInfoTBL(int roomNumber, int roomTypeID, int numPerson, byte available) {
        this.roomNumber = roomNumber;
        this.roomTypeID = roomTypeID;
        this.numPerson = numPerson;
        this.available = available;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public int getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(int numPerson) {
        this.numPerson = numPerson;
    }

    public byte getAvailable() {
        return available;
    }

    public void setAvailable(byte available) {
        this.available = available;
    }
    
}
