<%-- 
    Document   : LoginJSP
    Created on : Oct 30, 2017, 10:25:49 PM
    Author     : tungthanh.1497
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet">
            Username: <input type="text" name="uname" value="" />
            Password: <input type="password" name="psw" value="" />
            <input type="submit" value="Login" />
        </form>
    </body>
</html>
