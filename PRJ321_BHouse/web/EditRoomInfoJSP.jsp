<%-- 
    Document   : EditRoomInfoJSP
    Created on : Oct 31, 2017, 10:06:10 AM
    Author     : lenovo
--%>

<%@page import="enities.AllInfoInRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit room information</title>
    <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
</head>
<body> 
    <%
        ArrayList<AllInfoInRoom> allInfoRoom = new ArrayList<AllInfoInRoom>();
        if (request.getAttribute("allInfoRoom") == null) {
            request.getRequestDispatcher("/HandleAdminEditServlet").forward(request, response);
        } else {
            allInfoRoom = (ArrayList<AllInfoInRoom>) request.getAttribute("allInfoRoom");
            session.setAttribute("allInfoRoom", allInfoRoom);          
        }
    %>

    <table border="1">
        <thead>
            <tr>
                <th>Room Number</th>
                <th>Price</th>
                <th>Optional</th>
                <th>Closed</th>
                <th>Available</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < allInfoRoom.size(); i++) {%>
            <tr>
                <td><%= allInfoRoom.get(i).getRoomNumber()%></td>
                <td><%= allInfoRoom.get(i).getPrice()%></td>
                <td>
                    <%if (allInfoRoom.get(i).isOptional()) { %>
                    <input type="checkbox" checked="" onclick="return false;" >
                    <%} else {%>
                    <input type="checkbox"  onclick="return false;">
                    <%}%>               
                </td>  
                <td>
                    <%if (allInfoRoom.get(i).isClosed()) { %>
                    <input type="checkbox" checked=""  onclick="return false;">
                    <%} else {%>
                    <input type="checkbox"  onclick="return false;">
                    <%}%>               
                </td>
                <td>
                    <%if (allInfoRoom.get(i).isAvailable()) { %>
                    <input type="checkbox" checked=""  onclick="return false;">
                    <%} else {%>
                    <input type="checkbox"  onclick="return false;">
                    <%}%>               
                </td>
                <td> <a href="RoomInfoJSP.jsp?roomNumber=<%= allInfoRoom.get(i).getRoomNumber()%>" ><input type="submit" value="edit"> </a> </td>
            </tr>
            <% }
            %>
        </tbody>
    </table>
<a href="createNewRoom.jsp"><input type="submit" value="Create new Room"></a>
</body>


</html>
