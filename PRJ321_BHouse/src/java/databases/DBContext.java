/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databases;

import enities.CustomerTBL;
import enities.RoomContent;
import enities.RoomInfoTBL;
import enities.RoomTypeTBL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.LoginModel;

/**
 *
 * @author tungthanh.1497
 */
public class DBContext {

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
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return room;
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
        String query = "INSERT INTO RoomTypeTBL Values ("+RoomID+","+optional+","+closed+","+price+",'"+note+"');";
        stm.execute(query);
    }
    
    public void updateTypeRoom(int RoomID, int price) throws SQLException
    {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomTypeTBL set price="+price+" where roomTypeID ="+RoomID+ ";";
        stm.execute(query);
    }
    
    public void updateRoomInFo(int RoomNumber, int RoomTypeID) throws SQLException
    {
        DBConnect dBConnect = new DBConnect();
        Connection con = dBConnect.getConnection();
        Statement stm = con.createStatement();
        String query = "update RoomInfoTBL set roomTypeID="+RoomTypeID+" where roomNumber ="+RoomNumber+ ";";
        stm.execute(query);
    }
    
}
