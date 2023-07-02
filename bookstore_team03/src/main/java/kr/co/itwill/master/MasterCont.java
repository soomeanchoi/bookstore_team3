package kr.co.itwill.master;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MasterCont {
	public MasterCont() {
		System.out.println("----MasterCont() 객체생성");
	}//end
	/*
	@RequestMapping("/**")
	public ModelAndView master_id(HttpSession session) {
		
		String s_id = (String) session.getAttribute("member_id");
		
		ModelAndView mav = new ModelAndView();
	
	    mav.setViewName("/template/header");
		
		//mav.addObject("login_id", s_id);
	    session.setAttribute("login_id", s_id);
		return mav;
	}//master_id() end
	*/
	/*@RequestMapping("/**")
	public String master_id(HttpSession session) {
		
		String s_id = (String) session.getAttribute("member_id");
		
		//ModelAndView mav = new ModelAndView();
	
	    //mav.setViewName("/template/header");
		
		//mav.addObject("login_id", s_id);
	    session.setAttribute("login_id", s_id);
		return "/template/header";
	}//master_id() end
	*/	}//class() end
