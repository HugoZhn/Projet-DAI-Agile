<%-- 
    Document   : LoginClient
    Created on : 19 févr. 2019, 09:06:50
    Author     : 21408162
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>login form</title>
    </head>
    <body>
        <form method="POST" action="CtrlLogin">
        Login :<input type="text" name="login" placeholder="Nom utilisateur"/><br/>
        Password:<input type="password" name="password" placeholder="Mot de passe"/><br/>
        <input type="submit" value="login" />
        </form>
        <% if(request.getAttribute("errorMsg")!=null){
            out.print("<p>" + request.getAttribute("errorMsg") + "</p>");
        }
        %>
    </body>
</html>

