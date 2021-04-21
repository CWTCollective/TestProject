<%-- 
    Document   : index
    Created on : 5 Feb 2021, 12:40:06
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de login</title>
    </head>
    <h1>Haz login para acceder a la aplicacion Bilbiobla</h1>    
</br>
    <body>
          <% String std  = (String)request.getAttribute("data");              
                if (std== null){std="";}
            %> 
        <form action="guardaDatos" method="post">
            <table style="with: 50%">
			        <tr>
					<td>Usuario</td>                                        
					<td><input type="text" name="user" /></td>
				</tr>				
                                <tr>
					<td>contraseña</td>                                       
					<td><input type="password" name="pass" /></td>
				</tr>				                                                            
           </table>
            </br>
            <input type="submit" value="Login"/></br></br>

           <td><%=std%></td> 
           <hidden name="userID" type="long" />	
        </form>
    </body>
</html>