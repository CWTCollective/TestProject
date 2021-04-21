<%-- 
    Document   : actualizaTicketEnter
    Created on : 9 Feb 2021, 14:53:23
    Author     : Maria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="serv.Ticket"%>

<!DOCTYPE html>
<html>
<head>    
<title>Muestra detalles de un ticket</title>
</head>
<body>
<h1>Detalles de un ticket</h1>
<body>
          
          <form  method="post">
      
			<table style="with: 50%">
			      <table border ="1" width="500" align="center"> 
         <tr bgcolor="00FF7F"> 
          <th><b>ID</b></th> 
          <th><b>Tipo</b></th>
          <th><b>Descripcion</b></th> 
          
          <% Ticket std = (Ticket)request.getAttribute("data"); %> 
               
        <%-- Arranging data in tabular form 
        --%> 
            <tr> 
                <td><%=std.getID()%></td> 
                <td><%=std.getTipo()%></td> 
                <td><%=std.getDescripcion()%></td> 
         </table>
         </br></br>
         <table style="with: 50%">
            <tr>
		 <td>ID</td> 
		<td><input type="text" name="ID" value='<%=std.getID()%>' readonly /></td>
            </tr>
            <tr>
		 <td>Tipo</td> 
		<td><input type="text" name="tipo" value='<%=std.getTipo()%>' /></td>
            </tr>
                <tr>
                <td>Estado</td> 
              <td> <select name="estado">             
                    <option value="Abierto"
                            <% if (std.getEstadoString().equals("Abierto")){%>
                            selected <%} %> >Abierto</option>                                  
                    
                    <option value="EnProceso"
                            <% if (std.getEstadoString().equals("EnProceso")){%>
                            selected <%} %> >EnProceso</option>                                  
                    <option value="Escalado"
                            <% if (std.getEstadoString().equals("Escalado")){%>
                            selected <%} %> >Escalado</option>                                  
                    <option value="Cerrado"
                            <% if (std.getEstadoString().equals("Cerrado")){%>
                            selected <%} %> >Cerrado</option>                                  
                    
                   </select>
                </td>   
            </tr>
            <tr>
		 <td>Descripcion</td> 
                 <td> <textarea rows="5" cols="80" name="descripcion"><%=std.getDescripcion()%> </textarea>></td>
            </tr>
        
            <tr>
		 <td>Notas</td> 
                 <td> <textarea rows="5" cols="80" name="notas" ><%=std.getNotas()%></textarea>></td>		
            </tr>
            
             <tr>
		<td>Fecha Apertura</td>
		<td><input type="date" name="fechaApertura" value='<%=std.getFechaAperturaString()%>' readonly /></td>                
           </tr>
            <tr>
		<td>Fecha Resolucion</td>
		<td><input type="date" name="fechaResolucion" value='<%=std.getFechaResolucionString()%>' readonly /></td>                
           </tr>
            <tr>
		 <td>Usuario</td> 
		<td><input type="text" name="usuarioEnd" value='<%=std.getUsuarioEnd()%>' readonly /></td>
            </tr>
           <tr>
		 <td>Nivel2 </td> 
                 
                 <%  List<String> usersList = new ArrayList<String>(); 
                     usersList = (List<String>)session.getAttribute("userList");                     
                     int counter =1;
                 %>            
               
                 <td> <select name="usuarioNivel2">
                 <% for(String user: usersList){  %>     
                    <option value="<%=user%>"
                            <% if(user.equals(std.getUsuarioNivel2())){%>
                            selected                            
                            <%} %>            
                            ><%=user%></option>                                  
                 <% counter+=1;}  %>    
                    <option value=""
                            <% if(std.getUsuarioNivel2().equals("")){%>
                            selected                            
                            <%} %> ></option>  
                    
                   </select>
             
               
                </td>
            </tr>
           <tr>
		 <td>Resolucion</td> 
		<td><input type="text" name="resolucion" value='<%=std.getResolucion()%>' /></td>
            </tr>
           
              
           </table>

           </br>
           <input type="submit" formaction= "actualizaTicketCall" value="Actualiza el Ticket" /></form>                     
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
