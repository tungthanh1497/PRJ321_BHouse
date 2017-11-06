<%-- 
    Document   : createNewRoom
    Created on : Nov 7, 2017, 1:19:22 AM
    Author     : lenovo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="enities.RoomTypeTBL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="databases.DBContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <h3>Create new Room</h3>
</head>
<% DBContext dbContext = new DBContext();
    String roomNumber="", numPerson="";
    ArrayList<RoomTypeTBL> roomType = new ArrayList<RoomTypeTBL>();
    try {
        roomType = dbContext.getDataRoomType();
    } catch (SQLException ex) {

    }
    if(session.getAttribute("roomNumber") != null)
    {
        roomNumber = session.getAttribute("roomNumber").toString();
        session.removeAttribute("roomNumber");
    }
    if(session.getAttribute("numPerson") != null)
    {
        numPerson = session.getAttribute("numPerson").toString();
        session.removeAttribute("numPerson");
    }
%>
<body>
    <h4><%= roomNumber + numPerson %></h4>
    <form action="HandleCreateRoom">
        <table border="0">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td>Room Number</td>
                    <td><input type="text" required="" name="roomNumber"></td>
                </tr>
                <tr>
                    <td>Room Type</td>
                    <td>
                        <select name="roomType">
                            <% for (int i = 0; i < roomType.size(); i++) {
                            %>
                            <option value = <%= roomType.get(i).getRoomTypeID()%> > <%= roomType.get(i).getRoomTypeID()%> </option>
                            <%
                                }
                            %>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Available</td>
                    <td><input type="checkbox" name="available" /></td>
                </tr>
            </tbody>
        </table>
        <input type="submit" value="Create">
    </form>
</body>
</html>
