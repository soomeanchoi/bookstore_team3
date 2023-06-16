package kr.co.itwill.choice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/choice")
public class ChoiceCont {

    public ChoiceCont() {
        System.out.println("ChoiceCont()객체 생성됨");
    }//end

    @Autowired
    ChoiceDAO choiceDao;

    @RequestMapping("/insert")
    public String choiceInsert(@ModelAttribute ChoiceDTO dto, HttpSession session) throws Exception {
        //dto.setMember_id(session.getAttribute("smember_id"));
        dto.setMember_id("test@naver.com");

        choiceDao.choiceInsert(dto);

        return "redirect:/choice/list";

    }//choiceInsert() end

    @RequestMapping("/list")
    public ModelAndView list(HttpSession session) {
        //String smember_id=session.getAttribute("smember_id");
        String smember_id="test@naver.com";

        ModelAndView mav=new ModelAndView();
        mav.setViewName("choice/list");
        mav.addObject("list", choiceDao.choicelist(smember_id));
        return mav;
    }//list() end

    @RequestMapping("/delete")
    public String delete(int choice_no, HttpSession session) {

        HashMap<String, Object> map=new HashMap<>();
        map.put("choice_no", choice_no);
        map.put("smember_id", "test@naver.com");
        choiceDao.choiceDelete(map);

        return "redirect:/choice/list";

    }//delete() end

}//ChoiceCont() end
