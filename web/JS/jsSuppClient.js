/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function supprimerClient()
{
    // Élément à mettre à jour
    document.getElementById("ouiSupprimer").hidden = false;
    document.getElementById("nonSupprimer").hidden = false;
    document.getElementById("phraseSupprimer").hidden = false;

}

function anuulerSupprimerClient()
{

    // Élément à mettre à jour
    document.getElementById("ouiSupprimer").hidden = true;
    document.getElementById("nonSupprimer").hidden = true;
    document.getElementById("phraseSupprimer").hidden = true;

}

document.addEventListener("DOMContentLoaded", () => {

    document.getElementById("boutonDeleteClient").addEventListener("click", supprimerClient);
    document.getElementById("nonSupprimer").addEventListener("click", anuulerSupprimerClient);

    }
);

