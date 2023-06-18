package kr.co.itwill.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itwill.profile.ProfileDAO;
import kr.co.itwill.profile.ProfileDTO;

import java.util.HashMap;



@Controller
@RequestMapping("/member")
public class MemberCont {
    
	public MemberCont() {
        System.out.println("-----MemberCont()객체 생성됨");
    }//class end
    
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	ProfileDAO profileDao;

	@Autowired
	ProfileDTO profileDto;

	/*
	 * @RequestMapping("/list") public ModelAndView list() { ModelAndView mav=new
	 * ModelAndView(); mav.setViewName("member/list"); mav.addObject("list",
	 * memberDao.list()); return mav; }//list() end
	 */	
	
	
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
		 
		 return "redirect:/member/login";
	 }

	 
	//아이디 중복체크
	 @RequestMapping("/checkId.do")
	    //@ResponseBody ajax 값을 바로jsp 로 보내기위해 사용
	    public String checkId(@RequestParam("member_id") String member_id) {
	        String result="N";
	        
	        int flag = memberDao.checkId(member_id);
	        
	        if(flag == 1) result ="Y"; 
	        //아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
	        return result;
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
            HttpServletRequest request,
            Model model) {
	
	HashMap<String, String> loginInfo = new HashMap<>();
    //member_id 와 member_pw 를 map 에 담아서 한객체로 담아가기위함

	loginInfo.put("member_id", member_id);
    loginInfo.put("member_pw", member_pw);

    ModelAndView mav = new ModelAndView();
    String viewPage = null;
    
    if(memberDao.loginMember(loginInfo) == null) { // 로그인 실패
    	viewPage = "member/login";
    	mav.addObject("loginFailed", true);
    
    }else{ // 로그인 성공 
        
        HttpSession session = request.getSession();
        
        session.setAttribute("member_id", loginInfo.get("member_id")); 
        session.setAttribute("member_pw", loginInfo.get("member_pw")); 
        
        
        viewPage = "member/myPage";
        // 추후 메인 페이지로 이동하게 
    }
    
    return viewPage;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		String viewPage = "member/loginForm";
		return viewPage;
	}
	

	@RequestMapping("/myPage")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav=new ModelAndView();

		//안 옴
		String member_id = (String) session.getAttribute("member_id");
		System.out.println(member_id);
		// 프로필 정보 가져오기
		//model.addAttribute("loginInfo", loginInfo);
	   // mav.addObject("profile.list", profileDao.list(member_id));
		
		
		mav.addObject(memberDao.profilelist(member_id));
		System.out.println(memberDao.profilelist(member_id));
		mav.setViewName("member/myPage"); 
//		System.out.println(profileDao.list(member_id));
//		mav.addObject("list", profileDao.list(member_id));
		
		return mav;
	}
	
	
	@RequestMapping("/modify")
	public ModelAndView modify() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/modify");
		return mav;
	}
	

	@RequestMapping("/update")
	 public String update(@ModelAttribute MemberDTO dto,
			 				HttpSession session) {
		 //MemberDTO member = new MemberDTO();
		 //member.setMember_id(null);
		 memberDao.update(dto);
		 session.invalidate();
		 return "redirect:/member/myPage";
	 }
	
	/*
	@RequestMapping("/deleteView")
	public String delete(@ModelAttribute MemberDTO dto, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		memberDao.delete(dto);
		session.invalidate();
		return "redirect:/member/deleteView";
	}
	*/
	
	@RequestMapping("/deleteView")
	public ModelAndView delete() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/deleteView");
		return mav;
	}
	
	/*
	@RequestMapping("/deleteProc")
	public ModelAndView deleteProc() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/deleteProc");
		return mav;
	}
	*/
	
	@RequestMapping("/deleteProc")
	public String deleteProc(@ModelAttribute MemberDTO dto, HttpSession session
								,RedirectAttributes rttr) throws Exception {
		
		String member_pw = (String) session.getAttribute("member_pw");
		
		String newPw = dto.getMember_pw(); 
		
		if(!(member_pw.equals(newPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/deleteView";
		}
		
		memberDao.delete(dto);
		session.invalidate();
		return "redirect:/member/login";
	}
	

	
}
	
	
	

