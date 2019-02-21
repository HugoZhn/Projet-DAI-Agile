<%-- 
    Document   : afficherSeanceClient
    Created on : 20 févr. 2019, 16:39:01
    Author     : hzahn
--%>

<%@page import="java.util.Collections"%>
<%@page import="pojo.Exercice"%>
<%@page import="pojo.ExerciceDeSeance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Seance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Seance seanceAAfficher = (Seance) request.getAttribute("seanceAAfficher");

        Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Transaction t = sessionHibernate.beginTransaction();

        sessionHibernate.saveOrUpdate(seanceAAfficher);

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ma seance</title>
    </head>
    <body>
        <h1>Seance <%= seanceAAfficher.getLibelleSc()%></h1>

        <%
            ArrayList<ExerciceDeSeance> exercicesAAfficher = new ArrayList<>();

            for (Object obj : seanceAAfficher.getExerciceDeSeances()) {
                ExerciceDeSeance objCasted = (ExerciceDeSeance) obj;
                exercicesAAfficher.add(objCasted);
            }

            Collections.sort(exercicesAAfficher);
            
            session.setAttribute("exosAEffectuer", exercicesAAfficher);
            System.out.print(seanceAAfficher);
            session.setAttribute("seanceAEffectuer", seanceAAfficher);

            for (ExerciceDeSeance exo : exercicesAAfficher) {
                out.println("<p>");
                out.println(exo.getExercice().getNomEx() + "<br/>");

                if (exo.getExercice().getDescriptionEx() != null) {
                    out.println(exo.getExercice().getDescriptionEx() + "<br/>");
                }
                
                if (exo.getExercice().getPrecisionsEx() != null) {
                    out.println(exo.getExercice().getPrecisionsEx() + "<br/>");
                }
                
                if (exo.getExercice().getObjectifsEx() != null) {
                    out.println(exo.getExercice().getObjectifsEx() + "<br/>");
                }
                
                if (exo.getExercice().getRessourceEx()!= null) {
                    out.println(exo.getExercice().getRessourceEx() + "<br/>");
                }
                
                if (exo.getNbSeries() != 0) {
                    out.println(exo.getNbSeries() + " x ");
                }
                if (exo.getRepsExSc() != 0) {
                    out.println(exo.getRepsExSc() + " répétitions ");
                }
                
                if (exo.getTempsExSc()!= 0) {
                    out.println(exo.getTempsExSc() + " secondes ");
                }
                
                out.print("</p>");
            }

            t.commit();

        %>
        
        <a href="commencerSeanceClient">Commencer ma séance</a>

    </body>
</html>
