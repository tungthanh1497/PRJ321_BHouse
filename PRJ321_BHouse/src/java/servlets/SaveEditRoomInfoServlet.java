/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import databases.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class SaveEditRoomInfoServlet extends HttpServlet {

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
           int roomNumber;
            DBContext dbContext = new DBContext();
            int price;
            int available = 0;
            int type = 0;
            roomNumber = Integer.parseInt(request.getParameter("roomNumber").toString());
            if (request.getParameter("available") != null) {
                if (!request.getParameter("available").equals("on")) {
                    available = 0;
                } else {
                    available = 1;
                }
            }
            
            if (request.getParameter("closed") != null && request.getParameter("optional") != null) {
                type = 1;
            } else if (request.getParameter("closed") != null && request.getParameter("optional") == null) {
                type = 3;
            } else if (request.getParameter("closed") == null && request.getParameter("optional") != null) {
                type = 2;
            } else {
                type = 4;
            }
            try {
                if(dbContext.getNumPersoninRoom(roomNumber)<3)
                {
                    dbContext.changeAvailble(roomNumber, available);
                }
                dbContext.updateRoomInFo(roomNumber, type);
            } catch (Exception e) {
                
            }
            
            request.getRequestDispatcher("AdminJSP.jsp").forward(request, response);
            
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
