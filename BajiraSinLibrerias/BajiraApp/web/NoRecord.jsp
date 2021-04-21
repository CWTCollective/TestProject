<%-- 
    Document   : NoRecord
    Created on : 20 Jun 2020, 14:13:47
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respuesta</title>
    </head>
   <form  method="post">
		<table style="with: 50%">
			      <table border ="1" width="500" align="center"> 
                        
                                
        <p> El registro no se ha encontrado en la base de datos</p>
        </br>
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
