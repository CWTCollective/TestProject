/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.DataSource;

/**
 *
 * @author Maria
 */
public class MailSender {

    String correoOriginario;
    String pass;
    String correoDestino;
    String subject;
    String msgBody = "";

    public MailSender(String usuarioCorreo, String contras, String correoDestino) {
        this.correoOriginario = usuarioCorreo;
        this.pass = contras;
        this.correoDestino = correoDestino;

    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * 
     * @param stringMessage
     * @return 
     */
     
    public boolean sendMultipart(String stringMessage) {
        msgBody = stringMessage;
        // TODO code application logic here
        String host = "smtp.gmail.com";
        final String user = correoOriginario;//change accordingly  
        final String password = pass;//change accordingly  

        String to = correoDestino;//change accordingly  

        //Get the session object  
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.debug", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        try {


                MimeMessage message = new MimeMessage(session);
                Multipart multipart = new MimeMultipart("alternative");

                MimeBodyPart htmlPart = new MimeBodyPart();

                message.setFrom(new InternetAddress(user));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);
                htmlPart.setContent(msgBody, "text/html; charset=utf-8");
                multipart.addBodyPart(htmlPart);
                message.setContent(multipart);

                //send the message  
                Transport.send(message);

                System.out.println("message sent successfully...");
              
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return true;
    }
}
