/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enities;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class AllInfoInRoom {
 
    int roomNumber;
    int Price;
    boolean optional;
    boolean closed;
    boolean available;
    ArrayList<String> namePerson;
    ArrayList<Integer> customerID;

    public AllInfoInRoom(int roomNumber, int Price, boolean optional, boolean closed, boolean available, ArrayList<String> namePerson, ArrayList<Integer> customerID) {
        this.roomNumber = roomNumber;
        this.Price = Price;
        this.optional = optional;
        this.closed = closed;
        this.available = available;
        this.namePerson = namePerson;
        this.customerID = customerID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
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

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public ArrayList<String> getNamePerson() {
        return namePerson;
    }

    public void setNamePerson(ArrayList<String> namePerson) {
        this.namePerson = namePerson;
    }

    public ArrayList<Integer> getCustomerID() {
        return customerID;
    }

    public void setCustomerID(ArrayList<Integer> customerID) {
        this.customerID = customerID;
    }

    
}
