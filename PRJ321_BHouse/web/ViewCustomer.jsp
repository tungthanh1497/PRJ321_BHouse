<%-- 
    Document   : ViewCustomer
    Created on : Nov 6, 2017, 4:03:07 PM
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
        %>

        <table border="1">
            <thead>
                <tr> 
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Identify Card</th>
                    <th>Phone Number</th>
                    <th>Date Join</th>
                    <th>Parent's Phone</th>
                    <th>Room Number</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < arr.size(); i++) {%>
                <tr>
                    <td><input type="text" name="customerID" value="<%= arr.get(i).getCustomerID()%>" onclick="return false;"></a></td>
                    <td><%= arr.get(i).getCustomerName()%></td>
                    <td><%= arr.get(i).getIdentityCard()%></td>
                    <td><%= arr.get(i).getPhoneNumber()%></td>
                    <td><%= arr.get(i).getDateJoin()%></td>
                    <td><%= arr.get(i).getParentsPhoneNumber()%></td>
                    <td><%= arr.get(i).getRoomNumber()%></td>
                    <td> <a href="editCustomer.jsp?customerID=<%=arr.get(i).getCustomerID()%>"><input type="button" value="Edit"></a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="createAccount.jsp"><input type="button" value="Create new Customer"></a>
    </body>
</html>
