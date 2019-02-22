

<%@page import="pojo.TypeExercice"%>
<%-- 
    Document   : formBoostrap
    Created on : 20 févr. 2019, 02:14:15
    Author     : fhamzaoui
--%>

<%@page import="org.hibernate.Query"%>
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
                    <!--                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>-->
                    <h3>Plateforme Coach</h3>
                    <p>Création Exercice</p>
                    <form action="accueilCoach">
                        <input type="submit" name="" value="Accueil"/>                        
                    </form>
                    <form action="listExercice">
                        <input type="submit" name="" value="Retour"/>                        
                    </form>
                    <br/>
                </div>
                <div class="col-md-9 register-right">
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">                        
                        <li class="nav-item">
                            <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#coach" role="tab" aria-controls="profile" aria-selected="false">Coach</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="client" role="tabpanel" aria-labelledby="home-tab">
                            <form action="CtrlCreationExercice" method="GET">
                                <h3 class="register-heading">Formulaire création exercice :</h3>                                

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
                                            <input type="text" name = "nomEx" id="nomUpdateExercice" class="form-control" placeholder="Nom Exercice *" value="" required/>
                                            <td><p id = "verifExiste" ></p></td>
                                        </div>
                                        <%  try {
                                                Session ses = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                                                Transaction t = ses.beginTransaction();
                                                Query q = ses.createQuery("from TypeExercice");
                                                List<TypeExercice> listeTypeExercice = (List<TypeExercice>) q.list();
                                                t.commit();
                                        %>
                                        <div class="form-group">
                                            <select class="form-control"  name="typeEx" size="1" required >
                                                <option class="hidden"  selected disabled>Quel type d'exercices ?</option>
                                                <% for (TypeExercice TE : listeTypeExercice) {
                                                            out.println("<option value='" + TE.getCodeTypeEx() + "'>" + TE.getLibTypeEx() + "</option>");
                                                        }
                                                        out.println("</select></td>");

                                                    } catch (Exception ex) {
                                                        out.println("<td>Erreur de chargement des types d'exercice. " + ex.getMessage() + "</td>");
                                                    }

                                                %> 
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="objectifsEx" placeholder="Objectifs Exercice *" value="" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="precisionEx" placeholder="Précision Exercice *" value="" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="descriptionEx" placeholder="Description Exercice *" value="" required/>
                                        </div>                                    
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="ressourceEx" placeholder="Illusatration *" required/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="int" class="form-control" name="tempsBaseEx" placeholder="Durée Exercice *" value="" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="int" class="form-control" name="repsBaseEx" placeholder="Répétitions *" value="" required/>
                                            <span class="validity"></span>
                                        </div>                                      
                                        <input type="submit" id="exerciceUpdate" class="btnRegister" name="exerciceUpdate"  value="Creer"/>
                                    </div>
                                </div>                         
                            </form>  
                        </div>
                    </div>
                </div>

            </div>
            <script type="text/JavaScript" charset="utf-8" src="jsCreaExercice"></script>
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