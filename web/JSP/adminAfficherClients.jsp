<%-- 
    Document   : newjsp2
    Created on : 20 févr. 2019, 00:49:35
    Author     : fhamzaoui
--%>

<%@page import="pojo.ProfilClient"%>
<%@page import="pojo.ProgrammeClient"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Admin - Liste Clients</title>
        <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
        <link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css'>
        <link rel='stylesheet' href='http://rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/css/bootstrap-editable.css'>
    </head>
    <body>
        <div class="container">
            <h1>Liste de clients validés</h1>


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
                        <th data-field="nom" data-filter-control="input" data-sortable="true">Nom</th>
                        <th data-field="prenom" data-filter-control="input" data-sortable="true">Prénom</th>
                        <th data-field="dateInscription" data-filter-control="select" data-sortable="true">Profil Sportif</th>
                        <th data-field="programme" data-filter-control="select" data-sortable="true">Programme</th>
                        <th data-field="profilSportif" data-filter-control="select" data-sortable="true">Date Inscription</th>
                    </tr>
                </thead>
                <tbody>
                    <% //Requête : affichage tous les clients         
                        List<Client> listeClients = (List<Client>) request.getAttribute("listeClients");
                        System.out.println(listeClients);
                        for (Client unClient : listeClients) {
                            out.println("<tr class=\"linked\" id=\""+unClient.getLogin()+"\">");
                            out.println("<td class=\"body-item mbr-fonts-style display-7\">" + unClient.getNom() + "</td>");
                            out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + unClient.getPrenom() + "</td>");
                            ProgrammeClient currentProgramme = unClient.getCurrentProgramme();
                            if (currentProgramme != null) {
                                out.println("<td class=\"body-item mbr-fonts-style display-7\">" + currentProgramme.getLibellePrgrm() + "</td>");
                            } else {
                                out.println("<td></td>");
                            }
                            ProfilClient profilDuClient = unClient.getProfilClient();
                            if (profilDuClient != null) {
                                out.println("<td class=\"body-item mbr-fonts-style display-7\">" + profilDuClient.getNomProfil() + "</td>");
                            } else {
                                out.println("<td></td>");
                            }
                            out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + unClient.getDateInscritpion() + "</td>");
                            out.println("</tr>");
                        }%>
                </tbody>
            </table>
        </div>
    <center>
        <form action="formBoostrap"><button type="submit" class="btn btn-outline-secondary">Accueil</button></form><br/>      
        
    </center> 
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
    </script>
        <script type="text/JavaScript" src="jsAfficherClientTest" charset="UTF-8"></script>

</body>
</html>