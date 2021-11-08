package mailcode;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSendCode {
	public static String sendMail(String receiverEmail,String sub,String body) {
		
		//mail code
		try {
			dao.DbConnect db=new dao.DbConnect();
			HashMap<String,String> h=db.getAdminDetails();
			final String SEmail=(String)h.get("email");
            final String SPass=(String)h.get("password");
            final String REmail=receiverEmail;
            final String Sub=sub;
            final String Body=body;
            
            Properties prop = new Properties();  
            prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			
			Session ses = Session.getInstance(prop,  
		    new javax.mail.Authenticator() {  
		      protected PasswordAuthentication getPasswordAuthentication() {  
		    return new PasswordAuthentication(SEmail,SPass);  
		      }  
		    });
			
			Message message=new MimeMessage(ses);
            message.setFrom(new InternetAddress(SEmail));
            message.setRecipients(Message.RecipientType.TO, 
            		InternetAddress.parse(REmail));
            message.setSubject(Sub);
            message.setContent(Body,"text/html" );
            
            Transport.send(message);
            return "Mail Send Success";
            
		}catch(Exception e) {
			e.printStackTrace();
			return "Something went wrong with mail sending";
		}
		//mail code end
		
	}
}
