/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var exosToDo;
var currentExo;
var nombreSeries;
var totalSeconds; //Nombre total de secondes sur le minuteur
var interval;

function StartTimer()
{
    interval = setInterval(Timer_Tick, 1000);

    var seconds = totalSeconds % 60;
    var secondsTens = Math.floor(seconds / 10);
    var secondsOnes = seconds % 10;
    var minutes = Math.floor(totalSeconds / 60);

    document.getElementById("Timer").innerHTML = "" + minutes + ":" + secondsTens + secondsOnes; //montre minuterie  
}


function Timer_Tick()
{
    if (totalSeconds > 0) // S'il reste du temps ...
    {
        totalSeconds--; // Décrémenter le nombre total de secondes

        var seconds = totalSeconds % 60; //Recalculer les valeurs de minuterie et afficher ensuite
        var secondsTens = Math.floor(seconds / 10);
        var secondsOnes = seconds % 10;
        var minutes = Math.floor(totalSeconds / 60);

        document.getElementById("Timer").innerHTML = "" + minutes + ":" + secondsTens + secondsOnes;
    } else
    {
        clearInterval(interval);
        if(nombreSeries > 0){
        document.getElementById("btnDiv").firstChild.removeAttribute("disabled");
        document.getElementById("Timer").innerHTML = " Recuperation, cliquez pour demarrer la serie suivante ";
        nombreSeries -= 1;
        }else{
            document.getElementById("btnDiv").innerHTML = "<button id=\"btnPasserExo\">Terminer mon exercice</button>";
            document.getElementById("btnPasserExo").addEventListener("click", terminerExercice);
        }
    }
}


function afficherPremierExo() {
    seanceAChercher = document.getElementById("btnCommencerSeance").value;
    // Objet XMLHttpRequest.
    var xhr = new XMLHttpRequest();

    // Requête au serveur avec les paramètres éventuels.
    xhr.open("GET", "ServletEffectuerSeance?noSeanceEffectuee=" + seanceAChercher);

    // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
    xhr.onload = function ()
    {
        // Si la requête http s'est bien passée.
        if (xhr.status === 200)
        {
            exosToDo = JSON.parse(xhr.responseText);
            console.log(exosToDo);
            lancerExoSuivant();
        }
    };

    // Envoie de la requête.
    xhr.send();
}

function lancerExoSuivant() {
    if (exosToDo.length > 0) {

        currentExo = exosToDo[0];

        var html = "<p>";
        html += currentExo.nomExo + "<br/>";

        if (currentExo.descriptionExo !== "null") {
            html += currentExo.descriptionExo + "<br/>";
        }
        if (currentExo.infoSupExo !== "null") {
            html += currentExo.infoSupExo + "<br/>";
        }
        if (currentExo.objExo !== "null") {
            html += currentExo.objExo + "<br/>";
        }
        if (currentExo.adresseImage !== "null") {
            html += currentExo.adresseImage + "<br/>";
        }
        if (currentExo.nbSeries !== "0") {
            html += currentExo.nbSeries + " x ";
        }
        if (currentExo.repsExo !== "0") {
            html += currentExo.repsExo + " repetitions";
        }
        if (currentExo.tmpsEx !== "0") {
            html += currentExo.tmpsEx + " secondes";
        }

        html += "</p>"

        document.getElementById("AffichageExo").innerHTML = html;
        
        if(parseInt(currentExo.tmpsEx) !== 0){
            nombreSeries = parseInt(currentExo.nbSeries);
            document.getElementById("btnDiv").innerHTML = "<button id=\"btnCommencerExoTimer\">Commencer l'exercice</button>";
            document.getElementById("btnCommencerExoTimer").addEventListener("click", faireExerciceTimer);
        }
        if(parseInt(currentExo.repsExo) !== 0){
            document.getElementById("btnDiv").innerHTML = "<button id=\"btnPasserExo\">Terminer mon exercice</button>";
            document.getElementById("btnPasserExo").addEventListener("click", terminerExercice);
        }
    }
    else{
        document.getElementById("btnDiv").hidden = true;
        document.getElementById("Timer").hidden = true;
        document.getElementById("back").hidden = false;
    }
}

function faireExerciceTimer() {
    totalSeconds = parseInt(currentExo.tmpsEx);
    StartTimer();
    document.getElementById("btnDiv").firstChild.disabled = true;

}

function terminerExercice() {
    exosToDo.shift();
    lancerExoSuivant();
}

document.addEventListener("DOMContentLoaded", () => {
    afficherPremierExo();
});