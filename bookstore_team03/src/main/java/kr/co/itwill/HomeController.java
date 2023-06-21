/*
package kr.co.itwill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.KaKao.KakaoAPI;

@Controller
public class HomeController {

	 public HomeController() {
	        System.out.println("-----HomeController()객체 생성됨");
	    }
	   
	    @RequestMapping(value="/")
	    public String index() {
	        
	        return "index";
	    }
	    /*
	       spring09_myshop 프로젝트의 첫페이지 호출
	       http://localhost:9095
	    */    
	    

