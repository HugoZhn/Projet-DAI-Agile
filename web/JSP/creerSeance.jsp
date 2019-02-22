<%-- 
    Document   : CreerSeance
    Created on : 19 févr. 2019, 14:42:30
    Author     : 21402458
--%>

<%@page import="pojo.Exercice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="pojo.ProfilClient"%>
<%@page import="pojo.ProfilClient"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Créer une séance </h1> 
        
        <form action="CtrlCreationSeance" name="profilClientSeance" method="GET">
        <table>    
            <tr>
                <td> Profil Client </td> </tr>
            <tr>
                
                <%
                    
                Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                Transaction t = ses.beginTransaction();
                
                Query qPC = ses.createQuery("from ProfilClient"); //récupération des profilclient de la BD
                List<ProfilClient> listeProfilClient = (List<ProfilClient>) qPC.list();
                
                Query qEx = ses.createQuery("from Exercice"); //récupération des ex de la BD
                List<Exercice> listeExercice = (List<Exercice>) qEx.list();

                
                t.commit();

                //On peut sélectionner chaque ProfilClient de la BD
                for (ProfilClient pc : listeProfilClient){
                    out.println("<td>");
                    out.println("<input type=\"radio\" name=\"profilClientSeance\" value="+ pc.getCodeProfil() + " required>" + pc.getNomProfil()); 
                    out.println("</td>");
                }
                %>
            </tr>
            <tr>
                <td> Nom </td> <td> <input type="text" name="nameSeance" required >
            </tr>
            <tr>
                 <td> Récupérations </td> <td> <input type="text" name="recupSeance" required>
            </tr>
            <tr>
                 <td> Echauffement </td> <td> <input type="text" name="echauffementSeance" required>
            </tr>
                        <%
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 1 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"1," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>"); 
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 2 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"2," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 3 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"3," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 4 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"4," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 5 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"5," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 6 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"6," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 7 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"7," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
                        out.println("<tr>");
                out.println("<td id =\"ligne11\">Exercice 8 : <select name=\"exerciceProg\" >");
                    out.println("<option value= \"0\">   </option>");
                        for (Exercice ex : listeExercice) {
                            out.println("<option value=\"8," + ex.getCodeEx()+ "\" > " + ex.getNomEx() + "</option>");
                             }
                    out.println("</select>");
                out.println("</td>");
            out.println("</tr>");
            %>
        </table>
        <input type="submit" value="Créer">
        </form>
    </body>
</html>
