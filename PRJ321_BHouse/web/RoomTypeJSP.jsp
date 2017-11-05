<%-- 
    Document   : RoomTypeJSP
    Created on : Oct 31, 2017, 4:29:26 PM
    Author     : lenovo
--%>

<%@page import="databases.DBContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="enities.RoomTypeTBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit room type</title>
    <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
</head>
<body>        
    <%
        int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID").toString());
        ArrayList<RoomTypeTBL> roomType = new ArrayList<RoomTypeTBL>();
        DBContext dBContext = new DBContext();
        roomType = dBContext.getDataRoomType();
        for (int i = 0; i < roomType.size(); i++) {
            if (roomType.get(i).getRoomTypeID() == roomTypeID) {%>
    <form action="HandleChangeRoomType">
        <table border="1">
            <tbody>
                <tr>
                    <td>Room Type ID</td>
                    <td><input type="text" value="<%= roomType.get(i).getRoomTypeID()%>" name="roomTypeID" readonly="true"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" value="<%= roomType.get(i).getPrice()%>" name="price"></td>
                </tr>
                <tr>
                    <td>Optional</td>
                    <td><%if (roomType.get(i).isOptional()) { %>
                        <input type="checkbox" checked="" name ="optional" onclick="return false;"><br>
                        <%} else {%>
                        <input type="checkbox" name ="optional" onclick="return false;"><br>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>Closed</td>
                    <td> <%if (roomType.get(i).isClosed()) { %>
                        <input type="checkbox" checked="" name ="closed" onclick="return false;"><br>
                        <%} else {%>
                        <input type="checkbox" name ="closed" onclick="return false;"><br>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>Note</td>
                    <td><input type="text" value="<%= roomType.get(i).getNote()%>" name="note" readonly=""><br></td>
                </tr>
            </tbody>
        </table>
        <input type = "submit" value="Save">
    </form>
    <% }
        }
    %>
    <a href="/BHouse/HandleAdminServlet?roomType=Edit+Room+Type"> <input type="submit" value="Back to List Type Room"> </a>
</body>
</html>
