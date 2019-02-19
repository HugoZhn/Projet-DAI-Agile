<%-- 
    Document   : afficherClientsAdmin
    Created on : 18 févr. 2019, 16:13:03
    Author     : fhamzaoui
--%>

<%@page import="pojo.ProfilClient"%>
<%@page import="pojo.ProgrammeClient"%>
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
            out.println("<tr>");
            out.println("<td class=\"body-item mbr-fonts-style display-7\">" + unClient.getNom() + "</td>");
            out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + unClient.getPrenom() + "</td>");            
            ProgrammeClient currentProgramme = unClient.getCurrentProgramme();
            if (currentProgramme != null){
                out.println("<td class=\"body-item mbr-fonts-style display-7\">" + currentProgramme.getLibellePrgrm() + "</td>");
            }else{out.println("<td></td>");}            
            ProfilClient profilDuClient = unClient.getProfilClient();
            if (profilDuClient != null){
                out.println("<td class=\"body-item mbr-fonts-style display-7\">" + profilDuClient.getNomProfil() + "</td>");
            }else{
                out.println("<td></td>");
            }
             out.println(" <td class=\"body-item mbr-fonts-style display-7\">" + unClient.getDateInscritpion() + "</td>");
             out.println("<td> <button type=\"button\" class=\"btn btn-outline-primary btn-sm\" type=\"submit\">"
                                                    + " <span class=\"mbri-italic mbr-iconfont mbr-iconfont-btn\"></span>"
                                                    + "</button><button type=\"button\" class=\"btn btn-outline-success btn-sm\" type=\"submit\"> "
                                                    + "<span class=\"mbri-success mbr-iconfont mbr-iconfont-btn\">"
                                                    + "</span></button><button type=\"button\" class=\"btn btn-outline-danger btn-sm\" type=\"submit\"> "
                                                    + "<span class=\"mbri-close mbr-iconfont mbr-iconfont-btn\"></span></button></td>");
            out.println("</tr>");
        }
        
         %>
         
            </tbody>
             </table>
        </center>
    </body>
    <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smoothscroll/smooth-scroll.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/as-pie-progress/jquery-as-pie-progress.min.js"></script>
  <script src="assets/datatables/jquery.data-tables.min.js"></script>
  <script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
</html>