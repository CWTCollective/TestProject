<%-- 
    Document   : creaUsuarioEnter
    Created on : 8 Feb 2021, 15:50:02
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crea un usuario</title>
    </head>
    <h1>Crea un usuario</h1>
</br>
<form method="post">
			<table style="with: 50%">
			        <tr>
					<td>Nombre de usuario</td>                                        
					<td><input type="text" name="endUser" /></td>
				</tr>	
                                   <%   String thisUserLevel = (String)session.getAttribute("userLevel");
              if (thisUserLevel.equals("1")) { %> 
                                   <tr>                           
					<td>Nivel</td>                                        
					<td><select name="nivel">    
                                    <option value ="2">Nivel 1</option>
                                    <option value ="3">Niel 2</option>
                                    <option value ="4">Usuario</option>/<td>
                                    </select> 
				</tr>	
              <% }else{%>             
              		<tr><input type="hidden" name="nivel" value="4" /></tr>
              <% }%> 
           </table>
           </br>
           <input type="submit" formaction= "creaUsuarioCall" value="Crea Usuario" /></form>                     
       </br>
  
        <%-- Return to the menu for the current user level --%> 
          <% if (thisUserLevel.equals("1")) { %> 
              <a href = "menuAdmin.jsp">Volver al menu principal</a>  
              <% } else if (thisUserLevel.equals("2")){ %>
             <a href = "menuNivel1.jsp">Volver al menu principal</a>  
             <% } else if (thisUserLevel.equals("3")){ %>
                  <a href = "menuNivel2.jsp">Volver al menu principal</a>  
             <% } else if (thisUserLevel.equals("4")){ %>
          <a href = "menuEndUser.jsp">Volver al menu principal</a>         
        <% }%> 
</body>
</html>