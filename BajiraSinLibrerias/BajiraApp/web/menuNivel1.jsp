<%-- 
    Document   : meniNivel1
    Created on : 5 Feb 2021, 18:12:39
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu soporte nivel 1</title>
    </head>
    <h1>Menu soporte nivel 1</h1>
    <body>
       <body>
           <a href="creaUsuarioEnter.jsp">Crea usuario</a></br></br>
         <a href="creaTicketEnter.jsp">Abre ticket</a></br></br>
         <form id="muestraT" action="muestraTicketsCall" method="POST"> <a href="javascript:submitMyFormT();">Muestra lista de tickets abiertos</a></form></br>         
          <form id="muestraTE" action="muestraEscalatedTicketsCall" method="POST"> <a href="javascript:submitMyFormTE();">Muestra lista de tickets escalados</a></form></br></br>                           
        <a href="muestraTiempo.jsp">Que tal dia hace</a></br></br>
          <a href="logout">LogOut</a></br></br>
    </body>
    </body>
    <script>
    function submitMyFormT(){
 document.forms["muestraT"].submit();
}
 function submitMyFormTE(){
 document.forms["muestraTE"].submit();
}
</script>


</html>
