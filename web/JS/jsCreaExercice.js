/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function verifNomExercice()
{
    // Objet XMLHttpRequest.
    var xhr = new XMLHttpRequest();

    // Récupération du mot saisi
    nomExercice = document.getElementById("nomUpdateExercice").value;
        
    // Élément à mettre à jour
    var elt = document.getElementById("verifExiste");

    // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
    xhr.onload = function ()
    {
        // Si la requête http s'est bien passée.
        if (xhr.status === 200)
        {
            var reponse = xhr.responseXML;

            var verification = reponse.getElementsByTagName("verificationExiste")[0];

            verification = verification.firstChild.nodeValue;

            if (verification === "Vrai") {
                elt.innerHTML = "Nom Existant !";
                document.getElementById("exerciceUpdate").disabled = true;
            } else
            {
                elt.innerHTML = "";
                document.getElementById("exerciceUpdate").disabled = false;
            }

        }

    };

    if (nomExercice !== "") {

        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "CtrlVerifNomExercice" + "?nomExercice=" + nomExercice, true); // envoyer paramètre nomauteur
        // Envoie de la requête.
        xhr.send();
    } else {
        elt.innerHTML = "";
    }
}

document.addEventListener("DOMContentLoaded", () => {

    document.getElementById("nomUpdateExercice").addEventListener("keyup", verifNomExercice);

    }
);

