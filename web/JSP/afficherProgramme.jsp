<%-- 
    Document   : afficherProgramme
    Created on : 19 févr. 2019, 18:12:07
    Author     : hzahn
--%>

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
        <title>Programme <%= programmeAAfficher.getLibellePrgrm()%></title>
    </head>
    <body>
        <h1>Programme <%= programmeAAfficher.getLibellePrgrm()%></h1>
        <p>TO-DO</p>
    </body>
    <% t.commit(); %>
</html>
