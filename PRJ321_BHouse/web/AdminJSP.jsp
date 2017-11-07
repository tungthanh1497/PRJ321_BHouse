<%-- 
    Document   : AdminJSP
    Created on : Oct 30, 2017, 10:29:29 PM
    Author     : tungthanh.1497
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="enities.RoomStatus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Homepage</title>
    </head>
    <body>
        <%
            ArrayList<RoomStatus> roomStatus = new ArrayList<RoomStatus>();
            if (request.getAttribute("roomStatus") == null) {
                request.getRequestDispatcher("/RoomStatusServlet").forward(request, response);
            } else {
                roomStatus = (ArrayList<RoomStatus>) request.getAttribute("roomStatus");
            }
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Price</th>
                    <th>Number of Person</th>
                    <th>Optional</th>
                    <th>Closed</th>
                    <th>Available</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < roomStatus.size(); i++) {%>
                <tr>
                    <td><%= roomStatus.get(i).getRoomNumber()%></td>
                    <td><%= roomStatus.get(i).getPrice()%></td>
                    <td><%= roomStatus.get(i).getNumPerson()%></td>
                    <td>
                        <%if (roomStatus.get(i).isOptional()) { %>
                        <input type="checkbox" checked="" onclick="return false;" >
                        <%} else {%>
                        <input type="checkbox" onclick="return false;">
                        <%}%>               
                    </td>  
                    <td>
                        <%if (roomStatus.get(i).isClosed()) { %>
                        <input type="checkbox" checked="" onclick="return false;">
                        <%} else {%>
                        <input type="checkbox" onclick="return false;">
                        <%}%>               
                    </td>
                    <td>
                        <%if (roomStatus.get(i).isAvailable()) { %>
                        <input type="checkbox" checked="" onclick="return false;">
                        <%} else {%>
                        <input type="checkbox" onclick="return false;">
                        <%}%>               
                    </td>
                </tr>
                <% }
                %>
            </tbody>
        </table>
        <form action = "/BHouse/HandleAdminServlet">
            <input type="submit" value="Edit Room Infomation" name="roomInfo">
            <input type="submit" value="Edit Room Type" name="roomType">
             <input type="submit" value ="View Customer" name="view">
             <input type="submit" value="Create Notification" name="noti">
        </form>

    </body>
</html>
