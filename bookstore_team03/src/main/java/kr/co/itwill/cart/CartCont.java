package kr.co.itwill.cart;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/cart")
public class CartCont {
	public CartCont() {
        System.out.println("-----CartCont()객체 생성됨");
    }//class end
    
	@Autowired
	CartDAO cartDao;
	
	@RequestMapping("/insert")
	public String cartInsert(@ModelAttribute CartDTO dto, HttpSession session) throws Exception{
		
		//뷰페이지에서 넘긴 값은 id만 잘 일치시켰다면 dto로 각각 잘 들어감
		//로그인을 구현했다면 session.getAttribute()활용
		//String s_id = (String)session.getAttribute("member_id");
		String s_id="kgukid38@naver.com";
		dto.setMember_id(s_id);
		
		cartDao.cartInsert(dto);
		return "redirect:/cart/list";//장바구니 목록
	}//cartInsert() end
	
	@RequestMapping("/list")
    public ModelAndView list(HttpSession session) {
    	   	
    	//로그인 했다면
    	//String s_id = (String)session.getAttribute("member_id");
		String s_id="kgukid38@naver.com";
    	//System.out.println(session.getAttribute("s_id"));
    	
        ModelAndView mav=new ModelAndView();
        mav.setViewName("cart/list"); // /WEB-INF/views/cart/list.jsp
        mav.addObject("list", cartDao.cartList(s_id)); 
        return mav;
    }//list() end
	
	@RequestMapping("/delete")
	public String delete(int cart_no, HttpSession session) {
		//로그인 했다면
		//String s_id = (String)session.getAttribute("member_id");
		String s_id="kgukid38@naver.com";
    	
		HashMap<String, Object> map = new HashMap<>();
		map.put("cart_no", cart_no);
		map.put("s_id", s_id);
		//map.put("s_id", session.getAttribute("s_id"))
		
		cartDao.cartDelete(map);
		
		return "redirect:/cart/list";
	}//delete() end
	
}//class end
	
	
	

