<%-- 
    Document   : menuEndUser
    Created on : 5 Feb 2021, 18:12:23
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu de usuario</title>
    </head>
    <h1>Menu de usuario</h1>
    <body>
    <body>
        <a href="creaTicketEnter.jsp">Abre ticket</a></br></br>
         <form id="muestraT" action="muestraTicketsCall" method="POST"> <a href="javascript:submitMyFormT();">Muestra lista de tickets abiertos</a></form></br></br>                                  
         <a href="logout">LogOut</a></br></br>
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
