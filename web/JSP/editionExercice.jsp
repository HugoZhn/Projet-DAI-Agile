<%-- 
    Document   : editionExercice
    Created on : 18 févr. 2019, 14:09:43
    Author     : 21607860
--%>

<%@page import="pojo.TypeExercice"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Création Exercice</title>
    </head>
    <body>

        <a href = "Index">Retour Index</a>

        <h1>Création exercice</h1>

        <%
            // Récupère le message d'avertissement ou d'erreur

            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {

                out.println("<p>" + Confirmation + "</p>");

            }

        %>

        <form action ="CtrlCreationExercice" method = "GET">
            <table>
                <tr>
                    <td>Nom :</td>
                    <td><input id = "nomUpdateExercice" type="text" name = "nomEx" required></td>
                    <td><p id = "verifExiste" ></p></td>
                </tr>
                <tr>
                    <td>Type :</td>
                    <%  
                        try {

                            Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                            Transaction t = ses.beginTransaction();

                            Query q = ses.createQuery("from TypeExercice");

                            List<TypeExercice> listeTypeExercice = (List<TypeExercice>) q.list();

                            out.println("<td><select name=\"typeEx\" size=\"1\">");

                            for (TypeExercice TE : listeTypeExercice) {

                                out.println("<option value= " + TE.getCodeTypeEx() + "> " + TE.getLibTypeEx() + "</option>");

                            }

                            out.println("</select></td>");

                            t.commit();

                        } catch (Exception ex) {

                            out.println("<td>Erreur de chargement des types d'exercice. " + ex.getMessage() + "</td>");

                        }
                    %>       
                </tr>
                <tr>                        
                    <td>Objectif :</td>
                    <td><input type="text" name = "objectifsEx" required></td>
                </tr>
                <tr>                        
                    <td>Précisions :</td>
                    <td><input type="text" name = "precisionEx" required></td>
                </tr>
                <tr>                        
                    <td>Description :</td>
                    <td><input type="text" name = "descriptionEx"></td>
                </tr>
                <tr>                        
                    <td>Illustration :</td>
                    <td><input type="text" name = "ressourceEx"></td>
                </tr>
                <tr>                        
                    <td>Durée :</td>
                    <td><input type="double" name = "tempsBaseEx"></td>
                </tr>
                <tr>                        
                    <td>Répétitions :</td>
                    <td><input type="int" name = "repsBaseEx"></td>
                </tr>

            </table>
            <input id="exerciceUpdate" type="submit" name="exerciceUpdate" value = "Confirmer">
        </form>

        <script type="text/JavaScript" charset="utf-8" src="jsCreaExercice"></script>
    </body>
</html>
