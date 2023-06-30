package kr.co.itwill.mail;

import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itwill.member.MemberDAO;
import kr.co.itwill.member.MemberDTO;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	MemberDTO memberDto;
	
	public void sendMail(String member_id, String passwd) {
		
		
		//수신대상자
		ArrayList<String> toUserList = new ArrayList<>();
		
		toUserList.add(member_id); //받을 주소
		
		int toUserSize = toUserList.size();
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize])); //수신자 설정
		
		simpleMessage.setSubject("고객님의 비밀번호를 알려드립니다.");
		
		simpleMessage.setText("당신의 비밀번호는 " + passwd + "입니다");
		
		javaMailSender.send(simpleMessage);
		
			
	}
	
		public String sendInquityMail(@RequestParam Map<String,Object> map) {
		
		
		//수신대상자
		ArrayList<String> toUserList = new ArrayList<>();
		
		String subject = (String) map.get("mail_subject");
		String inquityNum = (String) map.get("InquiryQuestList");
		String content = (String) map.get("mail_Content");
		String member_id = (String) map.get("member_id");
		
		toUserList.add("suminchoi0123@gmail.com"); //받을 주소
		
		int toUserSize = toUserList.size();
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize])); //수신자 설정
		
		simpleMessage.setSubject(subject);
		
		String totalContent = "";
		totalContent += "문의번호 : " + inquityNum + "입니다\n";
		totalContent += "문의내용 : " + content + "입니다\n";
		totalContent += "문의한 유저 : " + member_id + "입니다\n";
		
		simpleMessage.setText(totalContent);

		
		javaMailSender.send(simpleMessage);
		
		return "redirect:/member/myPage";
	}
	
	

	
	/*
	 * public void sendEmail(String toAddress, String subject, String messageText) {
	 * // SMTP 서버 설정 String host = "smtp.gmail.com"; String username =
	 * "suminchoi0123@gmail.com"; // 보내는 이메일 주소 String password = "chl2525!"; // 보내는
	 * 이메일 비밀번호
	 * 
	 * // 이메일 설정 Properties props = new Properties(); props.put("mail.smtp.auth",
	 * "true"); props.put("mail.smtp.starttls.enable", "true");
	 * props.put("mail.smtp.host", host); props.put("mail.smtp.port", "587");
	 * 
	 * // 인증 객체 생성 Authenticator auth = new Authenticator() { protected
	 * PasswordAuthentication getPasswordAuthentication() { return new
	 * PasswordAuthentication(username, password); } };
	 * 
	 * // 메시지 작성 Session session = Session.getInstance(props, auth); try { Message
	 * message = new MimeMessage(session); message.setFrom(new
	 * InternetAddress(username)); message.setRecipients(Message.RecipientType.TO,
	 * InternetAddress.parse(toAddress)); message.setSubject(subject);
	 * message.setText(messageText);
	 * 
	 * // 메시지 전송 Transport.send(message); System.out.println("이메일이 성공적으로 전송되었습니다.");
	 * } catch (MessagingException e) { e.printStackTrace(); } }
	 */
	/*
	public void sendEmail(MemberDTO dto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "suminchoi0123@gmail.com";
		String hostSMTPpwd = "chl2525!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "team3@gmail.com";
		String fromName = "ITWILL TEAM3";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "베프마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += dto.getMember_name() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getMember_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = dto.getMember_id();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			//email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			//email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	public void findPw(HttpServletResponse response, MemberDTO dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String dao = dao.findId();
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(mdao.idCheck(vo.getId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPw(pw);
			// 비밀번호 변경
			mdao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	*/
}
