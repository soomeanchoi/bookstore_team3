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
	
	//출석현황조회
	@RequestMapping("/attendance")
	public ModelAndView attendance(HttpSession session) {
		
		//String s_id=session.getAttribute("s_id");
		String s_id="kgukid38@naver.com";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event/attendance");// /WEB-INF/cart/list.jap
		mav.addObject("attendance", attendanceDao.attendDate(s_id));
		
		//출석횟수조회
		int attendCnt = attendanceDao.attendCnt(s_id);
		System.out.println(mav);
		mav.addObject("attendCnt", attendCnt);
		
		return mav;
	}//attendance end
	
	//출석하기 >> 출석기록 행추가
	@RequestMapping("/makeAttend")
	public String makeAttend(HttpSession session) {
		System.out.println("makeAttend호출");
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
		
		return "redirect:/event/attendance";
	}//makeAttend()
	
	public int check() {
		return 1;
	}// 
	
	//월요일마다 테이블 초기화
	public void resetAttend() {
		//System.out.println("호출됨");
		int resetCnt = attendanceDao.resetAttend();
		
		/*
		if(resetCnt != 0) {
			System.out.println("attendance 테이블 초기화됨");
		}else {
			System.out.println("attendance 테이블 초기화 안됨");
		}//if end
		*/	
		}//resetAttend() end
	
}//class end
