package kr.co.itwill.booktag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/booktag")
public class BookTagCont {

    public BookTagCont() {
        System.out.println("BookTagCont()객체 생성됨");
    }//class end

    @Autowired
    BookTagDAO booktagDao;

    @RequestMapping("/write")
    public String write() {
        return "booktag/write";
    }//write() end

    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map) {

        booktagDao.insert(map);

        return "redirect:/booktag/list";
    }//insert() end

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("booktag/list");
        mav.addObject("list", booktagDao.list());
        return mav;
    }//list() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String tag_name) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("booktag/list");
        mav.addObject("list", booktagDao.search(tag_name));
        mav.addObject("tag_name", tag_name); //검색어
        return mav;
    }//search() end

    @RequestMapping("/detail/{tag_no}")
    public ModelAndView detail(@PathVariable int tag_no) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("booktag/detail");
        mav.addObject("tag", booktagDao.detail(tag_no));
        return mav;
    }//detail() end

    @RequestMapping("/delete")
    public String delete(int tag_no) {

        booktagDao.delete(tag_no);

        return "redirect:/booktag/list";

    }//delete() end

    @RequestMapping("/update")
    public String update(@RequestParam Map<String, Object> map) {

        booktagDao.update(map);

        return "redirect:/booktag/list";

    }//update() end

}//BookTagCont() end
