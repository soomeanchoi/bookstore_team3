package kr.co.itwill.deliveryAdd;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.cart.CartDTO;

@Controller
@RequestMapping("/deliveryAdd")
public class DeliveryAddCont {

	public DeliveryAddCont() {
		System.out.println("----DeliveryAddCont()");
	}//end

	@Autowired
	DeliveryAddDAO deliveryAddDao;

	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		//로그인했다면
		String s_id = (String)session.getAttribute("member_id"); 

		//String s_id = "kgukid38@naver.com";//임시아이디

		ModelAndView mav = new ModelAndView();
		mav.setViewName("deliveryAdd/list");// /WEB-INF/cart/list.jap
		mav.addObject("list", deliveryAddDao.list(s_id));

		return mav;
	}//list() end

	@RequestMapping("/deliveryAddForm")
	public String deliveryAddform() {
		return "deliveryAdd/deliveryAddForm";
	}//end

	@RequestMapping("/insert")
	public String insert(@ModelAttribute DeliveryAddDTO dto, HttpSession session) {
		//로그인했다면
		String s_id = (String)session.getAttribute("member_id"); ;		
		//String s_id = "kgukid38@naver.com";//임시아이디

		dto.setMember_id(s_id);
		deliveryAddDao.insert(dto);
		//System.out.println("cont" + dto.toString());
		return "redirect:/deliveryAdd/list";
	}//insert() end

	@RequestMapping("/delete")
	public String delete(@ModelAttribute DeliveryAddDTO dto) {
		deliveryAddDao.delete(dto);//테이블 행 삭제
		return "redirect:/deliveryAdd/list";
	}//delete() end

	@RequestMapping("/delivUpdateForm/{deliv_no}")
	public ModelAndView detail(@ModelAttribute DeliveryAddDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deliveryAdd/delivUpdateForm");
		mav.addObject("detail", deliveryAddDao.detail(dto.getDeliv_no()));

		return mav;
	}//detail() end
	
	@RequestMapping("/update")
	public String update(@ModelAttribute DeliveryAddDTO dto) {
		System.out.println(dto.toString());
		deliveryAddDao.update(dto);
		return "redirect:/deliveryAdd/list";
	}//update() end
	
	//카트수정
		@RequestMapping("/defupdate")
		@ResponseBody
		public int defupate(HttpSession session, HttpServletRequest req) {
			String s_id = (String)session.getAttribute("member_id");
			//String s_id="kgukid38@naver.com";
			
			int cnt=0;
			int deliv_no = Integer.parseInt(req.getParameter("deliv_no"));
			
			DeliveryAddDTO dto = new DeliveryAddDTO();
			dto.setMember_id(s_id);
			dto.setDeliv_no(deliv_no);
			
			cnt = deliveryAddDao.defupdate(dto);

			return cnt;
		}//cartupate() end
}//class end
