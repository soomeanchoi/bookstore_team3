package kr.co.itwill.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mailCont {

	@Autowired
	MailService mailService;
	
	@RequestMapping("/mail")
	public void MailTest() {
		mailService.sendMail();
	}
	
	
}
