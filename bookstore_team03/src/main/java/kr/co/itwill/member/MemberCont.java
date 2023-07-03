package kr.co.itwill.member;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ch.qos.logback.core.encoder.Encoder;
import kr.co.itwill.KaKao.KakaoAPI;
import kr.co.itwill.booktag.BookTagDAO;
import kr.co.itwill.dropmem.DropMemberDAO;
import kr.co.itwill.dropmem.DropMemberDTO;

import kr.co.itwill.profile.ProfileDAO;
import kr.co.itwill.profile.ProfileDTO;
import kr.co.itwill.review.ReviewDAO;

import java.io.IOException;
import java.io.PrintWriter;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;




@Controller
@RequestMapping("/member")
public class MemberCont<ReviewDTO> {
    
	public MemberCont() {
        System.out.println("-----MemberCont()객체 생성됨");
    }//class end
    
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	MemberDTO memberDto;
	
	@Autowired
	ProfileDAO profileDao;

	@Autowired
	ProfileDTO profileDto;

	
	
	@Autowired
	private KakaoAPI kakao;
	
	
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
	 public ResponseEntity<String> insert(@ModelAttribute MemberDTO dto) {
		 //MemberDTO member = new MemberDTO();
		 //member.setMember_id(null);
		 
		 String member_id = dto.getMember_id();
		 dto.getMember_pw();
		 dto.getMember_name();
		 dto.getMember_birth();
		 dto.getMember_gender();
		 dto.getMember_phone();
		 
		 
		 memberDao.insert(dto);
		 memberDao.profileinsert(member_id);
		 
		 return ResponseEntity.ok("가입완료");
	 }

	//아이디 중복체크
	@RequestMapping("/idCheck")
	@ResponseBody 
    public int idCheck(@RequestParam("member_id") String member_id) {
		int cnt = memberDao.idCheck(member_id);
		return cnt;
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
    //loginInfo.put("member_phone", member_phone);

    ModelAndView mav = new ModelAndView();
    String viewPage = null;
    
	    if(memberDao.loginMember(loginInfo) == null) { // 로그인 실패
	    	
	    	mav.addObject("loginFailed", true);
	    	model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
	    	
	    	viewPage = "member/login";

	    }else{ // 로그인 성공 
	        
	        HttpSession session = request.getSession();
	        
	        session.setAttribute("member_id", loginInfo.get("member_id")); 
	        session.setAttribute("member_pw", loginInfo.get("member_pw")); 
	        
	       
	        
	        viewPage = "redirect:/";
	        // 추후 메인 페이지로 이동하게 
	    }
    
    return viewPage;
	}
	
