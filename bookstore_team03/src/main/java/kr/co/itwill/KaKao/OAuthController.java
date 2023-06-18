package kr.co.itwill.KaKao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/kakao")
public class OAuthController {

    /**
     * 카카오 callback
     * [GET] /oauth/kakao/callback
     */
	@Autowired
	private KakaoAPI kakao;
	
	/*
	 * @GetMapping("/callback") public void kakaoCallback(@RequestParam String code)
	 * { System.out.println(code); }
	 */
    
	/*
	 * @RequestMapping(value="/callback") public String login(@RequestParam("code")
	 * String code) { String access_Token = kakao.getAccessToken(code);
	 * System.out.println("controller access_token : " + access_Token);
	 * 
	 * return "index"; }
	 */
    
	@RequestMapping(value="/callback")
    public String login(@RequestParam("code") String code, HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        
        return "redirect:/member/myPage";
    }
	
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        kakao.kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        return "index";
    }

    
}