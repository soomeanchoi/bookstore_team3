package kr.co.itwill.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itwill.member.MemberDAO;
import kr.co.itwill.member.MemberDTO;

@Controller
public class mailCont {

	
	@Autowired
	MemberDTO memberDto;
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	MailService mailService;
	
	
	@PostMapping("/mail")
	@ResponseBody
	
	public void MailTest(@RequestParam("member_name") String member_name, @RequestParam("member_id") String member_id) {
		
		System.out.println(member_name);
		System.out.println(member_id);
		
		String passwd = memberDao.findPw(member_name, member_id);
		
		mailService.sendMail(member_id, passwd);
	}
	/*
	@PostMapping("/member/findpw")
    @ResponseBody
    public String findPw(@RequestParam("member_name") String member_name, @RequestParam("member_id") String member_id) {
        // 회원 정보와 이메일 주소를 이용하여 비밀번호 찾기 로직 수행

        // 비밀번호를 이메일로 전송
        String toAddress = "tnals5870@naver.com"; // 수신자 이메일 주소
        String subject = "비밀번호 찾기 결과";
        String message = "비밀번호는 " + memberDto.getMember_pw() + "입니다."; // 실제 비밀번호 값으로 변경

        sendEmail(toAddress, subject, message); // sendEmail() 메서드 호출

        return "이메일이 성공적으로 전송되었습니다.";
    }
*/
}
