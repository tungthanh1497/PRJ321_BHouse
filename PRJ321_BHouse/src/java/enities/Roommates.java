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
public class Roommates {

    String name;
    String phoneNum;
    java.sql.Date joinDate;

    public Roommates(String name, String phoneNum, Date joinDate) {
        this.name = name;
        this.phoneNum = phoneNum;
        this.joinDate = joinDate;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @Override
    public String toString() {
        return "Roommates{" + "name=" + name + ", phoneNum=" + phoneNum + ", joinDate=" + joinDate + '}';
    }

}
