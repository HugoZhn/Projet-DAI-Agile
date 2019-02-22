<%-- 
    Document   : accueilCoach
    Created on : 22 févr. 2019, 01:03:01
    Author     : fhamzaoui
--%>

<%@page import="pojo.CoachAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>Accueil Coach</title>
        <meta name="keywords" content="sidebar, off-canvas, menu, navigation, effect, inspiration, css transition, SVG, morphing, animation" />
        <meta name="author" content="NARVALOS" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="CSS/normalize.css" />
        <link rel="stylesheet" type="text/css" href="CSS/demo.css" />
        <link rel="stylesheet" type="text/css" href="CSS/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="CSS/menu_topside.css" />

        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->

        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <style>
        html,body,header{
            background-image: url('http://getwallpapers.com/wallpaper/full/f/2/f/514789.jpg');
            background-color: grey;
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;
            font-family: 'Numans', sans-serif;
        }
        html {
            overflow: scroll;
            overflow-x: hidden;
        }
        ::-webkit-scrollbar {
            width: 0px;  /* remove scrollbar space */
            background: transparent;  /* optional: just make scrollbar invisible */
        }
        /* optional: show position indicator in red */
        ::-webkit-scrollbar-thumb {
            background: #FF0000;
        }
        .vertical-menu {
            width: 200px;
        }

        .vertical-menu a {
            background-color: #eee;
            color: black;
            display: block;
            padding: 12px;
            text-decoration: none;
        }

        .vertical-menu a:hover {
            background-color: #ccc;
        }

        .vertical-menu a.active {
            background-color: #4CAF50;
            color: white;
        }
    </style>
    <body>
        <div class="container container h-100 d-flex justify-content-center">
            <div class="menu-wrap">
                <nav class="menu-top">
                    <div class="profile"><img src="IMG/user1.png" alt="Personas Narvalos"/><span>Personas Narvalos</span></div>
                    <div class="icon-list">
                        <a href="#"><i class="fa fa-fw fa-star-o"></i></a>
                        <a href="#"><i class="fa fa-fw fa-bell-o"></i></a>
                        <a href="#"><i class="fa fa-fw fa-envelope-o"></i></a>
                        <a href="#"><i class="fa fa-fw fa-comment-o"></i></a>
                    </div>
                </nav>
                <nav class="menu-side">
                    <a href="formBoostrap" class="icon-star">Inscrire Client ou Coach</a>
                    <a href="CtrlListeClients" class="icon-news">Gestion Clients</a>
                    <a href="CtrlAfficherListProgramme">Programmes</a>
                    <a href="listSeance">Séances</a>
                    <a href="CtrlListExercice">Exercices</a>
                    <a href="#">Analyse bilans et évolutions</a>
                    <a href="CtrlLogOut">Deconnecter</a>
                </nav>
            </div>
            <button class="menu-button" id="open-button"></button>
            <div class="content-wrap">
                <div class="content container h-100 d-flex justify-content-center">
                    <header class="codrops-header">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <h1 class="disply-1">BIEVENUE COACH ! 
                            <br>
                            <br><span>LA FORME OLYMPIQUE OU SYNDICALE ?</span></h1>
<!--                        <nav class="codrops-demos">
                            <a class="current-demo" href="index.html">Top Side</a>


                        </nav>                                               -->
                    </header>
                    <%
                        //Recupération du informations du client

                        CoachAdmin theClient = (CoachAdmin) session.getAttribute("coachadminSession");
                        System.out.println("Login Coach : " + theClient.getLogin());

                    %>
                    <h1>Vertical Menu</h1>

                </div>
            </div><!-- /content-wrap -->
        </div><!-- /container -->
        <script src="JS/classie.js"></script>
        <script src="JS/main.js"></script>
    </body>
</html>