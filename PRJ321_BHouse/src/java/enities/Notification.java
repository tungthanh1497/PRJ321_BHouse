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
public class Notification {

    private int notificationID;
    private String title;
    private String detail;
    private java.sql.Date dateCreated;

    public Notification(int notificationID, String title, String detail, Date dateCreated) {
        this.notificationID = notificationID;
        this.title = title;
        this.detail = detail;
        this.dateCreated = dateCreated;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Override
    public String toString() {
        return "Notification{" + "notificationID=" + notificationID + ", title=" + title + ", detail=" + detail + ", dateCreated=" + dateCreated + '}';
    }

}
