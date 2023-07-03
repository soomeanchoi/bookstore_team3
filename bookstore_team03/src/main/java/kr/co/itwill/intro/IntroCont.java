package kr.co.itwill.intro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IntroCont {

    public IntroCont(){
        System.out.println("IntroCont()객체 생성됨");
    }//class end

    @Autowired
    IntroDAO introDao;

    @RequestMapping("/")
    public ModelAndView intro(HttpSession session) {
        String s_id=(String)session.getAttribute("member_id");


        ModelAndView mav=new ModelAndView();
        mav.setViewName("index");
        mav.addObject("s_id", s_id);
        mav.addObject("bestList", introDao.bestList());
        mav.addObject("todayList", introDao.todayList());
        mav.addObject("todayWriter", introDao.todayWriter());
        mav.addObject("reviewList", introDao.reviewList());
        mav.addObject("recentReview", introDao.recentReview());
        mav.addObject("recentList", introDao.recentList());
        mav.addObject("profile", introDao.profile());
        mav.addObject("bbti", introDao.bbti(s_id));
        mav.addObject("randList", introDao.randList());
        return mav;

    }//list() end

    @RequestMapping("/test")
    public ModelAndView blog() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("template/template");
        return mav;
    }



}
