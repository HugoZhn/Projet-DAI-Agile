<%-- 
    Document   : commencerSeanceClient
    Created on : 21 févr. 2019, 11:46:10
    Author     : hzahn
--%>

<%@page import="pojo.Client"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Seance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Seance seanceAEffectuer = (Seance) session.getAttribute("seanceAEffectuer");
        Client clientSession = (Client) session.getAttribute("clientSession");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seance en cours</title>
    </head>
    <body>
        <h1>Seance <%= seanceAEffectuer.getLibelleSc()%></h1>
        <div id="main">
        <div id="AffichageExo"></div>
        <span id="Timer"></span>
        <div id="btnDiv"><button hidden="true" id="btnCommencerSeance" value="<%= seanceAEffectuer.getCodeSc()%>">Fake</button></div>
        <a href="CtrlVoirProgrammeClient?idProgramme=<%= clientSession.getCurrentProgramme().getCodePrgrm()%>" hidden="true" id="back">Finir ma seance</a>
        </div>
    </body>
    <script type="text/JavaScript" src="FaireSeanceJS" charset="UTF-8"></script>
</html>
