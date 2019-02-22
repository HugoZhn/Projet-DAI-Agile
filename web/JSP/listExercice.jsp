<%-- 
    Document   : listExercice
    Created on : 19 févr. 2019, 10:47:29
    Author     : 21607860
--%>

<%@page import="pojo.TypeExercice"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.io.IOException"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="pojo.Exercice"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
        <link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css'>
        <link rel='stylesheet' href='http://rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/css/bootstrap-editable.css'>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <title>Liste des exercices</title>
    </head>
    <body>
    <center><h1>Liste des exercices</h1></center>

        <%
            // Récupère le message d'avertissement ou d'erreur
            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {
                if (Confirmation.equals("Ok")) {

                    out.println("<br/><p>Votre exercice a bien été enregistré.</p><br/>");

                } else {

                    out.println("<p>" + Confirmation + "</p>");

                }
            }

            try {

                List<Exercice> listeExercice = (List<Exercice>) session.getAttribute("listeExercice");

                if (listeExercice.isEmpty()) {

                    out.println("<p>Pas d'exerice enregistré.</p>");

                } else { %>
        <div class="container">
            <table id="table" 
                   data-toggle="table"
                   data-search="true"
                   data-filter-control="true" 
                   data-show-export="false"
                   data-click-to-select="false"
                   data-toolbar="#toolbar"
                   class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th data-field="dateInscription" data-filter-control="select" data-sortable="true">Nom Exercice</th>
                        <th data-field="programme" data-filter-control="select" data-sortable="true">Type Exercice</th>
                        <th data-field="profilSportif" data-filter-control="select" data-sortable="true">Objectfs Exercice</th>
                    </tr>
                </thead>       
                <tbody>
                    <%
                                for (Exercice E : listeExercice) {
                                    out.println("<tr class=\"linked\" id=\"" + E.getCodeEx() + "\">");
                                    out.println("<td class=\"body-item mbr-fonts-style display-7\">" + E.getNomEx() + "</td>");
                                    out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + E.getTypeExercice().getLibTypeEx() + "</td>");
                                    out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + E.getObjectifsEx() + "</td>");
                                }
                                out.println("</tbody>");
                                out.println("</table>");
                                out.println("</div>");
                                out.println("<center><div class=\"btn-group\">");
                                out.println("<form action=\"accueilCoach\"><button type=\"submit\" class=\"btn btn-outline-secondary\">Accueil</button></form><br/>");
                                out.println("<form action=\"editionExercice\"><button type=\"submit\" class=\"btn btn-outline-secondary\">Créer Exercice</button></form><br/>");
                                out.println("</div></center>");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            out.println("<p>Erreur dans l'affichage de la liste. " + ex.getMessage() + "</p>");

                        }

                    %>

                    </body>
               
                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
                <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.js'></script>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/editable/bootstrap-table-editable.js'></script>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/export/bootstrap-table-export.js'></script>
                <script src='http://rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js'></script>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/filter-control/bootstrap-table-filter-control.js'></script>
                <style>
                    .container {
                        width: 1024px;
                        padding: 2em;
                    }
                    .bold-blue {
                        font-weight: bold;
                        color: #0277BD;
                    }</style>
                <script>
                    //exporte les données sélectionnées
                    var $table = $('#table');
                    $(function () {
                        $('#toolbar').find('select').change(function () {
                            $table.bootstrapTable('refreshOptions', {
                                exportDataType: $(this).val()
                            });
                        });
                    })
                    var trBoldBlue = $("table");
                    $(trBoldBlue).on("click", "tr", function () {
                        $(this).toggleClass("bold-blue");
                    });


                    function redirectToServlet() {
                        window.location.replace("CtrlVoirExercice?action=" + this.id);
                    }

                    document.addEventListener("DOMContentLoaded", () => {
                        var eltsALier = document.getElementsByClassName("linked");
                        for (var i = 0; i < eltsALier.length; i++) {
                            console.log(eltsALier[i]);
                            eltsALier[i].addEventListener("click", redirectToServlet)
                        }
                    });
                </script>

                </body>
                </html>