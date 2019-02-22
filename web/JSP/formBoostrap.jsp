<%-- 
    Document   : formBoostrap
    Created on : 20 févr. 2019, 02:14:15
    Author     : fhamzaoui
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="pojo.ProfilClient"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="hibernateutils.HibernateUtilProjetDAI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulaire Inscription</title>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    <h3>Plateforme Admin</h3>
                    <p>Inscription Rapide</p>
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
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#coach" role="tab" aria-controls="profile" aria-selected="false">Coach</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="client" role="tabpanel" aria-labelledby="home-tab">
                            <form action="CtrlInscriptionAdminClient">
                                <h3 class="register-heading">Formulaire Client</h3>                                

                                <div class="row register-form">
                                    <center>
                                        <%String message = (String) request.getAttribute("msg_erreur");
                                            if (message != null) {
                                                out.println("<div class=\"alert alert-danger\" role=\"alert\">" + message + "</div>");
                                            }%>  
                                    </center>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="login" class="form-control" placeholder="Identifiant *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" name="passwordClient" id="passwordClient" placeholder="Mot de passe *" value="" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" name="passwordClient_Conf" id="passwordClient_Conf" placeholder="Confirmer mot de passe *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="firstName" placeholder="Nom de Famille *" value="" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="lastName" placeholder="Prénom *" value="" required/>
                                        </div>                                    
                                        <div class="form-group">
                                            <input type="date" class="form-control" id="exampleInputDOB1" name="birthDay" placeholder="Date de Naissance *" required/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Email *" value="" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="tel" minlength="10" maxlength="10" pattern="[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}" class="form-control" name="numberPhone" placeholder="N° Téléphone *" value="" required/>
                                            <span class="validity"></span>
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="typeAbo" required>
                                                <option class="hidden"  selected disabled>Selectionner Type Abonnement...</option>
                                                <option>Abonnement 1</option>
                                                <option>Abonnement 2</option>
                                                <option>Abonnement 3</option>
                                            </select>
                                        </div>
                                        <% Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                                            Transaction t = ses.beginTransaction();
                                            Query q = ses.createQuery("from ProfilClient");
                                            List<ProfilClient> listeProfilClient = (List<ProfilClient>) q.list();
                                            t.commit();
                                        %>
                                        <div class="form-group">
                                            <select class="form-control" name="sportProfil" required >
                                                <option class="hidden"  selected disabled>Quel est votre profil sportif ?</option>
                                                <%for (ProfilClient pc : listeProfilClient) {
                                                        out.println("<option value =" + pc.getCodeProfil() + ">" + pc.getNomProfil() + "</option>");
                                                    }%>                                                
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="sexe" value="homme" checked>
                                                    <span> Homme </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="sexe" value="femmme">
                                                    <span>Femme </span> 
                                                </label>
                                            </div>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                </div>
                        </div>
                        </form>
                        <div class="tab-pane fade show" id="coach" role="tabpanel" aria-labelledby="profile-tab">
                            <form action="CtrlInscriptionAdminClient">
                                <h3  class="register-heading">Formulaire Coach</h3>

                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="login" placeholder="Identifiant *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="firstName" placeholder="Nom de famille *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="lastName" placeholder="Prénom *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Email *" value="" />
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" class="form-control" name="numberPhone" placeholder="N° Téléphone *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Mot de passe *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="sportProfil">
                                                <option class="hidden"  selected disabled>Quel est votre profil sportif ?</option>
                                                <option>Sportif Haut niveau</option>
                                                <option>Sportif Moyen niveau</option>
                                                <option>Sportif Bas niveau</option>
                                            </select>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>



<style>
    .register{
        background: -webkit-linear-gradient(left, #3931af, #00c6ff);
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
        background: #0062cc;
        color: #fff;
        font-weight: 600;
        width: 50%;
        cursor: pointer;
    }
    .register .nav-tabs{
        margin-top: 3%;
        border: none;
        background: #0062cc;
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
        color: #0062cc;
        border: 2px solid #0062cc;
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