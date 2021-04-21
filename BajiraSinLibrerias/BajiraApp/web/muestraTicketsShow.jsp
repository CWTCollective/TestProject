<%-- 
    Document   : muestraTicketsShow
    Created on : 8 Feb 2021, 20:01:39
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="serv.Ticket"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
   <title>Lista de tickets</title> 
  </head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
   <title>Lista de Tickets</title> 
  </head> 
  <body> 
      <h1>Lista de tickets</h1> 
      
      
      <table border ="1" width="500" align="center"> 
         <tr bgcolor="00FF7F"> 
          <th><b>ID</b></th> 
          <th><b>Tipo</b></th> 
          <th><b>Descripcion</b></th> 
          <th><b>Estado</b></th> 
          <th><b>Dia de apertura</b></th>        
          <th><b>Dia de resolucion</b></th>        
          <th><b>Usuario</b></th> 
          <th><b>Soporte 2</b></th>           
         </tr> 
        <%-- Fetching the attributes of the request object 
             which was previously set by the servlet  
              "StudentServlet.java" 
        --%>  
        <%  
            List<Ticket> lListaDeTickets =  (ArrayList<Ticket>)request.getAttribute("data");
            Ticket lTicket =null;
            int size =lListaDeTickets.size();
          for (int lCounter = 0; lCounter < size ; lCounter++)
          {
            lTicket = lListaDeTickets.get(lCounter);
          
          %> 
               
        <%-- Arranging data in tabular form 
        --%> 
            <tr> 
                <td><%=(int)lTicket.getID()%></td> 
                <td><%=lTicket.getTipo()%></td> 
                <td><%=lTicket.getDescripcion()%></td> 
                 <td><%=lTicket.getEstadoString()%></td>                 
                 <td><%=lTicket.getFechaAperturaString()%></td> 
                <td><%=lTicket.getFechaResolucionString()%></td>                 
                <td><%=lTicket.getUsuarioEnd()%></td> 
                <td><%=lTicket.getUsuarioNivel2()%></td> 
                <td><form method="post">
      
                 <input type="submit" formaction="muestraTicketCall"
                        id="9" value="MuestraDetalles" />
                 <input type="hidden" id="<%=lTicket.getID()%>" onclick="setIDTicket(id)" name="IDTicket" value="<%=lTicket.getID()%>"/>
      </form></td>
      
            </tr> 
           <%}%>  
        </table>  
        <hr/> 
       </br>
           <td><form method="post"><input type="submit" formaction="exportaClasesCall" value="Exporta esta lista a Excel" /></form></br></br>
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
     <script>
        
            function setIDTicket(id) {
                debugger
             
               document.body.getElementsByTagName("IDTicket").value = id;               
               alert(document.body.getElementsByTagName("IDTicket").value);
            }  
                        
      </script>
</html>