/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databases;

import enities.RoomContent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
    
}
