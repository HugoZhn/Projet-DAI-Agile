<%-- 
    Document   : formulaireClient
    Created on : 18 févr. 2019, 13:58:54
    Author     : fhamzaoui
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="cssUpload.css" type="text/css" media="screen" />
        <title>Admin - Formulaire Client</title>
    </head>
    <body>
        <div><h1>Saisissez les details :</h1>
            <form method="post" action="CtrlInscriptionAdminClient">
                <table>
                    <input type="hidden" name="action" value="add">
                    <tr>
                        <td><label class="pad_top">Identifiant</label></td>
                        <td><input type="text" name="login" required></td>
                    </tr>
                    <tr>
                        <td><label class="pad_top">Nom de famille : </label>&nbsp;</td>
                        <td><input type="text" name="firstName" required></td>
                        <td><label class="pad_top">Profil sportif :</label></td>
                        <td>
                            <select name="sportProfil">
                                <option value="-1" selected>Choisir..</option>
                                <option value="Sportif Haut Niveau">Sportif Haut Niveau</option>
                                <option value="Sportif Moyen Niveau">Sportif Moyen Niveau</option>
                                <option value="Sportif Bas Niveau">Sportif Bas Niveau</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="pad_top">Prenom : </label>&nbsp;</td>
                        <td><input type="text" name="lastName" required></td>
                        <td><label class="pad_top">type Abonnement :</label>&nbsp;&nbsp;</td>
                        <td>
                            <select name="typeAbo">
                                <option value="-1" selected>Choisir..</option>
                                <option value="Abonnement 1">Abonnement 1</option>
                                <option value="Abonnement 2">Abonnement 2</option>
                                <option value="Abonnement 3">Abonnement 3</option>
                            </select>
                        </td>
                    </tr>
                    <tr>  
                        <td><label class="pad_top">Date de naissance : </label>&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="date" name="birthDay" required></td>
                        <td><label class="pad_top">Déposer</label>&nbsp;&nbsp;</td>
                        <td><div class="example">
                            <div id="drop_zone" name="uploadFile">Drop files here</div>
                            <output name="uploadFiles" id="list"></output>
                        <script>
  function handleFileSelect(evt) {
    evt.stopPropagation();
    evt.preventDefault();

    var files = evt.dataTransfer.files; // FileList object.

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                  '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }

  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }

  // Setup the dnd listeners.
  var dropZone = document.getElementById('drop_zone');
  dropZone.addEventListener('dragover', handleDragOver, false);
  dropZone.addEventListener('drop', handleFileSelect, false);
</script>
                            </div>
                        </td>
                        </tr>
                    <tr>
                        <td><label class="pad_top">Email : </label>&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="email" name="email" required></td>
                        <td><label class="pad_top">Numéro téléphone : </label>&nbsp;</td>
                        <td><input type="tel" name="numberPhone" placeholder="07XXXXXXXX" maxlength="14" required></td>                        
                    </tr>
                    <tr><td><label class="pad_top">Mot de passe : </label>&nbsp;</td>
                        <td><input type="password" name="passwordClient" required></td>
                        <td><label class="pad_top">Sexe : </label>&nbsp;</td>
                        <td><input type="radio" name="sexe" value="Homme"> Homme
                            <input type="radio" name="sexe" value="Femme"> Femme</td>
                    </tr>
                </table>
            
            <br>
            <label>&nbsp;</label> 
            <td><input type="submit" value="Inscription" /></form></td>
        </div>
        <br>
        <a href="home.jsp"> Revenir Accueil </a>
    </body>
</html>