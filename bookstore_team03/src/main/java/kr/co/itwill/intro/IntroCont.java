package kr.co.itwill.intro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IntroCont {

    public IntroCont(){
        System.out.println("IntroCont()객체 생성됨");
    }//class end

    @Autowired
    IntroDAO introDao;

    @RequestMapping("/")
    public ModelAndView intro() {

        ModelAndView mav=new ModelAndView();
        mav.setViewName("index");
        mav.addObject("bestList", introDao.bestList());
        mav.addObject("todayList", introDao.todayList());
        mav.addObject("todayWriter", introDao.todayWriter());
        mav.addObject("reviewList", introDao.reviewList());
        mav.addObject("recentReview", introDao.recentReview());
        return mav;

    }//list() end

    @RequestMapping("/test")
    public ModelAndView blog() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("template/template");
        return mav;
    }



}
