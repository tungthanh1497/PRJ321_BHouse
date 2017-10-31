<%-- 
    Document   : CustomerJSP
    Created on : Oct 30, 2017, 10:29:43 PM
    Author     : tungthanh.1497
--%>

<%@page import="enities.RoomContent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Customer</h1>
        <%
            RoomContent room = (RoomContent) request.getAttribute("roomContent");
            if (room instanceof RoomContent && room != null) {
        %>
        Customer Name : <%=room.getCusName()%> <br>
        Identify Card : <%=room.getIdentityCard()%> <br>
        Phone Number : <%=room.getPhoneNum()%> <br>
        Parents Phone : <%=room.getParentPhoneNum()%> <br>
        Date Join : <%=room.getDateJoin()%> <br>
        Room Number :<%=room.getRoomNum()%> <br>
        Price : <%=room.getPrice()%> <br>
        Note : <%=room.getNote()%> <br>
        <%}%>
    </body>
</html>
