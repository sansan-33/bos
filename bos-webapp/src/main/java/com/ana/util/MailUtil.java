package com.ana.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class MailUtil {

    private final Logger theLogger = LoggerFactory.getLogger(MailUtil.class);

	public static void main(String[] args) {
		MailUtil mail = new MailUtil();
		mail.sendMail("anthan.wong@gmail.com","Testing email from bookofschool", "We've reset your password as below");
	}
	public void sendMail(String to, String subject, String text){
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");


        try {
            Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("bookofschool@gmail.com","a140087a");
				}
			});

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("bookofschool@gmail.com"));
			theLogger.debug("sendMail: " + to + "\n" + subject + "\n" + text);
			message.setRecipients(Message.RecipientType.TO,	InternetAddress.parse(to));
			message.setSubject(subject,"utf-8");
			// Create a message part to represent the body text
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent( text, "text/html; charset=utf-8" ); // <----

			// use a MimeMultipart as we need to handle the file attachments
			Multipart multipart = new MimeMultipart();

			// add the message body to the mime message
			multipart.addBodyPart( messageBodyPart );

			// Put all message parts in the message
			message.setContent( multipart );

			Transport.send( message ); 
 	
		} catch (MessagingException e) {
            theLogger.error("Mail Exception: {} " ,e);
			throw new RuntimeException(e);
		}
	}
}
