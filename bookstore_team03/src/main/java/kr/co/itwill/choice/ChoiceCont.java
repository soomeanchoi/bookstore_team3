package kr.co.itwill.choice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String choiceInsert(@ModelAttribute ChoiceDTO dto, HttpSession session, @RequestParam("isbn")String isbn) throws Exception {
        //dto.setMember_id(session.getAttribute("smember_id"));
        dto.setMember_id("kgukid38@naver.com");
        dto.setIsbn(isbn);

        System.out.println("isbn = " + isbn);

        choiceDao.choiceInsert(dto);

        return "redirect:/choice/list";

//        return null;

    }//choiceInsert() end

    @RequestMapping("/list")
    public ModelAndView list(HttpSession session) {
        //String smember_id=session.getAttribute("smember_id");
        String smember_id="kgukid38@naver.com";

        ModelAndView mav=new ModelAndView();
        mav.setViewName("choice/list");
        mav.addObject("list", choiceDao.choicelist(smember_id));
        return mav;
    }//list() end

    @RequestMapping("/list2")
    public ModelAndView list2(HttpSession session) {
        //String smember_id=session.getAttribute("smember_id");
        String smember_id="kgukid38@naver.com";

        ModelAndView mav=new ModelAndView();
        mav.setViewName("choice/list2");
        mav.addObject("list", choiceDao.choicelist(smember_id));
        return mav;
    }//list() end

    @RequestMapping("/delete")
    public String delete(int choice_no, HttpSession session) {

        HashMap<String, Object> map=new HashMap<>();
        map.put("choice_no", choice_no);
        map.put("smember_id", "kgukid38@naver.com");
        choiceDao.choiceDelete(map);

        return "redirect:/choice/list";

    }//delete() end

    @RequestMapping("/del")
    public String choiceDel(@ModelAttribute ChoiceDTO dto, HttpSession session ,@RequestParam("isbn") String isbn) throws Exception {
//        dto.setMember_id(session.getAttribute("smember_id"));

//        System.out.println("isbn = " + isbn);

        dto.setMember_id("kgukid38@naver.com");
        dto.setIsbn(isbn);
//        System.out.println(dto.getIsbn());
//        System.out.println(dto.getMember_id());
        choiceDao.choiceDel(dto);

        return "redirect:/book/list/";

//        return null;

    }//choiceInsert() end

}//ChoiceCont() end
