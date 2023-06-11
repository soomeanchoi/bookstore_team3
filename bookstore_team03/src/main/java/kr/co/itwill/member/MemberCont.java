package kr.co.itwill.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDAO;



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
	
	
	

	
	
}
	
	
	

