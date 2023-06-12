package kr.co.itwill.border;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.border.BorderDTO;

@Controller
@RequestMapping("/border")
public class BorderCont {

	public BorderCont() {
		System.out.println("----BorderCont() 객체생성");
	}//end	
	
	@Autowired
	BorderDAO borderDao;
	
	String s_id = "kgukid38@naver.com";
	
	@RequestMapping("/borderform")
	public String borderform() {
		return "/border/borderform";
	}//orderform() end
	
	
	@RequestMapping("/dateno")
	public String dateno() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss"); //20230523171714 문자열로 반환
		String date = sd.format(new Date());
		
		int dateno = Integer.parseInt(borderDao.dateno(date));//주문번호앞자리 중복수
		date = date + Integer.toString(dateno+1);
		return date;
	}//dateno() end
	
	
	
	@RequestMapping("/insert")
	public ModelAndView Insert(BorderDTO dto, HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		//String s_id = session.getAttribute("s_id"); 로그인기능 구현했다면
		String border_no = dateno();//생성한 주문번호 변수넣기
		
		int border_price=borderDao.border_price(s_id);
		//System.out.println(border_price);
		
		//dto에 주문서번호, 총결제금액, 세션아이디 추가로 담기(수령인, 주소, 결제방법 등은 이미 dto에 담겨있음)
		dto.setBorder_no(border_no);
		dto.setBorder_price(border_price);
		dto.setMember_id(s_id);
		
		//border테이블에 행추가
		int cnt= borderDao.Insert(dto);
		System.out.println("행추가결과" + cnt);
		
		if(cnt==1) {//결제된 상품 상세내역에 주문내역이 추가되었다면
			//cart테이블에 있는 주문상품을 orderlist테이블에 옮겨닮기
			HashMap<String, String> map = new HashMap<>();
			map.put("border_no", border_no);
			map.put("s_id", s_id);
			
			int result = 0;
			result = borderDao.orderlistInsert(map);
			System.out.println("orderlist행추가결과: " + result);
			
			if(result!=0) {//주문상세내역에 추가된 내역이 있다면
				//장바구니 목록이 주문상세내역으로 이동된 후(결제완료) 장바구니 비우기
				borderDao.cartdelete(s_id);				
			}//if end
		
			mav.addObject("msg", "주문이 완료되었습니다");
			mav.setViewName("/border/msgView");  // /WEB-INF/views/border/msgView.jsp
		}//if end
		
		return mav;
	}//orderInsert() end
}//class end
