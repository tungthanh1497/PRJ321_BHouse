<%-- 
    Document   : CreateNoti
    Created on : Nov 7, 2017, 5:28:35 AM
    Author     : lenovo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <h3>Create Notification</h3>
    </head>
    
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        String str = sdf.format(date);
    %>
    <body>
        <form action="HandleCreateNoti">
            <table border="0">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td>Notification Title</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>Notification Content</td>
                    <td><textarea rows="20" cols="50" name="content"></textarea></td>
                    
                </tr>
                <tr>
                    <td>Date Created</td>
                    <td><input type="text" name="date" value="<%=str %>" readonly=""></td>
                </tr>
            </tbody>
        </table>
                <input type="submit" value="Create">
        </form>
        
    </body>
</html>
