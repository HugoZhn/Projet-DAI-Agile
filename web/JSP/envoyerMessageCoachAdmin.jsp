<%-- 
    Document   : NotificationCoachAdmin
    Created on : 20 févr. 2019, 16:25:41
    Author     : 21808985
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="emailForm" action="CtrlEnvoyerMessageCoachAdmin" method="post">
            <h1>Envoyer une notification</h1>
            <p>Selectionner le destinataire</p>

            <div>
                <input type="radio" id="coach" name="jd" value="au coach"   checked>
                <label for="huey">A destination de mon coach</label>
            </div>

            <div>
                <input type="radio" id="admin" name="jd" value="à l'admin">
                <label for="dewey">A destination de l'administrateur</label>
            </div>
            <div>
                <textarea id="message" name="message" rows="6" cols="35" required></textarea>
            </div>
            <div>
                <input type="submit" id="envoyerMessage" value="Envoyer le messsage" action="EnvoyerMessage">
            </div>            
            <div>
        </form>
    </body>
</html>
