<%-- 
    Document   : CreerSeance
    Created on : 19 févr. 2019, 14:42:30
    Author     : 21402458
--%>

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
    Query q = ses.createQuery("from ProfilClient"); //récupération des profilclient de la BD
    List<ProfilClient> listeProfilClient = (List<ProfilClient>) q.list();
    
    t.commit();
    
    //On peut sélectionner chaque ProfilClient de la BD
    for (ProfilClient pc : listeProfilClient){
        out.println("<td>");
        out.println("<input type=\"radio\" name=\"profilClientSeance\" value="+ pc.getCodeProfil() + " required>" + pc.getNomProfil()); 
        out.println("</td>");
        }%>
       
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
        </table>
        <input type="submit" value="Créer">
        </form>
    </body>
</html>
