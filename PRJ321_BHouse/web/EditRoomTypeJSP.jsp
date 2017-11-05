<%-- 
    Document   : EditRoomTypeJSP
    Created on : Oct 31, 2017, 3:59:02 PM
    Author     : lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="enities.RoomTypeTBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List room type</title>
        <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
    </head>
    <body>
        
        <%
            ArrayList<RoomTypeTBL> roomType = new ArrayList<RoomTypeTBL>();
            if (request.getAttribute("roomType") == null) {
                request.getRequestDispatcher("/BHouse/HandleAdminEditServlet").forward(request, response);
            } else {
                roomType = (ArrayList<RoomTypeTBL>) request.getAttribute("roomType");
            }
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Price</th>
                    <th>Optional</th>
                    <th>Closed</th>
                    <th>Note</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < roomType.size(); i++) {%>
                <tr>
                    <td><%= roomType.get(i).getRoomTypeID()%></td>
                    <td><%= roomType.get(i).getPrice()%></td>
                    <td>
                        <%if (roomType.get(i).isOptional()) { %>
                        <input type="checkbox" checked="" onclick="return false;" >
                        <%} else {%>
                        <input type="checkbox" onclick="return false;"">
                        <%}%>               
                    </td>  
                    <td>
                        <%if (roomType.get(i).isClosed()) { %>
                        <input type="checkbox" checked="" onclick="return false;">
                        <%} else {%>
                        <input type="checkbox" onclick="return false;">
                        <%}%>               
                    </td>
                    <td><%= roomType.get(i).getNote()%></td>
                    <td> <a href="RoomTypeJSP.jsp?roomTypeID=<%= roomType.get(i).getRoomTypeID()%>" ><input type="submit" value="edit"> </a> </td>
                </tr>
                <% }
                %>
            </tbody>
        </table>
</body>
</html>
