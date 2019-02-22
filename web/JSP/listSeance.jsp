<%-- 
    Document   : voirSeance
    Created on : 20 févr. 2019, 19:37:11
    Author     : 21402458
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Seance"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <h1>Les seances</h1>
        <table>
     <% 
    //recuperation des données d'une seance
    Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
    Transaction t = ses.beginTransaction();
    Query q = ses.createQuery("from Seance");
    List<Seance> listeSeance = (List<Seance>) q.list();
    
    t.commit();
        
    out.println("<tr>");
    out.println("<td>");
    out.println(" les séances ");
    out.println("</td>");
;
    
    for (Seance seancel : listeSeance){
        out.println("<tr>");
        out.println("<td>");
        out.println("<a name=\"seanceselectionne\" href=\"CtrlVoirSeance?noSeance="+seancel.getCodeSc() + "\">" + " Seance :" + seancel.getLibelleSc() + "  Récupérations :" +seancel.getRecupSc()+ " Echauffement : " + seancel.getEchauffement() +  "</a><br/>");
        out.println("</td>");        
        }
     %>
        </table>
        </br>
        <form action="creerSeance" method="GET"> 
            <a href="creerSeance"><input type="button" value="Ajouter une séance" name="ajoutseance">
        </form>
    
</html>
