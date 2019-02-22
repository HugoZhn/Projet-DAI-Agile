<%-- 
    Document   : uneSeance
    Created on : 21 févr. 2019, 09:07:30
    Author     : 21402458
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.ExerciceDeSeance"%>
<%@page import="pojo.Exercice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Set"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Seance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table> 
            <form method="GET" action = "CtrlSupprimerSeance">
            <%
                //recuperation des valeurs
                Seance seances = (Seance) request.getAttribute("maSeance");
                String nomseance = seances.getLibelleSc();
                String recupseance = seances.getRecupSc();
                String echaufseance = seances.getEchauffement();
                String profilc = seances.getProfilClient().getNomProfil();
                Integer codesc = seances.getCodeSc();
               
                ArrayList<ExerciceDeSeance> exercicesAAfficher = new ArrayList<>();

                for (Object obj : seances.getExerciceDeSeances()) 
                {
                    ExerciceDeSeance objCasted = (ExerciceDeSeance) obj;
                    exercicesAAfficher.add(objCasted);
                }
                //Collections.sort(exercicesAAfficher);
                
                out.println(" <h1> Seance "+ nomseance + "</h1>");

                out.println("<tr>");
                out.println("<td>");
                out.println(" Recupérations : ");
                out.println("</td>");
                out.println("<td>");
                out.println(recupseance);
                out.println("</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<td>");
                out.println(" Echauffement : ");
                out.println("</td>");
                out.println("<td>");
                out.println(echaufseance);
                out.println("</td>");
                out.println("</tr>");

                out.println("<tr>");
                out.println("<td>");
                out.println(" profil Client : ");
                out.println("</td>");
                out.println("<td>");
                out.println(profilc);
                out.println("</td>");
                out.println("</tr>");

                if(exercicesAAfficher.isEmpty()){
                    out.println("Il n'y a pas encore d'exercices pour cette séance");
                } else {
                out.println("<tr>");
                out.println("<td>");
                out.println(" Exercices : ");
                out.println("</td>");
                out.println("</tr>");
                
                //pour chaque exercice on affiche ses caractéristiques. 
                for (ExerciceDeSeance exseance : exercicesAAfficher) 
                {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(exseance.getExercice().getNomEx());
                    out.println("</td>");
                    out.println("<td>");
                    out.println("("+ exseance.getExercice().getTypeExercice().getLibTypeEx()+ ")");
                    out.println("</td>");
                    
                    if(exseance.getExercice().getTempsBaseEx()!=0){
                    out.println("<td>");
                    out.println(" Durée :" + exseance.getExercice().getTempsBaseEx());
                    out.println("</td>");
                    }
                    
                    if(exseance.getExercice().getRepsBaseEx() !=0){
                    out.println("<td>");
                    out.println(" Répétitions :" +exseance.getExercice().getRepsBaseEx());
                    out.println("</td>");
                    }
                }
                    out.println("</tr>");
                }

            %>
        </table>
        <input hidden ="true" type="text" name="codesc" value ="<%=codesc%>"></input>
        <button id ="boutonDeleteSeance" type="submit"> Supprimer </button> 
        </form>
        <p id = "phraseSupprimer" hidden = "true"> Confirmez-vous la suppression de cette seance ?<p>

        <%
            out.println("<form method=\"GET\" action = \"CtrlSupprimerSeance\">");   
                out.println("<input hidden = \"true\" type=\"text\" name = \"codeSc\" value ="  + codesc + "></input>");
                out.println("<button type = \"submit\" id =\"ouiSupprimer\" hidden = \"true\">Oui</button>");
            out.println("</form>");
        %>
        
        <button id ="nonSupprimer" hidden = "true"> Non </button> 
        <script type="text/JavaScript" charset="utf-8" src="JS/jsSuppSeance"></script>
        
    </body>
</html>
