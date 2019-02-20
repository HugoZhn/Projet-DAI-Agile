<%-- 
    Document   : menuClient
    Created on : 19 févr. 2019, 13:42:02
    Author     : hzahn
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% //to-do : vérifier qu'on a un client en session 
        Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Transaction t = sessionHibernate.beginTransaction();
        Client clientSession = (Client)sessionHibernate.get(Client.class, 25);
        session.setAttribute("clientSession", clientSession);
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page temporaire pour le menu du client</title>
    </head>
    <body>
        <h1>Page temporaire pour le menu du client</h1>
        <a href="CtrlVoirProgrammeClient?idProgramme=<%= clientSession.getCurrentProgramme().getCodePrgrm()%>">Voir mon programme</a>
        
    </body>
    <%
        t.commit();
    %>
</html>
