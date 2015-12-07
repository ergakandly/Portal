package com.hris.portal.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.hris.portal.manager.PortalManager;
import com.hris.portal.model.PortalUserBean;

public class PortalEmailUtil {

	public static void sendEmailActivation(String user, String pass, PortalUserBean bean) {
		final String username = "ace.hris.hris@gmail.com";
		final String password = "emaildummy";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ace.hris.hris@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(bean.getEmail()));
			message.setSubject("Password Reset");
			message.setText("Dear, <b>"+bean.getEmployeeName()+"</b>.<br/><br/><p>Welcome to HRIS Application.<br/>"+
							"Your account has been activated.</p><br/><p>You will be able to login in the future using:<br/>"+
							"Username: "+user+"<br/>Password: "+pass+"</p><br/>Don't forget to change your password after login."+
							"<br/><br/><br/>-- HRIS Administrator");
			
			Transport.send(message);
			System.out.println("PORTAL - Send Email Activation.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendEmailForgotPassword(String user) {
		final String username = "ace.hris.hris@gmail.com";
		final String password = "emaildummy";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		PortalUserBean pBean = new PortalUserBean();
		PortalManager pManager = new PortalManager();
		pBean = pManager.getEmailData(user);
		System.out.println(pBean.getEmail());
		try {
			pManager.updatePassword(PortalUtil.getHash(pBean.getBirthday()), pBean.getUserEmployeeId());
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ace.hris.hris@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(pBean.getEmail()));
			message.setSubject("Password Reset");
			message.setText("Dear, <b>"+pBean.getEmployeeName()+"</b>.<br/><br/><p>We've received a request to reset the password for this username</p>"+
							"<br/>This is your new log in information:<br/>Username: "+user+"<br/>Password: "+pBean.getBirthday()+
							"</p><br/>Keep it secret. Keep it safe.<br/><br/><br/>-- HRIS Administrator");
			
			Transport.send(message);
			System.out.println("PORTAL - Send Email Activation.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
