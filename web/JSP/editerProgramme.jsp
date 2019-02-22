<%-- 
    Document   : editionProgramme
    Created on : 20 févr. 2019, 22:50:28
    Author     : David
--%>
<%@page import="pojo.ProfilClient"%>
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

    </head>
    <body>
        <%
            Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = ses.beginTransaction();

            Query qProfils = ses.createQuery("from ProfilClient");

            List<ProfilClient> listeProfilClient = (List<ProfilClient>) qProfils.list();
            
            Query qSeances = ses.createQuery("from Seance");

            List<Seance> listeSeance = (List<Seance>) qSeances.list();
            
            t.commit();
            
        %>
        <script>

            function afficher20(ev){for(var i = 21;i<29;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne20").innerHTML = "Semaine 2";document.getElementById("boutonSemaine3").hidden = false;}
            function afficher30(ev){for(var i = 31;i<39;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne30").innerHTML = "Semaine 3";document.getElementById("boutonSemaine4").hidden = false;}
            function afficher40(ev){for(var i = 41;i<49;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne40").innerHTML = "Semaine 4";document.getElementById("boutonSemaine5").hidden = false;}
            function afficher50(ev){for(var i = 51;i<59;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne50").innerHTML = "Semaine 5";document.getElementById("boutonSemaine6").hidden = false;}
            function afficher60(ev){for(var i = 61;i<69;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne60").innerHTML = "Semaine 6";document.getElementById("boutonSemaine7").hidden = false;}
            function afficher70(ev){for(var i = 71;i<79;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne70").innerHTML = "Semaine 7";document.getElementById("boutonSemaine8").hidden = false;}
            function afficher80(ev){for(var i = 81;i<89;i++){var id = "ligne" + i;document.getElementById(id).hidden = false;}document.getElementById("ligne80").innerHTML = "Semaine 8";document.getElementById("boutonSemaine8").hidden = false;}

        </script>
        <h2>Création programme</h2>
            <%
                
            // Récupère le message d'avertissement ou d'erreur
            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {

               out.println("<p>" + Confirmation + "</p>");

            }

            %>
            <form action ="CtrlEditerProgramme" method = "GET">
            <table>
                <tr>
                    <td>Libellé : <input id = "nomUpdateExercice" type="text" name = "libellePrgrm" required value=" "></td>
                </tr>
                <%
                
                    out.println("<tr>");
                        out.println("<td>Type de profil : <select name=\"codeProfil\" >");
                            for (ProfilClient PC : listeProfilClient) {
                                out.println("<option value= " + PC.getCodeProfil() + "> " + PC.getNomProfil() + "</option>");
                            }
                        out.println("</select></td>");
                    out.println("</tr>");

                    out.println("<tr>");
                        out.println("<td id =\"ligne10\">Semaine 1</td>");
                        out.println("<td id =\"ligne20\"><button onclick=\"afficher20(event)\" id =\"boutonSemaine2\" >+</button></td>");
                        out.println("<td id =\"ligne30\"><button onclick=\"afficher30(event)\" id =\"boutonSemaine3\" hidden>+</button></td>");
                        out.println("<td id =\"ligne40\"><button onclick=\"afficher40(event)\" id =\"boutonSemaine4\" hidden>+</button></td>");
                        out.println("<td id =\"ligne50\"><button onclick=\"afficher50(event)\" id =\"boutonSemaine5\" hidden>+</button></td>");
                        out.println("<td id =\"ligne60\"><button onclick=\"afficher60(event)\" id =\"boutonSemaine6\" hidden>+</button></td>");
                    out.println("</tr>");

                    out.println("<tr>");
                            out.println("<td id =\"ligne11\">Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne21\" hidden >Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne31\" hidden >Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne41\" hidden >Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne51\" hidden >Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"5,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne61\" hidden >Séance 1 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"6,1," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");

                    out.println("</tr>"); 

                    out.println("<tr>");
                            out.println("<td id =\"ligne12\" >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne22\" hidden >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne32\" hidden >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne42\" hidden >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne52\" hidden >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"5,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne62\" hidden >Séance 2 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"6,2," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                    out.println("</tr>");

                    out.println("<tr>");
                            out.println("<td id =\"ligne13\" >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne23\" hidden >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne33\" hidden >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne43\" hidden >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne53\" hidden >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne63\" hidden >Séance 3 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>"); 

                    out.println("<tr>");
                            out.println("<td id =\"ligne14\" >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,4," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne24\" hidden >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,4," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne34\" hidden >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,3," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne44\" hidden >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,4," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne54\" hidden >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,4," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne64\" hidden >Séance 4 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,4," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>"); 

                    out.println("<tr>");
                            out.println("<td id =\"ligne15\" >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne25\" hidden >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne35\" hidden >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne45\" hidden >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne55\" hidden >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne65\" hidden >Séance 5 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,5," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>"); 
                    out.println("<tr>");
                            out.println("<td id =\"ligne16\">Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne26\" hidden >Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne36\" hidden >Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne46\" hidden >Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne56\" hidden >Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne66\" hidden >Séance 6 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,6," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>"); 
                    out.println("<tr>");
                            out.println("<td id =\"ligne17\">Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne27\" hidden >Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne37\" hidden >Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne47\" hidden >Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne57\" hidden >Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne67\" hidden >Séance 7 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,7," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>"); 
                    out.println("<tr>");
                            out.println("<td id =\"ligne18\">Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"1,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne28\" hidden >Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"2,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne38\" hidden >Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne48\" hidden >Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne58\" hidden >Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"3,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                            out.println("<td id =\"ligne68\" hidden >Séance 8 : <select name=\"seanceProg\" >");
                                    out.println("<option value= \"0\">   </option>");
                                for (Seance SC : listeSeance) {
                                    out.println("<option value=\"4,8," + SC.getCodeSc() + "\" > " + SC.getLibelleSc() + "</option>");
                                }
                                out.println("</select>");
                            out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<button type=\"submit\" id =\"boutonSave\">Valider programme</button>"); 
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("</form>");    
                %>    
            </table

        <script type="text/JavaScript" charset="utf-8" src="jsEditionProgramme"></script>
    </body>
</html>
