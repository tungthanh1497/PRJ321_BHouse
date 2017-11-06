<%-- 
    Document   : createAccount
    Created on : Nov 6, 2017, 10:45:59 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% String error="";
    if(session.getAttribute("error") != null)
    {
        error = session.getAttribute("error").toString();
    }
   
    %>
    <a href="AdminJSP.jsp"> <input type="submit" value="Admin Homepage">  </a> <br>
    <body>
        <h1>Create Account for new Customer</h1>
        <h4> <%= error %></h4>
        <form action="HandleCreateAccount">
            <table border="0">
                <tbody>
                    <tr>
                        <td>User name</td>
                        <td><input type="text" name="username" required=""> <br></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password" required=""></td>
                    </tr>
                </tbody>
            </table>
             <input type="submit" value="Continue">
        </form>
       
    </body>
</html>
