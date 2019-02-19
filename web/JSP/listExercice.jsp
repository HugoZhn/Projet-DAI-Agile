<%-- 
    Document   : listExercice
    Created on : 19 févr. 2019, 10:47:29
    Author     : 21607860
--%>

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

                    } else if (Confirmation != null) {

                        out.println("<p>" + Confirmation + "</p>");

                    }
                }

                try {

                    Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                    Transaction t = ses.beginTransaction();

                    Query q = ses.createQuery("from Exercice");

                    List<Exercice> listeExercice = (List<Exercice>) q.list();

                    t.commit();
                    
                    if (listeExercice.isEmpty()) {

                        out.println("<p>Pas d'exerice enregistré.</p>");

                    } else {
                        out.println("<table border = 1>");
                        out.println("<tr>");
                        out.println("<td>Intitulé</td>");
                        out.println("<td>Objectif</td>");
                        out.println("</tr>");

                        for (Exercice E : listeExercice) {
                            out.println("<tr>");
                            out.println("<td>" + E.getNomEx() + "</td>");
                            out.println("<td>" + E.getObjectifsEx() + "</td>");
                            out.println("</tr>");
                        }

                        out.println("</table>");

                    }
                } catch (Exception ex) {

                    out.println("<p>Erreur dans l'affichage de la liste. " + ex.getMessage() + "</p>");
                    
                }

        %>
        
    </body>
</html>
