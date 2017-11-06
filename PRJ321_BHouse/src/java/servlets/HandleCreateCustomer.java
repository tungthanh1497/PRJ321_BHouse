/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databases.DBContext;
import enities.RoomInfoTBL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class HandleCreateCustomer extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String ID = request.getParameter("customerID").toString();
            String roomNumber = request.getParameter("customerRoomNumber").toString();
            String phoneNumber = request.getParameter("customerPhoneNumber").toString();
            String parentsPhoneNumber = request.getParameter("customerParentsPhone").toString();
            String dateJoin = request.getParameter("customerDateJoin").toString();
            String name = request.getParameter("customerName").toString();
            String card = request.getParameter("customerCard").toString();
            String error = "";
            boolean check = true, checkUpdate = true;
            for (int i = 0; i < name.length(); i++) {
                if (Character.isDigit(name.charAt(i))) {
                    check = false;
                }
            }
            if (check == false) {
                error= "Name must contain only char" +"<br>";
                checkUpdate = false;
            }
            session.setAttribute("customerName", error);
            
            error = "";
            boolean key = false;
            boolean exist = false;
            int numberRoom = 0;
            try {
                numberRoom = Integer.parseInt(roomNumber);
                key = true;
            } catch (Exception e) {
                error = "RoomNumber must be number "+"<br>";
                checkUpdate = false;
            }
            if (key == true) {
                ArrayList<RoomInfoTBL> arr = new ArrayList<>();
                DBContext dbContext = new DBContext();
                try {
                    arr = dbContext.getDataRoomInfo();
                    for (int i = 0; i < arr.size(); i++) {
                        if (arr.get(i).getRoomNumber() == numberRoom) {
                            exist = true;
                        }
                    }
                } catch (SQLException ex) {

                }
                if (exist == false) {
                    error = error + "RoomNumber must be in RoomList"+"<br>";
                    checkUpdate = false;
                }
            }
            session.setAttribute("roomNumber", error);
            out.print(error);

            error = "";
            int numberPhone = 0;
            try {
                numberPhone = Integer.parseInt(phoneNumber);

            } catch (Exception e) {
                error = "Phone Number must be number"+"<br>";
                checkUpdate = false;
            }
            session.setAttribute("phoneNumber", error);
            
            error = "";
            try {
                numberPhone = Integer.parseInt(parentsPhoneNumber);

            } catch (Exception e) {
                error = "Phone Number must be number"+"<br>";
                checkUpdate = false;
            }
            session.setAttribute("parentsphoneNumber", error);

            error = "";
            Double cardCheck;
            try {
                cardCheck = Double.parseDouble(card);

            } catch (Exception e) {
                error = "Indentify card must be number"+"<br>";
                checkUpdate = false;

            }
            session.setAttribute("card", error);
            error = "success";
            if (checkUpdate == true) {
                DBContext dbContext = new DBContext();
                try {
                    if (dbContext.getAvailableRoom(numberRoom) == 1) {
                        dbContext.addCustomer(ID, name, card, phoneNumber, parentsPhoneNumber, roomNumber, dateJoin);
                        dbContext.changeNumpersonRoom(numberRoom, +1);
                        if(dbContext.getNumPersoninRoom(numberRoom) == 3)
                        {
                            dbContext.changeAvailble(numberRoom, 0);
                        }
                        else
                        {
                            dbContext.changeAvailble(numberRoom, 1);
                        }
                        response.sendRedirect("ViewCustomer.jsp");
                    }
                    else
                    {
                       session.setAttribute("roomAvailable", "Room is not available");
                       response.sendRedirect("createCustomer.jsp"); 
                    }
                } catch (SQLException ex) {
                    session.setAttribute("date", "Error input Date "+ dateJoin+"<br>");
                    response.sendRedirect("createCustomer.jsp");
                }
                
            } else {
                response.sendRedirect("createCustomer.jsp");
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
