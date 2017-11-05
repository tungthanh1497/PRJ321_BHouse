/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databases.DBContext;
import enities.AllInfoInRoom;
import enities.CustomerTBL;
import enities.RoomInfoTBL;
import enities.RoomTypeTBL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class HandleAdminServlet extends HttpServlet {

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
           int roomNumber;
            int price = 0;
            boolean optional = false;
            boolean closed = false;
            boolean available;
            ArrayList<String> namePerson = new ArrayList<>();
            ArrayList<Integer> customerID = new ArrayList<>();

            DBContext dbContext = new DBContext();
            ArrayList<RoomInfoTBL> roomInfo = new ArrayList<>();
            ArrayList<RoomTypeTBL> roomType = new ArrayList<>();
            ArrayList<CustomerTBL> customer = new ArrayList<>();
            ArrayList<AllInfoInRoom> allInfoRoom = new ArrayList<>();

            try {
                roomInfo = dbContext.getDataRoomInfo();
                roomType = dbContext.getDataRoomType();
                customer = dbContext.getDataCustomer();
            } catch (SQLException ex) {

            }

            for (int i = 0; i < roomInfo.size(); i++) {
                customerID = new ArrayList<>();
                namePerson = new ArrayList<>();
                roomNumber = roomInfo.get(i).getRoomNumber();
                available = roomInfo.get(i).isAvailable();

                for (int u = 0; u < roomType.size(); u++) {
                    if (roomInfo.get(i).getRoomTypeID() == roomType.get(u).getRoomTypeID()) {
                        optional = roomType.get(u).isOptional();
                        closed = roomType.get(u).isClosed();
                        price = roomType.get(u).getPrice();
                    }
                }

                for (int j = 0; j < customer.size(); j++) {
                    if (roomInfo.get(i).getRoomNumber() == customer.get(j).getRoomNumber()) {
                        namePerson.add(customer.get(j).getCustomerName());
                        customerID.add(customer.get(j).getCustomerID());
                    }
                }
                allInfoRoom.add(new AllInfoInRoom(roomNumber, price, optional, closed, available, namePerson, customerID));
            }
            if (request.getParameter("roomInfo") != null) {
                request.setAttribute("allInfoRoom", allInfoRoom);
                request.getRequestDispatcher("EditRoomInfoJSP.jsp").forward(request, response);
            } else if (request.getParameter("roomType") != null) {
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("EditRoomTypeJSP.jsp").forward(request, response);
            }else if(request.getParameter("Add") != null)
            {
                request.getRequestDispatcher("AddNewCustomerJSP.jsp").forward(request, response);
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
