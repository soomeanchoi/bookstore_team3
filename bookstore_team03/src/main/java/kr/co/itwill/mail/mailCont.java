package kr.co.itwill.mail;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	
	@PostMapping("/mail/inquity")
	public String inquityMail(@RequestParam Map<String, Object>map, HttpSession session) {
		
		System.out.println("---------------------------------------");
		
		String s_id = (String) session.getAttribute("member_id");
		System.out.println(s_id);
		System.out.println(map.toString());
	
		
		map.put("member_id", s_id);
		
		
		mailService.sendInquityMail(map);
		
		return "redirect:/member/myPage";
	}
	
	
	
}
