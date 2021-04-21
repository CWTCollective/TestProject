<%-- 
    Document   : registroActualizado
    Created on : 22 Jan 2021, 09:40:30
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respuesta</title>
    </head>
</br>
<form method="post">
			<table style="with: 50%">
			        <table style="with: 50%">
			      <table border ="1" width="500" align="center"> 
                        
                                
        <p> El registro se ha actualizado con exito</p>
        </br>
        
</body>
   <%-- Return to the menu for the current user level --%> 
          <%   String thisUserLevel = (String)session.getAttribute("userLevel");
              if (thisUserLevel.equals("1")) { %> 
              <a href = "menuAdmin.jsp">Volver al menu principal</a>  
              <% } else if (thisUserLevel.equals("2")){ %>
             <a href = "menuNivel1.jsp">Volver al menu principal</a>  
             <% } else if (thisUserLevel.equals("3")){ %>
                  <a href = "menuNivel2.jsp">Volver al menu principal</a>  
             <% } else if (thisUserLevel.equals("4")){ %>
          <a href = "menuEndUser.jsp">Volver al menu principal</a>         
        <% } %>        			
</html>
