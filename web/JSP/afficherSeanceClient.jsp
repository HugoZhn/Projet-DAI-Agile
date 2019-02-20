<%-- 
    Document   : afficherSeanceClient
    Created on : 20 févr. 2019, 16:39:01
    Author     : hzahn
--%>

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
        <h1>Seance n°<%= seanceAAfficher %></h1>
    </body>
</html>
