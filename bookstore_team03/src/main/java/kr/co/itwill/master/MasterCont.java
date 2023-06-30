package kr.co.itwill.master;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MasterCont {
	public MasterCont() {
		System.out.println("----MasterCont() 객체생성");
	}//end
	
	@GetMapping("/header")
	public String master_id(HttpSession session, Model model) {
		System.out.println("헤더세션");
		String s_id = (String) session.getAttribute("member_id");
		
		model.addAttribute("s_id", s_id);		
		return "/header";
	}//master_id() end
}//class() end
