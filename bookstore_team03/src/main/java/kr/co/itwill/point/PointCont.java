package kr.co.itwill.point;

import kr.co.itwill.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/point")
public class PointCont {
    public PointCont() {
        System.out.println("----PointCont()객체 생성됨");
    }

    @Autowired
    PointDAO pointDAO;

    @RequestMapping("/list")
    public ModelAndView list(@ModelAttribute PointDTO dto, HttpSession session){

        //로그인 했다면
        String s_id = (String) session.getAttribute("member_id");
//        String s_id="kgukid38@naver.com"; //여기서는 임시 아이디 test

        ModelAndView mav = new ModelAndView();

        System.out.println("s_id = " + s_id);

//        dto.setMember_id(s_id);

        mav.setViewName("point/list"); // /WEB-INF/views/cart/list.jsp
        mav.addObject("total", pointDAO.totalPoint(s_id));
        mav.addObject("s_id", s_id);
        mav.addObject("plus", pointDAO.plusList(s_id));
        mav.addObject("minus", pointDAO.minusList(s_id));


        return mav;
    }


}
