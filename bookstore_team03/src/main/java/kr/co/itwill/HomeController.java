
package kr.co.itwill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.KaKao.KakaoAPI;

@Controller
@RequestMapping("/template")
public class HomeController {

	 public HomeController() {
	        System.out.println("-----HomeController()객체 생성됨");
	    }
	   
	    @RequestMapping("/index")
	    public String index() {
	        return "redirect:/";
	    }
	  
}	    

