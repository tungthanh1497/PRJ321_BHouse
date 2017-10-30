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
public class LoginTBL {

    private int customerID;
    private String uname;
    private String psw ;

    public LoginTBL(String uname, String psw) {
        this.uname = uname;
        this.psw = psw;
    }

    
    
    public LoginTBL(int customerID, String uname, String psw) {
        this.customerID = customerID;
        this.uname = uname;
        this.psw = psw;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

 

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

}
