/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databases;

import enities.BillTBL;
import enities.CustomerTBL;
import enities.ExtraTBL;
import enities.LoginTBL;
import enities.Notification;
import enities.RoomContent;
import enities.RoomInfoTBL;
import enities.RoomTypeTBL;
import enities.Roommates;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.LoginModel;

/**
 *
 * @author tungthanh.1497
 */
public class DBContext {

    ArrayList<Roommates> arrRoomMates = new ArrayList<>();//save information name and phonenumber of room mate
    ArrayList<BillTBL> arrBill = new ArrayList<>();//save all bill of your customer from join room to current time

    public ArrayList<BillTBL> getArrBill() {
        return arrBill;
    }

    public ArrayList<Roommates> getArrRoomMates() {
        return arrRoomMates;
    }

    public void setArrBill(ArrayList<BillTBL> arrBill) {
        this.arrBill = arrBill;
    }

    /*=======CHECK LOGIN=======
        return -1 if login fail
        return id of user if login success (greater or equals 0)
     */
    public int getLoginId(LoginModel loginModel) {
        try {
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "select * from LoginTBL where uname = '" + loginModel.getUname() + "'";
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String psw = rs.getString(3);
                if (psw.equals(loginModel.getPsw())) {
                    return rs.getInt(1);
                }
                break;
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    //get infomation for user view room content
    public RoomContent getRoomContent(int idUser) {
        RoomContent room = null;

        try {
            int roomNum = 0;
            String cusName = null;
            String identityCard = null;
            String phoneNum = null;
            String parentPhoneNum = null;
            java.sql.Date dateJoin = null;
            int numPerson = 0;
            int roomType = 0;
            int price;
            int optional;
            int closed;
            String note;
            BillTBL bill = null;
            java.sql.Date sqlDate = java.sql.Date.valueOf(LocalDate.now());
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "select * from CustomerTBL cus join RoomInfoTBL"
                    + " roomInfo on cus.roomNumber=roomInfo.roomNumber\n"
                    + "where cus.customerID = " + idUser;
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                roomNum = rs.getInt("roomNumber");
                cusName = rs.getString("customerName");
                identityCard = rs.getString("identityCard");
                phoneNum = rs.getString("phoneNumber");
                parentPhoneNum = rs.getString("parentsPhoneNumber");
                numPerson = rs.getInt("numPerson");
                dateJoin = rs.getDate("dateJoin");
                roomType = rs.getInt("roomTypeID");
            }
            sqlSelect = "select * from RoomTypeTBL type join RoomInfoTBL "
                    + "info on type.roomTypeID=info.roomTypeID\n"
                    + "where info.roomNumber = " + roomType;
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                optional = rs.getByte("optional");
                closed = rs.getByte("closed");
                price = rs.getInt("price");
                note = rs.getString("note");
                room = new RoomContent(roomNum, cusName, identityCard, phoneNum,
                        parentPhoneNum, dateJoin, numPerson, roomType, price,
                        optional, closed, note);
            }
            //if room have more 2 person , get infomation of roomates
            if (numPerson > 1) {
                sqlSelect = "select * from CustomerTBL where roomNumber = " + roomNum
                        + " and customerID != " + idUser;
                ps = conn.prepareStatement(sqlSelect);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("customerName");
                    String phoneNumber = rs.getString("phoneNumber");
                    java.sql.Date date = rs.getDate("dateJoin");
                    Roommates roomMate = new Roommates(name, phoneNum, date);
                    arrRoomMates.add(roomMate);
                }
            }
            sqlSelect = "select BillTBL.defaultFee,BillTBL.electricity, BillTBL.extraFee,BillTBL.monthBill , \n"
                    + "RoomInfoTBL.numPerson from BillTBL join RoomInfoTBL on BillTBL.roomNumber = RoomInfoTBL.roomNumber\n"
                    + " where monthBill between '" + dateJoin + "' and '" + sqlDate + "' and RoomInfoTBL.roomNumber =" + roomNum;
            ps = conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                int defaulFee, electricity, extra, numPer;
                java.sql.Date dateBill;
                defaulFee = rs.getInt("defaultFee");
                electricity = rs.getInt("electricity");
                extra = rs.getInt("extraFee");
                dateBill = rs.getDate("monthBill");
                numPer = rs.getInt("numPerson");
                bill = new BillTBL(numPer, roomNum, defaulFee, electricity, extra, dateBill);
                arrBill.add(bill);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return room;
    }
    //get information for user view extra bill of month 

