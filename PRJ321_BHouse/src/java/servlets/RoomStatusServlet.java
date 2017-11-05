/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databases.DBContext;
import enities.RoomInfoTBL;
import enities.RoomStatus;
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
public class RoomStatusServlet extends HttpServlet {

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
        boolean optional = false;
        boolean closed = false;
        int price = 0;
        int numPerson;
        boolean available;
        
        DBContext dbContext = new DBContext();
        ArrayList<RoomInfoTBL> roomInfo = new ArrayList<>();
        ArrayList<RoomTypeTBL> roomType = new ArrayList<>();
        ArrayList<RoomStatus> roomStatus = new ArrayList<>();
        
        try {
            roomInfo = dbContext.getDataRoomInfo();
            roomType = dbContext.getDataRoomType();
        } catch (SQLException ex) {
           
        }
        
        for(int i = 0; i < roomInfo.size(); i++)
        {
            roomNumber = roomInfo.get(i).getRoomNumber();
            numPerson = roomInfo.get(i).getNumPerson();
            available = roomInfo.get(i).isAvailable();
            
            for(int u = 0; u < roomType.size(); u++)
            {
                if(roomInfo.get(i).getRoomTypeID() == roomType.get(u).getRoomTypeID())
                {
                    optional = roomType.get(u).isOptional();
                    closed = roomType.get(u).isClosed();
                    price = roomType.get(u).getPrice();
                }
            }
            roomStatus.add(new RoomStatus(roomNumber, optional, closed, numPerson, price, available));
        }
        request.setAttribute("roomStatus", roomStatus);
        request.getRequestDispatcher("/AdminJSP.jsp").forward(request, response);
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
