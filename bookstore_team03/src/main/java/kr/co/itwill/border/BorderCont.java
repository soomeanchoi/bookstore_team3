
package kr.co.itwill.border;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.border.BorderDTO;
import kr.co.itwill.cart.CartDTO;

@Controller
@RequestMapping("/border")
public class BorderCont {

	public BorderCont() {
		System.out.println("----BorderCont() 객체생성");
	}//end	
	
	@Autowired
	BorderDAO borderDao;
	
	
	//주문번호생성
	@RequestMapping("/dateno")
	public String dateno() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss"); //20230523171714 문자열로 반환
		String date = sd.format(new Date());
		
		int dateno = Integer.parseInt(borderDao.dateno(date));//주문번호앞자리 중복수
		
		date = date + Integer.toString(dateno+1);
		return date;
	}//dateno() end
	
	//상품 직접 구매 페이지
	@RequestMapping("/directborderForm")
	public ModelAndView directorderForm(String isbn, int cart_qty, HttpSession session) {
		System.out.println(isbn);
		System.out.println(cart_qty);
		
		String s_id = (String)session.getAttribute("member_id"); 
		
		//String s_id = "kgukid38@naver.com";
		ModelAndView mav=new ModelAndView();
		mav.setViewName("border/directborderForm");
		
		HashMap<String, Object> map = new HashMap<>();
		map = borderDao.directborder(isbn);
		
		//계정정보, 선택된 수량, 책정보 추가
		mav.addObject("orderlist_cnt", cart_qty);
		mav.addObject("s_id", s_id);
		mav.addObject("isbn", isbn);
		mav.addObject("directborder",map);

		//기본배송지 가져오기
		HashMap<String, Object> deliveryAdd = borderDao.deliveryAdd(s_id);
		mav.addObject("deliveryAdd", deliveryAdd);
		
		//보유포인트 가져오기
		int havepoint = borderDao.havepoint(s_id);
		mav.addObject("havepoint", havepoint);
		
		//적립포인트 계산 총도서금액*0.1
		int book_price = (int)map.get("book_price"); 
		int addpoint = (int)Math.floor(book_price * 0.1);
		mav.addObject("addpoint", addpoint);
		
		return mav;
	}//directorderForm() end
	
	
	
	//장바구니구매: 기본배송지, 장바구니, 포인트 가져와 출력하며 주문서페이지 띄우기
	@RequestMapping("/orderForm")
	public ModelAndView borderform(HttpSession session, HttpServletRequest req) {
	//public ModelAndView borderform(HttpSession session ,@RequestParam("cart_no") List<String> cart_no,@RequestParam("cart_qty") List<Integer> cart_qty) {
		
		System.out.println("-------borderCont 호출확인");
		
		String cart_no[] = req.getParameterValues("cart_no");
		String cart_qty[] = req.getParameterValues("cart_qty");
		
		String s_id = (String)session.getAttribute("member_id"); 
		//String s_id = "kgukid38@naver.com";
		
		
		//장바구니 업데이트
		//주문상품 각각의 정보를 넣을 list생성
		List<Map<String, Object>> cartlist = new ArrayList<>();
		
		//주문상품 각각의 정보를 map에 넣고 이것을 list에 넣기 
		for(int i =0 ; i < cart_no.length ; i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("cart_no", Integer.parseInt(cart_no[i]));
			map.put("cart_qty", Integer.parseInt(cart_qty[i]));
			
			cartlist.add(i, map);					
		}//for end
		
		int cnt = borderDao.cartUpdate(cartlist);
		
		//System.out.println("카트수정성공"+ cnt);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("border/orderForm");
		
		//기본배송지 가져오기
		HashMap<String, Object> deliveryAdd = borderDao.deliveryAdd(s_id);
		mav.addObject("deliveryAdd", deliveryAdd);
		
		//장바구니 내역 가져오기
		List<HashMap<String, Object>> cart = borderDao.cart(s_id);
		mav.addObject("cart", cart);
		
		//보유포인트 가져오기
		int havepoint = borderDao.havepoint(s_id);
		mav.addObject("havepoint", havepoint);
		
		//총도서금액 가져오기
		int border_price = borderDao.border_price(s_id);
		mav.addObject("border_price", border_price);
		
		//적립포인트 계산 총도서금액*0.1
		int addpoint = (int)Math.floor(border_price * 0.1);
		mav.addObject("addpoint", addpoint);
		
		return mav;
	}//orderform() end
	
	//직접구매: 주문서테이블행추가
	@RequestMapping("/directinsert")
	public ModelAndView directinsert(String isbn, int orderlist_cnt
									, HttpSession session
									,@ModelAttribute BorderDTO dto) {
		String s_id = (String)session.getAttribute("member_id"); 
		//String s_id = "kgukid38@naver.com";
		ModelAndView mav=new ModelAndView();
		String border_no = dateno();//생성한 주문번호 변수넣기
		
		//dto에 총결제금액, 세션아이디 추가로 담기(수령인, 주소 등은 이미 dto에 담겨있음)
		dto.setBorder_no(border_no);
		dto.setMember_id(s_id);
		//System.out.println(dto.toString());
		//border테이블에 행추가
		int cnt= borderDao.insert(dto);
		System.out.println("행추가결과" + cnt);
		
		if(cnt==1) {//order테이블에 행추가되면
			//directborderForm에서 받아온 상품정보와 주문서번호를 orderlist테이블에 옮겨닮기
			HashMap<String, Object> map = new HashMap<>();
			map.put("s_id", s_id);
			map.put("isbn", isbn);
			map.put("border_no", border_no);
			map.put("orderlist_cnt", orderlist_cnt);
			int result = 0;
			result = borderDao.directorderlistInsert(map);
			System.out.println("orderlist행추가결과: " + result);
			
			mav.addObject("msg", "주문이 완료되었습니다");
			mav.setViewName("/border/msgView");  // /WEB-INF/views/border/msgView.jsp
		}//if end
		
		return mav;
	}//directinsert() end
	

	
	//장바구니구매 : 주문서테이블행추가
	@RequestMapping("/insert")
	public ModelAndView Insert(@ModelAttribute BorderDTO dto,
											  @RequestParam("isbn") List<String> isbn
											 ,@RequestParam("status") List<Integer> status
											 ,@RequestParam("orderlist_cnt") List<Integer> orderlist_cnt
											, HttpSession session) {
		
		String s_id = (String)session.getAttribute("member_id"); 
		//String s_id = "kgukid38@naver.com";
		ModelAndView mav=new ModelAndView();
		String border_no = dateno();//생성한 주문번호 변수넣기
		
		int border_price=borderDao.border_price(s_id);
		//System.out.println(isbn);
		
		//dto에 총결제금액, 세션아이디 추가로 담기(수령인, 주소 등은 이미 dto에 담겨있음)
		dto.setBorder_no(border_no);
		dto.setBorder_price(border_price);
		dto.setMember_id(s_id);
		
		//border테이블에 행추가
		int cnt= borderDao.insert(dto);
		System.out.println("행추가결과" + cnt);
		
		if(cnt==1) {//order테이블에 행추가되면
			//orderForm에서 받아온 상품정보와 주문서번호를 orderlist테이블에 옮겨닮기
				//System.out.println("orderlist 행추가확인");
				
				//주문상품 각각의 정보를 넣을 list생성
				List<HashMap<String, Object>> orderlist = new ArrayList<>();
				
				//주문상품 각각의 정보를 map에 넣고 이것을 list에 넣기 
				for(int i =0 ; i < status.size() ; i++) {
					HashMap<String, Object> map = new HashMap<>();
					//map.put("s_id", s_id);
					map.put("border_no" , border_no);
					map.put("isbn", isbn.get(i));
					map.put("orderlist_cnt", orderlist_cnt.get(i));
					orderlist.add(i, map);					
				}//for end
		
			int result = 0;
			result = borderDao.orderlistInsert(orderlist);
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
		
		@RequestMapping("/msgView")
		public String msgView() {
			return "border/msgView";
		}//msgView() end
	}//class end
