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
        <h1>Programme <%= programmeAAfficher.getLibellePrgrm() %></h1>
        <h2>Mes scéances actives</h2>
        <%
            ArrayList<SeanceAppartenir> seancesAAfficher = new ArrayList();

            for(Object obj : programmeAAfficher.getSeanceAppartenirs()){
                SeanceAppartenir objCasted = (SeanceAppartenir)obj;
                if(objCasted.isActive()){
                    seancesAAfficher.add( objCasted );
                }
            }
            for(SeanceAppartenir snc : seancesAAfficher){
                Integer ordre = snc.getId().getOrdre();
                System.out.println(ordre);
                out.println("<a href=\"CtrlAfficherSeanceClient?noSeance="+snc.getSeance().getCodeSc() + "\">" + ordre.toString() + " - " + snc.getSeance().getLibelleSc() + "</a><br/>");
            }

        %>
    </body>
    <% t.commit(); %>
</html>
