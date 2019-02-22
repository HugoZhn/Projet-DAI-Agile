<%-- 
    Document   : editionProgramme
    Created on : 20 févr. 2019, 22:50:28
    Author     : David
--%>
<%@page import="pojo.Seance"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <link rel="stylesheet" type="text/css" href="CSS/cssEditionProgramme.css"/>
    <head>
        <script>

            function allowDrop(ev) {
                ev.preventDefault();
            }
            function drag(ev) {
                ev.dataTransfer.setData("text", ev.target.id);
            }
            function drop(ev) {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
            }

        </script>
    </head>
    <body>
        <%
            Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();

            Query q = sessionHibernate.createQuery("from Seance");

            List<Seance> listeSeance = (List<Seance>) q.list();

            t.commit();

            int nbSemaine = 1;

            //out.println("<form>");
            out.println("<div id=\"Semaine0\" hidden=\"true\">");
            out.println("<table class = \"tabSeances\" id = \"tabSeances\">");
            out.println("<tr id =\"listeSemaines\">");
            out.println("<td ><div id=\"nomSemaine\"> Semaine 1 </div></td>");
            out.println("<td><button id =\"boutonAjouterSemaine\"> + </button></td>");
            out.println("</tr>");
            out.print("<tr id =\"listeSeances\">");
            out.println("<td id =\"ajoutSeance\"><div id=\"ordreSeance\" hidden = true>1</div><select id =\"seance_1\">");
            for (Seance E : listeSeance) {
                out.println("<option><div>" + E.getLibelleSc() + "</div></option>");
            }
            out.println("</select></td>");
            out.println("</tr>");

            out.println("<tr>");
            out.println("<td><button id =\"boutonAjouterSeance\" value=\"0\"> + </button></td>");
            out.println("</tr>");
            out.println("</table>");

            out.println("</table>");
            out.println("</div>");

            //out.println("</form>");
%>
        <script type="text/JavaScript" charset="utf-8" src="jsEditionProgramme"></script>
    </body>
</html>
