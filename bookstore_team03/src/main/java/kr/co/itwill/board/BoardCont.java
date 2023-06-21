/*package kr.co.itwill.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardCont {
	
	public BoardCont() {
		System.out.println("----BoardCont()객체생성");
	}//end
	
	@Autowired
	BoardDAO boardDao;
	
	@RequestMapping("/list")
	public ModelAndView list() {
		
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/list");
       // mav.addObject("list", boardDao.list());
        return mav;
	}//list() end
	
}//class end
*/