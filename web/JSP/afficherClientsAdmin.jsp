<%-- 
    Document   : afficherClientsAdmin
    Created on : 18 févr. 2019, 16:13:03
    Author     : fhamzaoui
--%>

<%@page import="pojo.Client"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/as-pie-progress/css/progress.min.css">
  <link rel="stylesheet" href="assets/datatables/data-tables.bootstrap4.min.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Affichage des clients</title>
    </head>
    <body>
    <center>
        <h1>Affichage clients Validés</h1>
        
        <div class="col-md-6">
                <div class="dataTables_filter">
                  <label class="searchInfo mbr-fonts-style display-7">Rechercher : </label>
                  <input class="form-control input-sm" disabled="">
                </div>
            </div>
             <table class="table isSearch" cellspacing="0">
            <thead>
              <tr class="table-heads ">                 
              <th class="head-item mbr-fonts-style display-7">Nom</th>
              <th class="head-item mbr-fonts-style display-7">Prenom</th>
              <th class="head-item mbr-fonts-style display-7"> Programme</th>
              <th class="head-item mbr-fonts-style display-7"> Profil Sportif</th>
              <th class="head-item mbr-fonts-style display-7"> Date Inscription</th>
              </tr>
            </thead>

            <tbody>
         <% //Requête : affichage toutes les demandes
         
        List<Client> listeClients = (List<Client>)request.getAttribute("listeClients");
        
        for(Client unClient : listeClients){
            out.print("<tr><td class=\"body-item mbr-fonts-style display-7\">" + unClient.getNom() + "</td>"
                    + " <td \"body-item mbr-fonts-style display-7\">" + unClient.getPrenom() + "</td>"
                            + " <td \"body-item mbr-fonts-style display-7\">" + unClient.getProgrammes().toString() + "</td>"
                                    + "<td \"body-item mbr-fonts-style display-7\">" + unClient.getProfilClient().getNomProfil() + "</td>"
                                            + "<td \"body-item mbr-fonts-style display-7\">" + unClient.getDateInscritpion() + "</td></tr>");
        }
         %>
            </tbody>
             </table>
        </center>
    </body>
</html>
