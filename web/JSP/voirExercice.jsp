<%-- 
    Document   : voirExercice
    Created on : 19 févr. 2019, 15:12:36
    Author     : 21607860
--%>

<%@page import="pojo.Exercice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultation exercice</title>
    </head>
    <body>
        <h1>Consultation d'un exercice</h1>

        <%
            // Récupère le message d'avertissement ou d'erreur
            Exercice ex = (Exercice) request.getAttribute("exercice");

            out.println("<h3> Exercice : " + ex.getNomEx() + "</h3>");
            out.println("<table border = 1>");
                out.println("<tr>");
                    out.println("<td>Type</td>");
                    out.println("<td>" + ex.getTypeExercice().getLibTypeEx() + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Objectif</td>");
                    out.println("<td>" + ex.getObjectifsEx() + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Description</td>");
                    out.println("<td>" + ex.getDescriptionEx() + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Durée</td>");
                    out.println("<td>" + ex.getTempsBaseEx() + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Répétitions</td>");
                    out.println("<td>" + ex.getRepsBaseEx() + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Ressource</td>");
                    out.println("<td>" + ex.getRessourceEx() + "</td>");
                out.println("</tr>");
            out.println("</table>");
        %>
        
        <form action = "Index" ><button type = "submit" >Modifier</button></form>
        
    </body>
</html>
