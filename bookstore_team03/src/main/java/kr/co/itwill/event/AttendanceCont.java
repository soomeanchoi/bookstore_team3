package kr.co.itwill.event;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/event")
public class AttendanceCont {

	public AttendanceCont() {
		System.out.println("----AttendanceCont() 객체생성");
	}//end
	
	@Autowired
	AttendanceDAO attendanceDao;
	
	@RequestMapping("/attendance")
	public ModelAndView attendance(HttpSession session) {
		
		//String s_id=session.getAttribute("s_id");
		String s_id="kgukid38@naver.com";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event/attendance");// /WEB-INF/cart/list.jap
		mav.addObject("attendance", attendanceDao.attendDate(s_id));
		
		int attendCnt = attendanceDao.attendCnt(s_id);
		mav.addObject("attendCnt", attendCnt);
		
		
		return mav;
	}//attendance end
	
	@RequestMapping("/makeAttend")
	public ModelAndView makeAttend(HttpSession session) {
		//String s_id=session.getAttribute("s_id");
		String s_id="kgukid38@naver.com";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event/attendance");// /WEB-INF/cart/list.jap
		
		//출석체크
		int attend = attendanceDao.attend(s_id);
		
		//출석이 된다면
		if(attend == 1) {
			System.out.println("출첵성공");
		}else{
			System.out.println("출첵실패");
		}//if end
		
		return mav;
	}//makeAttend()
	
}//class end
