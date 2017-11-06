<%-- 
    Document   : createCustomer
    Created on : Nov 6, 2017, 10:51:04 PM
    Author     : lenovo
--%>

<%@page import="databases.DBContext"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
    </head>
    <%
        String name = "", phone = "", parent = "", card = "", date = "", room = "", roomStatus = "";
        if (session.getAttribute("card") != null) {
            card = session.getAttribute("card").toString();
            session.removeAttribute("card");
        }
        if (session.getAttribute("parentsphoneNumber") != null) {
            parent = session.getAttribute("parentsphoneNumber").toString();
            session.removeAttribute("parentsphoneNumber");
        }
        if (session.getAttribute("roomAvailable") != null) {
            roomStatus = session.getAttribute("roomAvailable").toString();
            session.removeAttribute("roomAvailable");
        }
        if (session.getAttribute("phoneNumber") != null) {
            phone = session.getAttribute("phoneNumber").toString();
            session.removeAttribute("phoneNumber");
        }

        if (session.getAttribute("roomNumber") != null) {
            room = session.getAttribute("roomNumber").toString();
            session.removeAttribute("roomNumber");
        }

        if (session.getAttribute("customerName") != null) {
            name = session.getAttribute("customerName").toString();
            session.removeAttribute("customerName");
        }

        if (session.getAttribute("date") != null) {
            date = session.getAttribute("date").toString();
            session.removeAttribute("date");       
        }
        ArrayList<Integer> customerRoomNumber = new ArrayList<Integer>();
        DBContext dbContext = new DBContext();
        customerRoomNumber = dbContext.getRoomNumberAvailable();
    %>
    <body>
        <h5> <%= name + " " + card + " " + phone + " " + date + " " + parent + " " + room + "  " + roomStatus%></h5>
        <form action="HandleCreateCustomer">      
            <table border="1">
                <tbody> 
                    <tr>
                        <td>Customer ID</td>
                        <td><input type="text" value="<%= session.getAttribute("customerID") %>" name="customerID"  required=""></td>
                    </tr>   
                    <tr>
                        <td>Customer Name</td>
                        <td><input type="text" name="customerName"  required=""></td>
                    </tr>   
                    <tr>
                        <td>Identify Card</td>
                        <td><input type="text" name="customerCard" required=""></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="customerPhoneNumber"  required=""></td>
                    </tr>
                    <tr>
                        <td>Date Join (MM-DD-YYYY)</td>
                        <td><input type="text" name="customerDateJoin" required=""></td>
                    </tr>
                    <tr>
                        <td>Parents's Phone Number</td>
                        <td><input type="text" name="customerParentsPhone" required=""></td>
                    </tr>
                    <tr>
                        <td>Room Number</td>
                        <td>
                            <select name="customerRoomNumber">
                            <% for (int i = 0; i < customerRoomNumber.size(); i++) {
                            %>
                            <option value = <%= customerRoomNumber.get(i)%> > <%= customerRoomNumber.get(i)%> </option>
                            <%
                                }
                            %>
                        </select>
                        </td>  
                    </tr>                 
                </tbody>
            </table>
            <input type="submit" value="Create">
            </body>
            </html>
