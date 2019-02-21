<%-- 
    Document   : editionProgramme
    Created on : 20 févr. 2019, 22:50:28
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <style>
            #div0 {
                width: 100px;
                height: 20px;
                padding: 10px;
                border: 1px solid #aaaaaa;
                background : gainsboro;
            }
            #div1 {
                width: 100px;
                height: 70px;
                padding: 10px;
                border: 1px solid #aaaaaa;
                background : ghostwhite;
            }
        </style>
        <script>
            function allowDrop(ev) {
                ev.preventDefault();
            }
            function drag(ev) {
                ev.dataTransfer.setData("text", ev.target.id);
            }
            function drop(ev) {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
            }
        </script>
    </head>
    <body>
        
        <table>
            <tr>
                <td><div id="div0" >Semaine 1</div></td>  
                <td><div id="div0" >Semaine 2</div></td>  
                <td><div id="div0" >Semaine 3</div></td>  
                <td><div id="div0" >Semaine 4</div></td>  
                <td><div id="div0" >Semaine 5</div></td>  
                <td><div id="div0" >Semaine 6</div></td>  
                <td><div id="div0" >Semaine 7</div></td>   
                <td><div id="div0" >Semaine 8</div></td>  
                <td><div id="div0" >Semaine 9</div></td>  
                <td><div id="div0" >Semaine 10</div></td>   
                <td><div id="div0" >Semaine 11</div></td>  
                <td><div id="div0" >Semaine 12</div></td>    
            </tr>
            <tr>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>                   
            </tr>
            <tr>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>  
                <td><div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div></td>     
            </tr>   


        </table>

        <div id="drag1"  draggable="true" ondragstart="drag(event)">
            <a href="Index">
                <div>Séance n°1</div>
                <div>Informations 1</div>       
                <div>Informations 2</div>   
            </a>
        </div>
        <div id="drag2"  draggable="true" ondragstart="drag(event)">
            <a href="Index">
                <div>Séance n°2</div>
                <div>Informations 1</div>       
                <div>Informations 2</div>   
            </a>
        </div>
        <div id="drag3"  draggable="true" ondragstart="drag(event)">
            <a href="Index">
                <div>Séance n°3</div>
                <div>Informations 1</div>       
                <div>Informations 2</div>   
            </a>
        </div>
        <div id="drag4"  draggable="true" ondragstart="drag(event)">
            <a href="Index">
                <div>Séance n°4</div>
                <div>Informations 1</div>       
                <div>Informations 2</div>   
            </a>
        </div>
    </body>
</html>
