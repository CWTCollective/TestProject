/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import java.util.HashSet;


/**
 *
 * @author Maria
 */
public class Envia {
    
    public Envia(){
    
    MailSender uncorreo = new MailSender("coolwebtoolscollective@googlemail.com","Omar0101","m_lagares@hotmail.com");
   
    //uncorreo.sendSimpleMessage("blabla>");
    uncorreo.sendMultipart("blabla>");
    //uncorreo.setMessageBody( mensaje += "<p>Nombre: " + persona.getNombre() + ", Apellidos: " + persona.getApellidos() + ", Email: " + persona.getEmail() + "</p><br>");
    uncorreo.setSubject("This is the subject");
    String mensaje = "un mensaje";
    String nombre ="Manuel";
    String apellidos =" blbla";
    String correo = "bla@bla.com"; 
     uncorreo.sendMultipart( mensaje += "<p>Nombre: " + nombre + ", Apellidos: " + apellidos + ", Email: " + correo + "</p><br>");
     
    }
}
