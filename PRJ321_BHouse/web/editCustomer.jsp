<%-- 
    Document   : editCustomer
    Created on : Nov 6, 2017, 4:13:04 PM
    Author     : lenovo
--%>

<%@page import="databases.DBContext"%>
<%@page import="enities.CustomerTBL"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
</head>
<body>
    <% ArrayList<CustomerTBL> arr = new ArrayList<CustomerTBL>();
        DBContext dbContext = new DBContext();
        arr = dbContext.getDataCustomer();
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
        for (int i = 0; i < arr.size(); i++) {
            if (arr.get(i).getCustomerID() == Integer.parseInt(request.getParameter("customerID").toString())) {
                session.setAttribute("oldRoomNumber", arr.get(i).getRoomNumber());
            }
        }
        ArrayList<Integer> customerRoomNumber = new ArrayList<Integer>();
        customerRoomNumber = dbContext.getRoomNumberAvailable();
    %>
    <h5> <%= name + " " + card + " " + phone + " " + date + " " + parent + " " + room + "  " + roomStatus%></h5>
    <form action="HandleEditCustomer">      
        <table border="1">
            <tbody>
                <% for (int i = 0; i < arr.size(); i++) {
                        if (arr.get(i).getCustomerID() == Integer.parseInt(request.getParameter("customerID").toString())) {
                %> 
                <tr>
                    <td>CustomerID</td>
                    <td><input type="text" name="customerID" value="<%= arr.get(i).getCustomerID()%>" onclick="return false;"></td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td><input type="text" name="customerName" value="<%= arr.get(i).getCustomerName()%>" required=""></td>

                </tr>   
                <tr>
                    <td>Identify Card</td>
                    <td><input type="text" name="customerCard" value="<%= arr.get(i).getIdentityCard()%>" required=""></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><input type="text" name="customerPhoneNumber" value="<%= arr.get(i).getPhoneNumber()%>" required=""></td>
                </tr>
                <tr>
                    <td>Date Join (MM-DD-YYYY)</td>
                    <td><input type="text" name="customerDateJoin" value="<%= arr.get(i).getDateJoin()%>" required=""></td>
                </tr>
                <tr>
                    <td>Parents's Phone Number</td>
                    <td><input type="text" name="customerParentsPhone" value="<%= arr.get(i).getParentsPhoneNumber()%>" required=""></td>
                </tr>
                <tr>
                        <td>Room Number</td>
                        <td>
                            <select name="customerRoomNumber">
                            <% for (int u = 0; u < customerRoomNumber.size(); u++) {
                            %>
                            <option value = <%= customerRoomNumber.get(u)%> > <%= customerRoomNumber.get(u)%> </option>
                            <%
                                }
                            %>
                        </select>
                        </td>  
                    </tr> 
                <% }
                        }%>

            </tbody>
        </table>
        <input type="submit" value="Submit">
    </form>

</body>
</html>
