<%-- 
    Document   : RoomInfoJSP
    Created on : Nov 1, 2017, 9:56:35 AM
    Author     : lenovo
--%>

<%@page import="enities.AllInfoInRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            ArrayList<AllInfoInRoom> allInfoRoom = new ArrayList<AllInfoInRoom>();
            allInfoRoom = ( ArrayList<AllInfoInRoom>) session.getAttribute("allInfoRoom");
            int i = Integer.parseInt(request.getParameter("roomNumber")) -1;
        %>
        <form action="/BHouse/SaveEditRoomInfoServlet">
            <table border="1">
                <thead>
                    <tr>
                        <th>Room Number</th>
                        <th>Person in Room</th>
                        <th>Optional</th>
                        <th>Closed</th>
                        <th>Available</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>                
                        <td> <input type="text" value="<%= allInfoRoom.get(i).getRoomNumber()%>" name="roomNumber" readonly=""> </td>
                        <td>
                            <% for (int u = 0; u < allInfoRoom.get(i).getNamePerson().size(); u++) {
                            %>
                            <a href="editCustomer.jsp?customerID=<%= allInfoRoom.get(i).getCustomerID().get(u) %>"><%= allInfoRoom.get(i).getNamePerson().get(u)%> </a> [<a href="RoomInfoJSP.jsp" onclick="YNconfirm(<%= allInfoRoom.get(i).getCustomerID().get(u) %>); return false;">X</a>] <br>
                            <%}%>
                        </td>
                        <td>
                            <%if (allInfoRoom.get(i).isOptional()) { %>
                            <input type="checkbox" checked="" name="optional" >
                            <%} else {%>
                            <input type="checkbox" name="optional">
                            <%}%>               
                        </td>
                        <td>
                            <%if (allInfoRoom.get(i).isClosed()) { %>
                            <input type="checkbox" checked="" name="closed" >
                            <%} else {%>
                            <input type="checkbox" name="closed">
                            <%}%>               
                        </td>
                        <td>
                            <%if (allInfoRoom.get(i).isAvailable()) { %>
                            <input type="checkbox" checked="" name="available" >
                            <%} else {%>
                            <input type="checkbox" name="available">
                            <%}%>               
                        </td>
                    </tr>      
                </tbody>
            </table>
            <input type="submit" value="Save">
        </form>
    </body>
    <script>
            function YNconfirm() {
                if (window.confirm('Are you sure to delete this person?'))
                {
                    var s = 'http://localhost:8080/BHouse/HandleRemoveCustomerServlet?id='+arguments[0];
                    window.location.href = s;
                }
            }
        </script>
</html>
