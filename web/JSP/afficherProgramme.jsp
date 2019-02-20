<%-- 
    Document   : afficherProgramme
    Created on : 19 févr. 2019, 18:12:07
    Author     : hzahn
--%>

<%@page import="java.util.Set"%>
<%@page import="pojo.SeanceAppartenir"%>
<%@page import="pojo.Seance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Programme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Programme programmeAAfficher = (Programme) request.getAttribute("programmeAAfficher");
        
        Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Transaction t = sessionHibernate.beginTransaction();
        
        sessionHibernate.saveOrUpdate(programmeAAfficher);
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mon programme</title>
    </head>
    <body>
        <h1>Programme <%= programmeAAfficher.getLibellePrgrm()%></h1>
        <h2>Mes scéances actives</h2>
        <%
            ArrayList<Seance> seancesAAfficher = new ArrayList();
            
            for(Object snc : programmeAAfficher.getSeanceAppartenirs()){
                SeanceAppartenir sncCasted = (SeanceAppartenir)snc;
                if(sncCasted.isActive()){
                    seancesAAfficher.add((Seance)sessionHibernate.get(Seance.class, sncCasted.getId().getCodeSc()));
                }
            }
        %>
        <p>TO-DO</p>
    </body>
    <% t.commit(); %>
</html>
