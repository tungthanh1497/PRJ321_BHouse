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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class HandleCreateRoom extends HttpServlet {

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
            ArrayList<RoomInfoTBL> arr = new ArrayList<RoomInfoTBL>();
            DBContext dbContext = new DBContext();
            try {
                arr = dbContext.getDataRoomInfo();
            } catch (SQLException ex) {
                Logger.getLogger(HandleCreateRoom.class.getName()).log(Level.SEVERE, null, ex);
            }
            boolean check = true;
            int roomNumber=0;
            try
            {
                roomNumber = Integer.parseInt(request.getParameter("roomNumber").toString().trim());
            }catch(Exception e)
            {
                session.setAttribute("roomNumber", "Room Number must be number"+"<br>");
                check = false;
            }
            
            
            for(int i = 0; i < arr.size(); i++)
            {
                if(arr.get(i).getRoomNumber() == roomNumber)
                {
                    session.setAttribute("roomNumber", "Room Number have existed" +"<br>");
                    check = false;
                    break;
                }
            }
            int roomTypeID = Integer.parseInt(request.getParameter("roomType").toString());
            
            int available = 0;
            if (request.getParameter("available") != null) {
                if (!request.getParameter("available").equals("on")) {
                    available = 0;
                } else {
                    available = 1;
                }
            }
            if(check == true)
            {
                try {
                    dbContext.createNewRoom(roomNumber, roomTypeID, 0, available);
                } catch (SQLException ex) {
                    Logger.getLogger(HandleCreateRoom.class.getName()).log(Level.SEVERE, null, ex);
                }
                
               response.sendRedirect("/BHouse/HandleAdminServlet?roomInfo=chhoose");
            }
            else
            {
                request.getRequestDispatcher("createNewRoom.jsp").forward(request, response);
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
