package kr.co.itwill.mail;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail() {
		
		
		//수신대상자
		ArrayList<String> toUserList = new ArrayList<>();
		
		toUserList.add("suminchoi0123@gmail.com"); //받을 주소
		
		int toUserSize = toUserList.size();
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize])); //수신자 설정
		
		simpleMessage.setSubject("제목");
		
		simpleMessage.setText("테스트!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		javaMailSender.send(simpleMessage);
		
		
		
		
	}
	
}
