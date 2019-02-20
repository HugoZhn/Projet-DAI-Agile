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
        <title>Modification exercice</title>
    </head>
    <body>
        <a href = "Index">Retour Index</a>
        
        <h1>Modification d'un exercice</h1>       
            <form>
            <%
                // Récupère le message d'avertissement ou d'erreur          
                Exercice ex = (Exercice) session.getAttribute("exercice");

                out.println("<table border = 1>");
                    out.println("<tr>");
                        out.println("<td>Nom</td>");
                        out.println("<td><input type=\"text\" name = \"nomEx\" value = " + ex.getNomEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Type</td>");
                        out.println("<td><input type=\"text\" name = \"typeEx\" value = " + ex.getRessourceEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Objectif</td>");
                        out.println("<td><input type=\"text\" name = \"objectifsEx\" value = " + ex.getObjectifsEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Description</td>");
                        out.println("<td><input type=\"text\" name = \"descriptionEx\" value = " + ex.getDescriptionEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Durée</td>");
                        out.println("<td><input type=\"text\" name = \"tempsBaseEx\" value = " + ex.getTempsBaseEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Répétitions</td>");
                        out.println("<td><input type=\"text\" name = \"repsBaseEx\" value = " + ex.getRepsBaseEx() + " required></td>");
                    out.println("</tr>");
                    out.println("<tr>");
                        out.println("<td>Ressource</td>");
                        out.println("<td><input type=\"text\" name = \"ressourceEx\" value = " + ex.getRessourceEx() + " required></td>");
                    out.println("</tr>");
                out.println("</table>");
            %>
            <input type ="submit" name="exerciceUpdate" value = "Confirmer">
        </form>
    </body>
</html>
