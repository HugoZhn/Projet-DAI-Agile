<%-- 
    Document   : editionExercice
    Created on : 18 févr. 2019, 14:09:43
    Author     : 21607860
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Création Exercice</title>
    </head>
    <body>
        
        <a href = "Index">Retour Index</a>

        <h1>Création exercice</h1>

        <%
            // Récupère le message d'avertissement ou d'erreur

            String Confirmation = request.getParameter("msg_avrt");

            if (Confirmation != null) {
                
                out.println("<p>" + Confirmation + "</p>");
                    
                }
                            
            System.out.println("Confirmation : " + Confirmation);

        %>

        <form action ="ctrl_CreationExercice" method = "GET">
            <table>
                <tr>
                    <td>Intitulé :</td>
                    <td><input type="text" name = "nomEx"></td>
                </tr>
                <tr>
                    <td>Type :</td>
    
                    <td><select name="typeEx" size="1">
                            <option selected>Standard</option>
                            <option>Échauffement</option>
                            <option>Étirement</option>
                        </select>
                    </td>
                </tr>
                <tr>                        
                    <td>Objectif :</td>
                    <td><input type="text" name = "objectifsEx"></td>
                </tr>
                <tr>                        
                    <td>Description :</td>
                    <td><input type="files" name = "descriptionEx"></td>
                </tr>                    <tr>                        
                    <td>Illustration :</td>
                    <td><input type="files" name = "ressourceEx"></td>
                </tr>
                <tr>                        
                    <td><input type="radio" value= "1" name="choiceParam"/>Durée : <input type="text" name="tempsBaseEx"/></td>
                </tr>
                <tr>  
                    <td><input type="radio" value= "2"  name="choiceParam"/>Répétitions : <input type="text" name="repsBaseEx"/></td>
                </tr>

            </table>
            <input type ="submit" name="creerExercice" value = "Confirmer">
        </form>
    </body>
</html>
