<%-- 
    Document   : vueAdminCoach
    Created on : 22 févr. 2019, 01:03:49
    Author     : fhamzaoui
--%>

<%@page import="pojo.CoachAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Recupération du informations du client
    CoachAdmin theClient = (CoachAdmin) session.getAttribute("coachadminSession");
    System.out.println("Login admin : " + theClient.getLogin());

%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>Plateforme Administrateur</title>
        <meta name="description" content="Perspective Page View Navigation: Transforms the page in 3D to reveal a menu" />
        <meta name="keywords" content="3d page, menu, navigation, mobile, perspective, css transform, web development, web design" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/cssAdmin/normalize.css" />
        <link rel="stylesheet" type="text/css" href="CSS/cssAdmin/demo.css" />
        <link rel="stylesheet" type="text/css" href="CSS/cssAdmin/component.css" />
        <link rel="stylesheet" type="text/css" href="CSS/cssLettre/base.css" />
        <!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
        <script src="JS/jsAdmin/modernizr.custom.25376.js"></script>
    </head>
    <body>
        <svg class="hidden">
    <symbol id="icon-arrow" viewBox="0 0 24 24">
        <title>arrow</title>
        <polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 "/>
    </symbol>
    <symbol id="icon-drop" viewBox="0 0 24 24">
        <title>drop</title>
        <path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z"/><path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z"/>
    </symbol>
    <symbol id="icon-github" viewBox="0 0 32.6 31.8">
        <title>github</title>
        <path d="M16.3,0C7.3,0,0,7.3,0,16.3c0,7.2,4.7,13.3,11.1,15.5c0.8,0.1,1.1-0.4,1.1-0.8c0-0.4,0-1.4,0-2.8c-4.5,1-5.5-2.2-5.5-2.2c-0.7-1.9-1.8-2.4-1.8-2.4c-1.5-1,0.1-1,0.1-1c1.6,0.1,2.5,1.7,2.5,1.7c1.5,2.5,3.8,1.8,4.7,1.4c0.1-1.1,0.6-1.8,1-2.2c-3.6-0.4-7.4-1.8-7.4-8.1c0-1.8,0.6-3.2,1.7-4.4C7.4,10.7,6.8,9,7.7,6.8c0,0,1.4-0.4,4.5,1.7c1.3-0.4,2.7-0.5,4.1-0.5c1.4,0,2.8,0.2,4.1,0.5c3.1-2.1,4.5-1.7,4.5-1.7c0.9,2.2,0.3,3.9,0.2,4.3c1,1.1,1.7,2.6,1.7,4.4c0,6.3-3.8,7.6-7.4,8c0.6,0.5,1.1,1.5,1.1,3c0,2.2,0,3.9,0,4.5c0,0.4,0.3,0.9,1.1,0.8c6.5-2.2,11.1-8.3,11.1-15.5C32.6,7.3,25.3,0,16.3,0z"/>
    </symbol>
    <symbol id="icon-nav-arrow" viewBox="0 0 90 64">
        <!--<title>nav-arrow</title>-->
        <path d="M88.148 30.124H6.404L33.208 3.32a1.877 1.877 0 0 0 0-2.652 1.877 1.877 0 0 0-2.652 0L.552 30.67a1.942 1.942 0 0 0-.409.612 1.86 1.86 0 0 0 0 1.432c.094.233.233.44.41.612L30.555 63.33c.367.368.847.552 1.328.552.48 0 .96-.184 1.327-.548a1.877 1.877 0 0 0 0-2.652L6.404 33.874h81.743a1.876 1.876 0 0 0 0-3.75z"/>
    </symbol>
    </svg>

    <div id="perspective" class="perspective effect-airbnb">
        <div class="container">
            <div class="wrapper"><!-- wrapper needed for scroll -->
                <!-- Top Navigation -->                    
                <header class="codrops-header">
                    <h1><span>Plateforme Administrateur Application </span></h1>	
                </header>
                <div class="main clearfix">
                    <main>
                        <div class="slide">
                            <div class="slide__bg slide__bg--3"></div>
                            <h2 class="word word--3">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Menu Administrateur</h2>
                            <div class="column">
                        <p><button id="showMenu">Menu Administrateur</button></p>
                    </div>
                        </div>
                        <div class="slide">
                            <div class="slide__bg slide__bg--3"></div>
                            <h2 class="word word--3">Menu Coach</h2>
                        </div>

                    </main>

                    
                    <form action="CtrlLogOut" method="POST">
                        <input type="submit" value="Logout">
                    </form> 
                </div><!-- /main -->
            </div><!-- wrapper -->
        </div><!-- /container -->
        <nav class="outer-nav left vertical">
            <a href="#" class="icon-home">Accueil</a>
            <a href="formBoostrap" class="icon-star">Inscrire Client ou Coach</a>
            <a href="CtrlListeClients" class="icon-news">Gestion Clients</a>
            <a href="#" class="icon-news">Gestion Clients</a>
            <a href="#" class="icon-pencil">Administrer mes Adresses Mail</a>
            <a href="#" class="icon-mail">Mes Messages</a>
            <a href="#" class="icon-lock">Retour</a>
        </nav>
    </div><!-- /perspective -->
    <script src="JS/jsAdmin/classie.js"></script>
    <script src="JS/jsAdmin/menu.js"></script>
</body>
</html>                                   