<%-- 
    Document   : vueClient
    Created on : 22 févr. 2019, 01:03:01
    Author     : fhamzaoui
--%>

<%@page import="pojo.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Accueil Client</title>
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
					<a href="#">Mon Profil</a>
					<a href="#">Mon Programme</a>
					<a href="#">Ma Seance</a>
					<a href="#">Mes Exercices</a>
					<a href="#">Bilans et évolutions</a>
					<a href="#">Blog</a>
					<a href="#">Retour</a>
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
						<h1 class="disply-1">COACHING UN JOUR COACHING POUR TOUJOURS 
                                                     <br>
                                                <br><span>LE SPORT EN TOUTE SA SPLENDEUR</span></h1>
						<nav class="codrops-demos">
							<a class="current-demo" href="index.html">Top Side</a>
						</nav>                                               
					</header>
                                    <% 
                                    //Recupération du informations du client
                                    Client theClient = (Client) session.getAttribute("clientSession");
                                    System.out.println("Login Client : "+theClient.getLogin());
                                    
                                    %>
					
				</div>
			</div><!-- /content-wrap -->
		</div><!-- /container -->
		<script src="JS/classie.js"></script>
		<script src="JS/main.js"></script>
	</body>
</html>