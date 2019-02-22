/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var noSemaines;

function ajouterSeance()
    {
    var semaineAAjouter = this.value;
    var elt = document.getElementById("Semaine" + semaineAAjouter);
    var innerElt = elt.querySelector("#listeSeances");

    var txtHtml = "<tr>" + innerElt.innerHTML + "</tr>";

    innerElt.insertAdjacentHTML('afterend', txtHtml);

    }
    
function ajouterSemaine()
    {
    var elt = document.getElementById("Semaine0");
    var after = document.getElementById("Semaine" + noSemaine);
    noSemaine += 1;

    var id = "Semaine" + noSemaine;
    var html = "<div id=\"" + id + "\">" + elt.innerHTML + "</div>";
    after.insertAdjacentHTML('afterend', html);
    
    document.getElementById(id).querySelector("#nomSemaine").firstChild.nodeValue = "Semaine " + noSemaine;
    elt.querySelector("#boutonAjouterSemaine").disabled = true;
    document.getElementById(id).querySelector("#boutonAjouterSeance").value = noSemaine;
    document.getElementById(id).querySelector("#boutonAjouterSeance").addEventListener("click", ajouterSeance);
    document.getElementById(id).querySelector("#boutonAjouterSemaine").addEventListener("click", ajouterSemaine);
    
    }

document.addEventListener("DOMContentLoaded", () => {
    noSemaine = 0;
    ajouterSemaine();
    document.getElementById("Semaine1").hidden = false;
    }
);

