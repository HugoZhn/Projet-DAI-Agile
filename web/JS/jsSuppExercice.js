/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function supprimerExercice()
{
    // Élément à mettre à jour
    document.getElementById("ouiSupprimer").hidden = false;
    document.getElementById("nonSupprimer").hidden = false;
    document.getElementById("phraseSupprimer").hidden = false;

}

function anuulerSupprimerExercice()
{

    // Élément à mettre à jour
    document.getElementById("ouiSupprimer").hidden = true;
    document.getElementById("nonSupprimer").hidden = true;
    document.getElementById("phraseSupprimer").hidden = true;

}

document.addEventListener("DOMContentLoaded", () => {

    document.getElementById("boutonDeleteExercice").addEventListener("click", supprimerExercice);
    document.getElementById("nonSupprimer").addEventListener("click", anuulerSupprimerExercice);

    }
);

