<%-- 
    Document   : voirExercice
    Created on : 19 févr. 2019, 15:12:36
    Author     : 21607860
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="pojo.TypeExercice"%>
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
            <form action ="CtrlModifExercice" method = "GET">
            <%
                
            // Récupère le message d'avertissement ou d'erreur

            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {

                out.println("<p>" + Confirmation + "</p>");

            }

            // Récupère le message d'avertissement ou d'erreur          
            Exercice ex = (Exercice) session.getAttribute("exercice");

            Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = ses.beginTransaction();

            Query q = ses.createQuery("from TypeExercice");

            List<TypeExercice> listeTypeExercice = (List<TypeExercice>) q.list();

            t.commit();            

            out.println("<table border = 1>");
                out.println("<tr>");
                    out.println("<td>Nom</td>");
                    out.println("<td><input type=\"text\" name = \"nomEx\" value = " + ex.getNomEx() + " required></td>");
                    out.println("<input type=\"text\" name = \"codeEx\" value = " + ex.getCodeEx() + " hidden = \"true\">");
                out.println("</tr>");
                    out.println("<td>Type</td>");  
                    out.println("<td><select name=\"typeEx\" size=\"1\">>");

                    for (TypeExercice TE : listeTypeExercice) {

                        out.println("<option value= " + TE.getCodeTypeEx() + "> " + TE.getLibTypeEx() + "</option>");

                    }

                out.println("</select></td>");
                out.println("<tr>");
                    out.println("<td>Précision</td>");
                    out.println("<td><input type=\"text\" name = \"precisionEx\" value = " + ex.getPrecisionsEx() + " required></td>");
                out.println("</tr>");
                out.println("<tr>");
                    out.println("<td>Objectif</td>");
                    out.println("<td><input type=\"text\" name = \"objectifsEx\" value = " + ex.getObjectifsEx() + " required></td>");
                out.println("</tr>");
                String descriptionEx = "";
                if(ex.getDescriptionEx() != null){ descriptionEx = ex.getDescriptionEx() ; };
                out.println("<tr>");
                    out.println("<td>Description</td>");
                    out.println("<td><input type=\"text\" name = \"descriptionEx\" value = " + descriptionEx + " required></td>");
                out.println("</tr>");
                String tempsbaseEx = "";
                if(ex.getTempsBaseEx() != null){ tempsbaseEx = String.valueOf(ex.getTempsBaseEx()) ; };
                    out.println("<tr>");
                        out.println("<td>Durée</td>");
                        out.println("<td><input type=\"text\" name = \"tempsBaseEx\" value = " + tempsbaseEx + "></td>");
                    out.println("</tr>");     
                String repBaseEx = "";
                if(ex.getRepsBaseEx() != null){ repBaseEx = String.valueOf(ex.getRepsBaseEx()) ; };
                out.println("<tr>");
                    out.println("<td>Répétitions</td>");
                    out.println("<td><input type=\"text\" name = \"repsBaseEx\" value = " + repBaseEx + "></td>");
                out.println("</tr>");
                String ressourceEx = "";
                if(ex.getRessourceEx() != null){ ressourceEx = ex.getRessourceEx() ; };
                out.println("<tr>");
                    out.println("<td>Ressource</td>");
                    out.println("<td><input type=\"text\" name = \"ressourceEx\" value = " + ressourceEx + " required></td>");
                out.println("</tr>");
                
            out.println("</table>");
            
            %>
            <input type ="submit" name="exerciceUpdate" value = "Confirmer">
        </form>
    </body>
</html>
