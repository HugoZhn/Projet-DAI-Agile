/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function redirectToServlet(){
    window.location.replace("CtrlformBoostrapDetailsProfil?action="+this.id);
}

document.addEventListener("DOMContentLoaded", () => {
    var eltsALier = document.getElementsByClassName("linked");
    for(var i=0; i<eltsALier.length; i++){
        console.log(eltsALier[i]);
        eltsALier[i].addEventListener("click", redirectToServlet)
    }
});