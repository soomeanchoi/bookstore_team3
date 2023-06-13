package kr.co.itwill.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;




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
	
	/*
	@PostMapping("/joinProc")
	public String joinProc(MemberDTO dto) {  
	//form 에서 전송된 VO 값이 memberVo 에저장
	 
	int result=memberDao.insert(dto);
	//int 로 받는 이유는 DB 에서 정상적으로
	//회원가입이 되면 "1"행이 실행된거 알기위해서에요
	    String viewPage = null;
	    if(result==1) { // DB 저장 성공시실행
	    viewPage = "member/list";
	    }else{ // DB저장 실패시 실행
	    viewPage = "member/join";
	        }
	        return viewPage;
	    }
	*/

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
	
}
	
	
	

