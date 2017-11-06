/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databases.DBContext;
import enities.BillTBL;
import enities.ExtraTBL;
import enities.LoginTBL;
import enities.Notification;
import enities.RoomContent;
import enities.Roommates;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chu Anh
 */
public class HandleUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            boolean conditionOut = false;
            Object sessionID = session.getAttribute("userID");
            if (sessionID == null) {
                response.sendRedirect("LoginJSP.jsp");
            } else {
                String s = request.getParameter("build");
                int uID = (int) sessionID;
                databases.DBContext dbc = new DBContext();
                RoomContent room = dbc.getRoomContent(uID);
                ArrayList<Roommates> listRoomMate = new ArrayList<>();
                ArrayList<BillTBL> listBill = new ArrayList<>();
                listRoomMate = dbc.getArrRoomMates();
                listBill = dbc.getArrBill();
                if (s == null) {
                    request.setAttribute("roomContent", room);
                    if (listRoomMate.size() > 0) {
                        request.setAttribute("arrRoomMate", listRoomMate);
                    }
                } else if (s.equals("true")) {
                    if (listBill.size() > 0) {
                        request.setAttribute("arrBill", listBill);
                    }
                } else if (s.endsWith("false")) {
                    request.setAttribute("roomContent", room);
                    if (listRoomMate.size() > 0) {
                        request.setAttribute("arrRoomMate", listRoomMate);
                    }
                } else if (s.equals("extra")) {
                    String convertRoomNum = request.getParameter("roomNum");
                    String mm = request.getParameter("month");
                    int rID = Integer.parseInt(convertRoomNum);
                    ArrayList<ExtraTBL> listExtra = new ArrayList<>();
                    listExtra = dbc.getExtraFee(rID, mm);
                    request.setAttribute("arrExtra", listExtra);
                } else if (s.equals("changePWS")) {
                    LoginTBL acc = dbc.getAccount(uID);
                    request.setAttribute("account", acc);
                } else if (s.equals("notify")) {
                    ArrayList<Notification> listNoti = new ArrayList<>();
                    listNoti = dbc.getNotification();
                    String getlocation = request.getParameter("location");
                    if (getlocation == null) {
                        request.setAttribute("arrNoti", listNoti);
                    }else{
                        int location = Integer.parseInt(getlocation);
                        Notification sendNoti = listNoti.get(location);
                        request.setAttribute("detailNoti", sendNoti);
                    }
                } else if (s.equals("signOut")) {
                    session.removeAttribute("userID");
                    conditionOut = true;
                    response.sendRedirect("LoginJSP.jsp");
                } else if (s.equals("Confirm")) {
                    String convertID = request.getParameter("customerID");
                    int cusID = Integer.parseInt(convertID);
                    LoginTBL account = dbc.getAccount(cusID);
                    request.setAttribute("account", account);
                    String oldPass = request.getParameter("oldPass");
                    String newPass = request.getParameter("newPass");
                    String reNewPass = request.getParameter("reNewPass");
                    if (oldPass.equals(account.getPsw()) == false) {
                        request.setAttribute("oldPassWord", "Old pass word inccorect !");
                    } else if (newPass.isEmpty()) {
                        request.setAttribute("newPassWord", "New password can not blank !");
                    } else if (newPass.equals(reNewPass) == false || newPass.length() > 20) {
                        request.setAttribute("reNewPassWord", "New password and re new password must be same and length less than 20 character!");
                    } else {
                        if (dbc.changeUserPass(cusID, newPass) == false) {
                            request.setAttribute("unsuccess", "Change password  unsuccessfully ! Please try agian ");
                        } else {
                            request.setAttribute("success", "Change password  successfully ");
                        }
                    }
                }
                if (conditionOut == false) {
                    request.getRequestDispatcher("CustomerJSP.jsp").forward(request, response);
                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
