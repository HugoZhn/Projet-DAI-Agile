<%-- 
    Document   : AfficherListProgramme
    Created on : 21 févr. 2019, 18:49:42
    Author     : 21408162
--%>

<%@page import="java.util.List"%>
<%@page import="pojo.Programme"%>
<%@page import="pojo.Programme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
         <meta charset="UTF-8">
        <title>Admin - Liste Clients</title>
        <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
        <link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css'>
        <link rel='stylesheet' href='http://rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/css/bootstrap-editable.css'>
        <title>List des programmes</title>
    </head>
    <body>
        <div class="container">
            <h1>List des programmes</h1>
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
                    <th data-field="nom" data-filter-control="input" data-sortable="true">Num programme</th>
                    <th data-field="prenom" data-filter-control="input" data-sortable="true">Nom programme</th>
                </tr>
                
                
                </thead>
                <tbody>
                 
             <%
                 
                    List<Programme> listProgrammes = (List<Programme>) request.getAttribute("listProgrammes");
                    System.out.println("LISTE PROGRAMME JSP : " + listProgrammes);
                  
                    for (Programme prog : listProgrammes) {
                        out.println("<tr>");
                        out.println("<td class=\"linked\" id=\">" +prog.getCodePrgrm()+"</td>");
                        out.println("<td class=\"body-item mbr-fonts-style display-7\">" +prog.getLibellePrgrm()+"</td>");
                        out.println("</tr>");
                    }
                %>  
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
        <script type="text/JavaScript" src="jsAfficherProgramme" charset="UTF-8"></script>  
    </body>
</html>
