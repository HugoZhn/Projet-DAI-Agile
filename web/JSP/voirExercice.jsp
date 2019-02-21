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
        <title>Consulstation exercice</title>
    </head>
    <body>
        <h1>Consulstation d'un exercice</h1>     
        
            <a href = "Index">Retour Index</a>
            
            <form>
            <%
            // Récupère le message d'avertissement ou d'erreur

            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {

                out.println("<p>" + Confirmation + "</p>");

            }

                Exercice ex = (Exercice) session.getAttribute("exercice");

                out.println("<h3>" + ex.getNomEx() + "</h3>");
                
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
                    if(ex.getTempsBaseEx() != null){
                        out.println("<tr>");
                            out.println("<td>Durée</td>");
                            out.println("<td>" + ex.getTempsBaseEx() + "</td>");
                        out.println("</tr>");
                    }
                    if(ex.getRepsBaseEx() != null){
                    out.println("<tr>");
                        out.println("<td>Répétitions</td>");
                        out.println("<td>" + ex.getRepsBaseEx() + "</td>");
                    out.println("</tr>");
                    }
                    if(ex.getRessourceEx() != null){
                    out.println("<tr>");
                        out.println("<td>Ressource</td>");
                        out.println("<td>" + ex.getRessourceEx() + "</td>");
                    out.println("</tr>");
                    }
                out.println("</table>");

            %>       
        
        </form> 
            
        <a href = "modifExercice"> Modifier </a>

        <button id ="boutonDeleteExercice"> Supprimer </button> 
        
        <p id = "phraseSupprimer" hidden = "true">Confirmez-vous la suppression ?<p>

        <%
            out.println("<form action = \"CtrlSupprimerExercice\">");   
                out.println("<input hidden = \"true\" type=\"text\" name = \"codeEx\" value ="  + ex.getCodeEx() + "></input>");
                out.println("<button type = \"submit\" id =\"ouiSupprimer\" hidden = \"true\">Oui</button>");
            out.println("</form>");
        %>
        
        <button id ="nonSupprimer" hidden = "true"> Non </button> 
        
        <script type="text/JavaScript" charset="utf-8" src="jsSuppExercice"></script>
        
    </body>
</html>
