<%-- 
    Document   : menuNivel2
    Created on : 5 Feb 2021, 18:12:59
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu soporte nivel 2</title>
    </head>
    <h1>Menu soporte nivel 2</h1>
    <body>        
        <form id="muestraT" action="muestraTicketsCall" method="POST"> <a href="javascript:submitMyFormT();">Muestra lista de tickets abiertos</a></form></br>         
       <form id="muestraTE" action="muestraEscalatedTicketsCall" method="POST"> <a href="javascript:submitMyFormTE();">Muestra lista de tickets escalados</a></form></br></br>                           
         <a href="muestraTicketCall">Muestra lista de mis tickets</a></br></br>         
         <a href="logout">LogOut</a></br></br>
    </body>
    
    <script>  function submitMyFormT(){
 document.forms["muestraT"].submit();
}
 function submitMyFormTE(){
 document.forms["muestraTE"].submit();
}
</script>
</html>
