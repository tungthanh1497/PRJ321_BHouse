<%-- 
    Document   : TestJSP
    Created on : Oct 30, 2017, 8:16:54 PM
    Author     : tungthanh.1497
--%>

<%@page import="databases.DBContext"%>
<%@page import="models.LoginModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // khong can khoi tao id cho loginmodel
    LoginModel loginModel = new LoginModel("tungtt", "tungtt");
    DBContext dBContext = new DBContext();
    String i = dBContext.getLoginId(loginModel);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> <%= i%> </h1>
        <form action="http://localhost:8080/BHouse/TestServlet" method="POST">
            <input type="submit" value="move" name="move" />
        </form>
    </body>
</html>
