/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enities;

/**
 *
 * @author lenovo
 */
public class RoomStatus {
    int roomNumber;
    boolean optional;
    boolean closed;
    int numPerson;
    int price;
    boolean available;

    public RoomStatus(int roomNumber, boolean optional, boolean closed, int numPerson, int price, boolean available) {
        this.roomNumber = roomNumber;
        this.optional = optional;
        this.closed = closed;
        this.numPerson = numPerson;
        this.price = price;
        this.available = available;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
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

    public int getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(int numPerson) {
        this.numPerson = numPerson;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
    
    
 
    
}
