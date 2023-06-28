package kr.co.itwill.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;





@Controller
@RequestMapping("/admin")
public class AdminCont {

	public AdminCont() {
        System.out.println("-----AdminCont()객체 생성됨");
    }//class end
	
	@Autowired
	AdminDAO adminDao;
	
	
	@RequestMapping("/list")
    public ModelAndView list() {
    	   	
    	//로그인 했다면
    	//String s_id=session.getAttribute("s_id")
    	String s_id="test"; //여기서는 임시 아이디 test
    	
        ModelAndView mav=new ModelAndView();
        mav.setViewName("admin/list"); // /WEB-INF/views/member/list.jsp
        mav.addObject("list", adminDao.List(s_id)); 
        return mav;
        
    }//list() end
	
	@RequestMapping("/droplist")
    public ModelAndView droplist() {
    	   	
    	//로그인 했다면
    	//String s_id=session.getAttribute("s_id")
    	String s_id="test"; //여기서는 임시 아이디 test
    	
        ModelAndView mav=new ModelAndView();
        mav.setViewName("admin/droplist"); // /WEB-INF/views/member/list.jsp
        mav.addObject("list", adminDao.dropList(s_id)); 
        return mav;
        
    }//list() end
	
}
