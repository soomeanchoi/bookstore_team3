package kr.co.itwill.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;



@Controller
@RequestMapping("/member")
public class MemberCont {
    
	public MemberCont() {
        System.out.println("-----MemberCont()객체 생성됨");
    }//class end
    
	@Autowired
	MemberDAO memberDao;


	/*
	 * @RequestMapping("/list") public ModelAndView list() { ModelAndView mav=new
	 * ModelAndView(); mav.setViewName("member/list"); mav.addObject("list",
	 * memberDao.list()); return mav; }//list() end
	 */	
	
	@RequestMapping("/list")
    public ModelAndView list() {
    	   	
    	//로그인 했다면
    	//String s_id=session.getAttribute("s_id")
    	String s_id="test"; //여기서는 임시 아이디 test
    	
        ModelAndView mav=new ModelAndView();
        mav.setViewName("member/list"); // /WEB-INF/views/cart/list.jsp
        mav.addObject("list", memberDao.cartList(s_id)); 
        return mav;
    }//list() end
	
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/join");
		return mav;
	}
	

	 @RequestMapping("/insert")
	 public String insert(@ModelAttribute MemberDTO dto) {
		 //MemberDTO member = new MemberDTO();
		 //member.setMember_id(null);
		 
		 dto.getMember_id();
		 dto.getMember_pw();
		 dto.getMember_name();
		 dto.getMember_birth();
		 dto.getMember_gender();
		 dto.getMember_phone();
		 
		 memberDao.insert(dto);
		 
		 return "redirect:/member/list";
	 }

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	 

	@RequestMapping("/logindo")
	public String logindo(@RequestParam String member_id,
            @RequestParam String member_pw,
            HttpServletRequest request) {
	
	HashMap<String, String> loginInfo = new HashMap<>();
    //member_id 와 member_pw 를 map 에 담아서 한객체로 담아가기위함

	loginInfo.put("member_id", member_id);
    loginInfo.put("member_pw", member_pw);

    
    String viewPage = null;
    
    if(memberDao.loginMember(loginInfo) == null) { // 정상적으로 로그인되면
    	
    	viewPage = "member/loginfail";
    
    }else{ // 로그인 실패시 다시 
        
        HttpSession session = request.getSession();
        
        session.setAttribute("member_id", loginInfo.get("member_id")); 
        session.setAttribute("member_pw", loginInfo.get("member_pw")); 
        
        viewPage = "member/loginsuccess";
    }
    
    return viewPage;
	}
}
	
	
	

