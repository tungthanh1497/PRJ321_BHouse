/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author tungthanh.1497
 */
public class LoginModel {

    private String uname;
    private String psw;

    public LoginModel(String uname, String psw) {
        this.uname = uname;
        this.psw = psw;
    }

    public String getUname() {
        return uname;
    }

    public String getPsw() {
        return psw;
    }

}
