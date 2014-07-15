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
	
	// 생성자
	TmpPwMailService(){}
	
	// 이메일 보내는 메서드
	public void SendEmail(String email, String rndpw){
		String host = "smtp.gmail.com"; // 사용할 email 과 프로토콜
		String from = "cloversnsjava@gmail.com"; // 보내는 메일 주소
		String to = email; // 받는 이메일 주소
		String fromName = "클로버SNS"; // 보내는 메일 이름
		String subject = "임시비밀번호 발송입니다."; // 보내는 메일 제목
		String content = "회원님의 비밀번호는 임시 비밀번호로 변경되었습니다. \n 변경된 임시비밀번호는 " + rndpw + " 입니다. \n 로그인 후에 회원정보수정 페이지에서 비밀번호를 변경 해주시기 바랍니다."; // 보내는 메일 내용
		
		System.out.println("email 전송 : " + email);
		
		try{
			// 보낼 메일의 포트와 host 등 기타 설정하는 곳
			Properties props = new Properties(); 
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			// 세션에 담아서 보내는 메일 로그인 시킴
			Session session = Session.getDefaultInstance(props, 
				new javax.mail.Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication("cloversnsjava@gmail.com", "CloverSns");
					}
				});
			// 로그인 된 상태에서 위에 선언된 받는메일, 내용, 제목 등을 보내줌.
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "euc-kr", "B")));
			
			InternetAddress address = new InternetAddress(to); // 받는 메일 지정
			msg.setRecipient(Message.RecipientType.TO, address); // 보내는 메일 지정
			msg.setSubject(subject); // 보내는 메일 제목 지정
			msg.setSentDate(new java.util.Date()); // 보내는 메일 날짜 지정
			msg.setText(content); // 보내는 메일 내용 지정
			
			// 이것이 바로 메일 보냄.
			Transport.send(msg); 
		}
		catch(Exception err){
			System.out.println("TmpPwMailService : " + err);
		}
		System.out.println("성공했");
	}
	
}
