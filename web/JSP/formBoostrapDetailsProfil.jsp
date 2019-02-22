<%-- 
    Document   : formBoostrapDetailsProfil
    Created on : 20 févr. 2019, 17:03:27
    Author     : fhamzaoui
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="pojo.ProfilClient"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page import="pojo.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COACH - Details Profil Client</title>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </head>
    <body>


        <%
            // Récupère le message d'avertissement ou d'erreur
            String Confirmation = request.getParameter("msg_avrt");
            String erreur = request.getParameter("msg_erreur");

            //Recupération du informations du client
            Client theClient = (Client) session.getAttribute("theClient");

            //Création et initialisation variables à afficher pour modifier 
            String login = theClient.getLogin();
            String password = theClient.getPassword();
            String firstName = theClient.getNom();
            String lastName = theClient.getPrenom();
            Date birthDay = theClient.getDateNaissance();
            String mail = theClient.getMailClient();
            String phone = theClient.getTelephone();
            String nameSportProfil = "Profil Non Renseigné";
            if (theClient.getProfilClient() != null) {
                nameSportProfil = theClient.getProfilClient().getNomProfil();
            }
            String typeAbo = theClient.getTypeAbonnement();

            String sexe = theClient.getSexe();

        %>
        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    <h3>Plateforme Coach</h3>
                    <p>Visualisation détails d'un client</p>
                    <form action="formBoostrap">
                        <input type="submit" name="" value="Accueil"/>                        
                    </form>
                    <form action="CtrlListeClients">
                        <input type="submit" name="" value="Mes Clients"/>                        
                    </form>
                    <br/>
                </div>
                <div class="col-md-9 register-right">
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#client" role="tab" aria-controls="home" aria-selected="true">Client</a>
                        </li>                        
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="client" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">Détails Client</h3>                                

                            <div class="row register-form">
                                <center>
                                    <%String message = (String) request.getAttribute("msg_erreur");
                                            if (message != null) {
                                                out.println("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">"
                                                        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><strong>" + message + "</strong></div>");
                                            }%>                                        
                                </center>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Identifiant</label>
                                        <input type="text" name="login" class="form-control" placeholder="Identifiant *" value="<%= login%>" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Mot de passe</label>
                                        <input type="text" class="form-control" name="passwordClient" id="passwordClient" placeholder="Mot de passe *" value="<%= password%>" disabled />
                                    </div>                                        
                                    <div class="form-group">
                                        <label>Nom de famille</label>
                                        <input type="text" class="form-control" name="firstName" placeholder="Nom de Famille *" value="<%= firstName%>" disabled />
                                    </div>
                                    <div class="form-group">
                                        <label>Prénom</label>
                                        <input type="text" class="form-control" name="lastName" placeholder="Prénom *" value=" <%= lastName%>" disabled/>
                                    </div>                                    
                                    <div class="form-group">
                                        <label>Date de Naissance</label>
                                        <input type="date" class="form-control" id="exampleInputDOB1" name="birthDay" placeholder="Date de Naissance *" value="<%= birthDay%>" disabled/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" class="form-control" name="email" placeholder="Email *" value="<%= mail%>" disabled />
                                    </div>
                                    <div class="form-group">
                                        <label>Téléphone</label>
                                        <input type="tel" minlength="10" maxlength="10" pattern="[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}" class="form-control" name="numberPhone" placeholder="N° Téléphone *" value="<%= phone%>" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Type Abonnement</label>
                                        <select class="form-control" name="typeAbo" disabled>
                                            <option class="hidden"  selected disabled><%= typeAbo%></option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Profil Sportif</label>
                                        <select class="form-control" name="sportProfil" disabled >
                                            <option class="hidden"  selected disabled><%= nameSportProfil%></option>                                             
                                        </select>
                                    </div>
                                    <!--                                        <div class="form-group">
                                                                                <div class="maxl"> 
                                    <%-- if (sexe.equals("homme")) {%>
                                    <label class="radio inline" >                                                    
                                        <input type="radio" name="sexe" value="homme" checked>
                                        <span> Homme </span> 
                                    </label>
                                    <%    } else { %>
                                    <label class="radio inline"> 
                                        <input type="radio" name="sexe" value="femmme" checked>
                                        <span>Femme </span> 
                                    </label>
                                    <%     }--%>
                                </div>
                            </div>-->
                                    <div class="btn-group">
                                        <form action="formBoostrapModifierProfilClient">
                                            <button type="submit" class="btn btn-outline-secondary"/><span class="fa fa-cog" aria-hidden="true"></span> Modifier</button> 
                                        </form>
                                        <form action="CtrlformBoostrapSupprimer" >
                                            <input hidden = "true" type="hidden" name = "loginAsupp" value ="<%= theClient.getLogin()%>"></input>
                                            <input hidden = "true" type="hidden" name = "idAsupp" value ="<%= theClient.getNumUser()%>"></input>
                                            <button type="button" class="btn btn-outline-danger" data-toggle="collapse" data-target="#confirm"> <span class="fa fa-times" aria-hidden="true"></span> Supprimer</button>
                                    </div>


                                </div>
                                <div class="alert alert-warning alert-dismissible collapse" id="confirm">
                                    <button type="button" class="close" data-toggle="collapse" data-target="#confirm">&times;</button>
                                    <strong>Attention!</strong> voulez vous confirmer la suppression des messages?<br>
                                    <button type="submit" class="btn btn-outline-danger"> <span class="fa fa-times" aria-hidden="true"></span> Confirmer</button>
                                    <button type="button" class="btn btn-outline-info" onclick="window.location.href = 'Index'"><span class="fa fa-home" aria-hidden="true"></span>Annuler</button>
                                </div>
                                </form>
                                <% if (erreur != null) {%>
                                <div class="alert alert-danger" role="alert"> 
                                    <strong>Erreur ! <%= erreur%>  </strong> 
                                </div>
                                <%}%>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<style>
    .register{
        background: -webkit-linear-gradient(left, #cabc9d, #90a1a7);
        margin-top: 3%;
        padding: 3%;
    }
    .register-left{
        text-align: center;
        color: #fff;
        margin-top: 4%;
    }
    .register-left input{
        border: none;
        border-radius: 1.5rem;
        padding: 2%;
        width: 60%;
        background: #f8f9fa;
        font-weight: bold;
        color: #383d41;
        margin-top: 30%;
        margin-bottom: 3%;
        cursor: pointer;
    }
    .register-right{
        background: #f8f9fa;
        border-top-left-radius: 10% 50%;
        border-bottom-left-radius: 10% 50%;
    }
    .register-left img{
        margin-top: 15%;
        margin-bottom: 5%;
        width: 25%;
        -webkit-animation: mover 2s infinite  alternate;
        animation: mover 1s infinite  alternate;
    }
    @-webkit-keyframes mover {
        0% { transform: translateY(0); }
        100% { transform: translateY(-20px); }
    }
    @keyframes mover {
        0% { transform: translateY(0); }
        100% { transform: translateY(-20px); }
    }
    .register-left p{
        font-weight: lighter;
        padding: 12%;
        margin-top: -9%;
    }
    .register .register-form{
        padding: 10%;
        margin-top: 10%;
    }
    .btnRegister{
        float: right;
        margin-top: 10%;
        border: none;
        border-radius: 1.5rem;
        padding: 1%;
        background: #a3b8ce;
        color: #fff;
        font-weight: 600;
        width: 50%;
        cursor: pointer;
    }
    .register .nav-tabs{
        margin-top: 3%;
        border: none;
        background: #a3b8ce;
        border-radius: 1.5rem;
        width: 28%;
        float: right;
    }
    .register .nav-tabs .nav-link{
        padding: 2%;
        height: 34px;
        font-weight: 600;
        color: #fff;
        border-top-right-radius: 1.5rem;
        border-bottom-right-radius: 1.5rem;
    }
    .register .nav-tabs .nav-link:hover{
        border: none;
    }
    .register .nav-tabs .nav-link.active{
        width: 100px;
        color: #040404;
        border: 2px solid #f09c75;
        border-top-left-radius: 1.5rem;
        border-bottom-left-radius: 1.5rem;
    }
    .register-heading{
        text-align: center;
        margin-top: 8%;
        margin-bottom: -15%;
        color: #495057;
    }
</style>