    public ArrayList<ExtraTBL> getExtraFee(int roomNum, String month) {
        ArrayList<ExtraTBL> arrExtra = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        long l = java.sql.Date.parse(month);
        java.sql.Date sqlDate = new java.sql.Date(l);
        Calendar car = Calendar.getInstance();
        car.setTime(sqlDate);
        car.add(Calendar.MONTH, 1);
        try {
            int extraID;
            int roomNumber;
            String extraName;
            int extraNumber;
            int price;
            String detail;
            java.sql.Date extraDate;
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "select * from ExtraTBL extra where  "
                    + "extra.extraDate >= '" + sdf.format(sqlDate)
                    + "' and extra.extraDate "
                    + "< '" + sdf.format(car.getTime()) + "' and extra.roomNumber =" + roomNum;
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                extraID = rs.getInt("extraID");
                roomNumber = rs.getInt("roomNumber");
                extraName = rs.getString("extraName");
                extraNumber = rs.getInt("extraNumber");
                price = rs.getInt("price");
                detail = rs.getString("detail");
                extraDate = rs.getDate("extraDate");
                ExtraTBL extra = new ExtraTBL(extraID, roomNumber, extraName, extraNumber, price, detail, extraDate);
                arrExtra.add(extra);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return arrExtra;
    }

    //get accout current to user change password
    public LoginTBL getAccount(int cusID) {
        LoginTBL acc = null;
        try {
            int customerID;
            String uname;
            String psw;
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "select * from LoginTBL where LoginTBL.customerID = " + cusID;
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customerID = rs.getInt("customerID");
                uname = rs.getString("uname");
                psw = rs.getString("psw");
                acc = new LoginTBL(customerID, uname, psw);
            }
            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
        }
        return acc;
    }

    //update password of user 
    public boolean changeUserPass(int cusID, String pass) {
        boolean condition = true;
        try {
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "update LoginTBL set psw = ? where customerID = ?";
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ps.setString(1, pass);
            ps.setInt(2, cusID);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            condition = false;
        }
        return condition;
    }

