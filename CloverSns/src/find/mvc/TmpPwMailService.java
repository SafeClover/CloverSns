package find.mvc;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServlet;

public class TmpPwMailService extends HttpServlet{
	
	// ������
	TmpPwMailService(){}
	
	// �̸��� ������ �޼���
	public void SendEmail(String email, String rndpw){
		String host = "smtp.gmail.com"; // ����� email �� ��������
		String from = "cloversnsjava@gmail.com"; // ������ ���� �ּ�
		String to = email; // �޴� �̸��� �ּ�
		String fromName = "Ŭ�ι�SNS"; // ������ ���� �̸�
		String subject = "�ӽú�й�ȣ �߼��Դϴ�."; // ������ ���� ����
		String content = "��û�Ͻ� �ӽú�й�ȣ�� " + rndpw + " �Դϴ�."; // ������ ���� ����	
		
		try{
			// ���� ������ ��Ʈ�� host �� ��Ÿ �����ϴ� ��
			Properties props = new Properties(); 
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			// ���ǿ� ��Ƽ� ������ ���� �α��� ��Ŵ
			Session session = Session.getDefaultInstance(props, 
				new javax.mail.Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication("cloversnsjava@gmail.com", "CloverSns");
					}
				});
			// �α��� �� ���¿��� ���� ����� �޴¸���, ����, ���� ���� ������.
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "euc-kr", "B")));
			
			InternetAddress address = new InternetAddress(to); // �޴� ���� ����
			msg.setRecipient(Message.RecipientType.TO, address); // ������ ���� ����
			msg.setSubject(subject); // ������ ���� ���� ����
			msg.setSentDate(new java.util.Date()); // ������ ���� ��¥ ����
			msg.setText(content); // ������ ���� ���� ����
			
			// �̰��� �ٷ� ���� ����.
			Transport.send(msg); 
		}
		catch(Exception err){
			System.out.println("TmpPwMailService : " + err);
		}
		System.out.println("������");
	}
	
}