	@RequestMapping("/loginfail")
	public ModelAndView loginfail() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	
	 // 로그인 유효 시간
	 @RequestMapping("/time")
	 public void time(HttpServletRequest request) {
         HttpSession session = request.getSession();
         session.setMaxInactiveInterval(30);
	 } 
	 
	 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		String viewPage = "member/login";
		return viewPage;
	}
	

	@RequestMapping("/myPage")
	public <BookTagDTO> ModelAndView myPage(HttpSession session, Model model
			, @ModelAttribute BookTagDAO bookTagDao) {
		ModelAndView mav=new ModelAndView();

		String member_id = (String) session.getAttribute("member_id");
		System.out.println(member_id);
		
		
		// memberDao.List(member_id)를 호출하여 반환되는 데이터를 MemberDTO 형태의 리스트로 저장
	    List<MemberDTO> memberData = memberDao.List(member_id);
	    mav.addObject("list", memberData);

	    if (!memberData.isEmpty()) {
	        MemberDTO memberInfo = memberData.get(0);
	        mav.addObject("member_name", memberInfo.getMember_name());
	    }
		
		// profileDao.list(member_id)를 호출하여 반환되는 데이터를 Map 형태로 저장
	    Map<String, Object> profileData = profileDao.list(member_id);
	    System.out.println(profileData);
	    
	    if (profileData == null) {
	    	
	    	model.addAttribute("profile_name", "프로필을 등록해주세요");
	    	model.addAttribute("profile_intro", "자신을 소개해보세요");
	        // 프로필 정보가 없는 경우, 기본값을 설정하거나 필요한 처리를 수행
	        // 예를 들어, 빈 프로필 정보를 추가하거나 다른 처리를 수행할 수 있습니다.
	        // 여기에 필요한 로직을 추가해주세요.
	    } else {
	        mav.addObject("plist", profileData);

	        // profile_name만 추출하여 mav에 추가
	        mav.addObject("profile_name", profileData.get("profile_name"));
	        mav.addObject("profile_intro", profileData.get("profile_intro"));
	        mav.addObject("profile_imgname", profileData.get("profile_imgname"));
	    }
	    
	    //border
	    mav.addObject("myorder", memberDao.orderlist(member_id));
	    
	    //이웃이 최근에 좋아요한 책, 내 bbti에 맞는 책
	    //tag
	    mav.addObject("mytag" , memberDao.taglist(member_id));
	    
	    //review
	    mav.addObject("myreview", memberDao.reviewlist(member_id));
	    //책 사진
	    // mav.addObject("book_img", memberDao.bookimg());
	    mav.addObject("book", memberDao.bookname(member_id));
	    
	    mav.addObject("myboard", memberDao.myboard(member_id));
	    
	    mav.addObject("mybbti_name", memberDao.mybbti(member_id));
	    
	    //마이페이지로 세션아이디 가져가기
	    mav.addObject("login_id", member_id);
	    
	   
	    System.out.println(memberDao.reviewlist(member_id));
	   
	    
	    
	    
	    
	    mav.setViewName("member/myPage");
		return mav;
	}
	
	// 수정 페이지
	@RequestMapping("/modify")
	public ModelAndView modify() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/modify");
		return mav;
	}
	
	// 수정 과정
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
	
	// 삭제 페이지 
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
	
	
	// 삭제 과정
	@RequestMapping("/deleteProc")
	public String deleteProc(@ModelAttribute MemberDTO dto, HttpSession session
								,RedirectAttributes rttr
								,@ModelAttribute MemberDAO dao
								,@ModelAttribute DropMemberDAO dropDao
								,@ModelAttribute DropMemberDTO dropDto) throws Exception {
		
		String member_pw = (String) session.getAttribute("member_pw");

		String newPw = dto.getMember_pw(); 
		
		if(!(member_pw.equals(newPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/deleteView";
		}else {
			
			// 비밀번호가 일치하는 경우
			rttr.addFlashAttribute("confirmDelete", true);
			
			memberDao.delete(dto);
			memberDao.deleteProfile(dto);
			session.invalidate();
		}
		
		return "redirect:/member/login";
	}
	
	/*
	// 패스워드 체크
	@ResponseBody
	@RequestMapping("/deleteProc")
	public int deleteProc(@ModelAttribute MemberDTO dto) throws Exception {
		int result = memberDao.delete(dto);
		return result;
	}
	*/

	@RequestMapping(value="/kakao/callback")
    public String login(@RequestParam("code") String code, HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        
        return "kakao";
    }
	
	
	// 아이디 찾기 
	@RequestMapping("/findIdForm")
	public ModelAndView findIdForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/findIdForm");
		return mav;
	}
	
	
	@RequestMapping("/findId")
	@ResponseBody
	public String findId(@RequestParam("member_name") String member_name,
						 @RequestParam("member_phone") String member_phone) {
		
		String result = memberDao.findId(member_name, member_phone);

		try {
			result = memberDao.findId(member_name, member_phone);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("/findPwForm")
	public ModelAndView findPwForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/findIdForm");
		return mav;
	}
	
	
	/*
    // 비밀번호 찾기 실행
	@RequestMapping("/findPw")
	public String findPw(UserVO vo, Model model) {
		UserVO user = userService.findPassword(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getId());
		}
		return "member/findPassword";
	}
	*/
	
	/*
	@RequestMapping("/findPw")
	public ModelAndView findPw(HttpServletRequest request, String member_name,
								HttpServletResponse response_email) throws IOException {
		
		
		//랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
        
        Random r = new Random();
        int dice = r.nextInt(157211)+48271;
        
        String member_id = memberDto.getMember_id();
        
        //MimeMessage mail = MailSender.createMimeMessage();
     


        String setfrom = "suminchoi0123@gmail.com";
        String tomail = request.getParameter("tnals5870@naver.com");    //받는 사람의 이메일
        String title = "비밀번호 찾기 인증 이메일 입니다.";    //제목
        String content =
        
                System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                        
                "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
        
                "비밀번호 찾기 인증번호는 " +dice+ " 입니다. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
				
        ModelAndView mav = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mav.setViewName("/member/pass_email");     //뷰의이름
        mav.addObject("dice", dice);
        mav.addObject("member_id", member_id);
        
        System.out.println("mav : " + mav);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        	
        return mav;
      
		}
		*/

		
			// 비밀번호 찾기 위한 메일 보내는 페이지로 이동
			@RequestMapping("/myPageMail")
			public ModelAndView myPageMail(HttpSession session) {
				String s_id = (String) session.getAttribute("member_id");
				ModelAndView mav=new ModelAndView();
				mav.setViewName("member/myPageMail");
				mav.addObject("s_id", s_id);
				
				return mav;
			}
			
			@PostMapping("/findpw")
			@ResponseBody
		    public String findPw(@RequestParam("member_name") String member_name, @RequestParam("member_id") String member_id) {
				
			
				System.out.println(member_name);
				System.out.println(member_id);
				/*
				 * // 회원 정보와 이메일 주소를 이용하여 비밀번호 찾기 로직 수행
				 * 
				 * // 비밀번호를 이메일로 전송 String toAddress = "tnals5870@naver.com"; // 수신자 이메일 주소
				 * String subject = "비밀번호 찾기 결과"; String message = "비밀번호는 " +
				 * memberDto.getMember_pw() + "입니다."; // 실제 비밀번호 값으로 변경
				 * 
				 * .sendEmail(toAddress, subject, message); // sendEmail() 메서드 호출
				 */
			
			
				
				
				
		        return "location.href='mail'";
		    }
    
		
			
			
}//class end
	
	
	

