<%-- 
    Document   : listExercice
    Created on : 19 févr. 2019, 10:47:29
    Author     : 21607860
--%>

<%@page import="pojo.TypeExercice"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.io.IOException"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="pojo.Exercice"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des exercices</title>
    </head>
    <body>
        
        <a href = "Index">Retour Index</a>
        
        <h1>Liste des exercices</h1>

        <%
                // Récupère le message d'avertissement ou d'erreur
                String Confirmation = request.getParameter("msg_avrt");

                if (Confirmation != null) {
                    if (Confirmation.equals("Ok")) {

                        out.println("<br/><p>Votre exercice a bien été enregistré.</p><br/>");

                    } else {    

                        out.println("<p>" + Confirmation + "</p>");

                    }
                }

                try {
                    
                    List<Exercice> listeExercice = (List<Exercice>) session.getAttribute("listeExercice");

                    if (listeExercice.isEmpty()) {

                        out.println("<p>Pas d'exerice enregistré.</p>");

                    } else {
                        out.println("<table >");
                        out.println("<tr>");
                            out.println("<td>Exercices</td>");
                        out.println("</tr>");

                        for (Exercice E : listeExercice) {
                            out.println("<tr>");
                               out.println("<td><a href = \"CtrlVoirExercice?action=" + E.getCodeEx() + "\">" + E.getNomEx() + " - " + E.getTypeExercice().getLibTypeEx() + " - " + E.getObjectifsEx() + "</a></td>");
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println("<p>Erreur dans l'affichage de la liste. " + ex.getMessage() + "</p>");
                    
                }

        %>
        
    </body>
</html>