    //Load notification 
    public ArrayList<Notification> getNotification() {
        ArrayList<Notification> arrNoti = new ArrayList<>();
        try {
            int notificationID;
            String title;
            String detail;
            java.sql.Date dateCreated;
            DBConnect dBConnect = new DBConnect();
            Connection conn = dBConnect.getConnection();
            String sqlSelect = "select * from Notification";
            PreparedStatement ps = conn.prepareStatement(sqlSelect);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                notificationID = rs.getInt("NotificationID");
                title = rs.getString("Title");
                detail = rs.getString("Detail");
                dateCreated = rs.getDate("DateCreated");
                Notification noti = new Notification(notificationID, title, detail, dateCreated);
                arrNoti.add(noti);
            }
            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
        }
        return arrNoti;
    }

    //get data tu bang RoomType
    public ArrayList<RoomTypeTBL> getDataRoomType() throws SQLException {
        ArrayList<RoomTypeTBL> arr = new ArrayList<>();
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        String query = "select * from RoomTypeTBL";
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            arr.add(new RoomTypeTBL(rs.getInt(1), rs.getBoolean(2), rs.getBoolean(3), rs.getInt(4), rs.getString(5)));
        }
        return arr;
    }

    //get data tu bang room info
    public ArrayList<RoomInfoTBL> getDataRoomInfo() throws SQLException {
        ArrayList<RoomInfoTBL> arr = new ArrayList<>();
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        String query = "select * from RoomInfoTBL";
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            arr.add(new RoomInfoTBL(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBoolean(4)));
        }
        return arr;
    }

    //get data tu bang customer
    public ArrayList<CustomerTBL> getDataCustomer() throws SQLException {
        ArrayList<CustomerTBL> arr = new ArrayList<>();
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        String query = "select * from CustomerTBL";
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            arr.add(new CustomerTBL(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7)));
        }
        return arr;
    }

    //remove customer from CustomerTBL
    public void removeCustomer(int customerID) throws SQLException {
        int roomNumber = 0;
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "delete from CustomerTBL where customerID =" + customerID;
        stm.execute(query);
        query = "delete from LoginTBL where customerID =" + customerID;
        stm.execute(query);
    }

    public int getRoomNumber(int customerID) throws SQLException {
        int roomNumber = 0;
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select roomNumber from CustomerTBL where customerID =" + customerID;
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            roomNumber = rs.getInt(1);
        }
        return roomNumber;
    }

    //change Available in RoomInfo
    public void changeAvailble(int roomNumber, int status) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomInfoTBL set available =" + status + " where roomNumber =" + roomNumber;
        stm.execute(query);
    }

    //redece num person in room when remove Customer
    public void changeNumperson(int customerID, int value) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomInfoTBL set numPerson = numPerson" + value + " where roomNumber =" + getRoomNumber(customerID);
        stm.execute(query);
    }

    //getNumperson in room
    public int getNumPersoninRoom(int roomNumber) throws SQLException {
        int numPerson = 0;
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select numPerson from RoomInfoTBL where roomNumber =" + roomNumber;
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            numPerson = rs.getInt(1);
        }
        return numPerson;
    }

    public void createNewTypeRoom(int RoomID, int optional, int closed, int price, String note) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "INSERT INTO RoomTypeTBL Values (" + RoomID + "," + optional + "," + closed + "," + price + ",'" + note + "');";
        stm.execute(query);
    }

    public void updateTypeRoom(int RoomID, int price) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomTypeTBL set price=" + price + " where roomTypeID =" + RoomID + ";";
        stm.execute(query);
    }

    public void updateRoomInFo(int RoomNumber, int RoomTypeID) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomInfoTBL set roomTypeID=" + RoomTypeID + " where roomNumber =" + RoomNumber + ";";
        stm.execute(query);
    }

    public void updateCustomer(String id, String name, String card, String phone, String parent, String roomNumber, String date) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update CustomerTBL set roomNumber=" + roomNumber + ",customerName='" + name + "',identityCard='" + card + "',phoneNumber='" + phone + "',parentsPhoneNumber='" + parent + "',dateJoin='" + date + "' where customerID =" + id + ";";
        stm.execute(query);
        con.close();
    }

    public void addCustomer(String id, String name, String card, String phone, String parent, String roomNumber, String date) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "INSERT INTO CustomerTBL Values (" + id + "," + roomNumber + ", '" + name + "', '" + card + "', '" + phone + "', '" + parent + "', '" + date + "');";
        stm.execute(query);
        con.close();
    }

    public int getAvailableRoom(int roomNumber) throws SQLException {
        int available = 0;
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select available from RoomInfoTBL where roomNumber =" + roomNumber;
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            available = rs.getInt(1);
        }
        con.close();
        return available;
    }

    public ArrayList<LoginModel> getDataLogin() throws SQLException {
        ArrayList<LoginModel> arr = new ArrayList<>();
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select * from LoginTBL";
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            String uname = rs.getString(2);
            String pass = rs.getString(3);
            arr.add(new LoginModel(uname, pass));
        }
        con.close();
        return arr;
    }

    public void addAccount(String user, String pass) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "INSERT INTO LoginTBL VALUES ('" + user + "', '" + pass + "');";
        stm.execute(query);
        con.close();
    }

    public int getCustomerID(String name) throws SQLException {
        int id = 0;
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select customerID from LoginTBL where uname ='" + name + "'";
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            id = rs.getInt(1);
        }
        con.close();
        return id;
    }

    public void changeNumpersonRoom(int roomNumber, int value) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomInfoTBL set numPerson = numPerson +" + value + " where roomNumber =" + roomNumber;
        stm.execute(query);
        con.close();
    }

    public void createNewRoom(int roomNumber, int roomTypeID, int numPerson, int available) throws SQLException {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "insert into RoomInfoTBL Values (" + roomNumber + "," + roomTypeID + "," + numPerson + "," + available + ");";
        stm.execute(query);
        con.close();
    }

    public ArrayList<Integer> getRoomNumberAvailable() throws SQLException {
        ArrayList<Integer> arr = new ArrayList<>();
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "select roomNumber from RoomInfoTBL where available = 1";
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
            int id = rs.getInt(1);
            arr.add(id);
        }
        con.close();
        return arr;
    }

}
