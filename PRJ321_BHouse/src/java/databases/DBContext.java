/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databases;

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
}
