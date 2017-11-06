<%-- 
    Document   : LoginJSP
    Created on : Oct 30, 2017, 10:25:49 PM
    Author     : tungthanh.1497
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body{
            background: azure;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginServlet">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="uname" value="" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="psw" value="" /></td>
                </tr>
            </table>

            <input type="submit" value="Login" />
            <h3 style="color: red"> ${notifyLogin}</h3>
        </form>
    </body>
</html>
