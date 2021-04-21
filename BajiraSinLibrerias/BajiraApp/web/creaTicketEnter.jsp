<%-- 
    Document   : creaTic ketEnter
    Created on : 8 Feb 2021, 18:29:13
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Abre un ticket nuevo</title>
    </head>
    <h1>Abre un ticket nuevo</h1>
</br>
<form method="post">
			<table style="with: 50%">
			        <tr>
				<td>Tipo</td>                                        					
                                    <td><select name="tipo">    
                                    <option value ="SW">Operaciones</option>
                                    <option value ="HW">Hardware</option>
                                    <option value ="OP">Software</option>/<td>
                                    </select> 
                                    <td>Descripcion</td>                                        
                                    <td><input type="text" name="descripcion" /></td>
                                     
				</tr>				                                
           </table>
           </br>
           <input type="submit" formaction= "creaTicketCall" value="Crea Ticket" /></form>                     
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
</body>
</html>
