package kr.co.itwill.book;

import kr.co.itwill.choice.ChoiceDAO;
import kr.co.itwill.review.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookCont {

    
    public BookCont(){
        System.out.println("BookCont()객체 생성됨");
    }//class end


    @Autowired
    BookDAO bookDao;
    @Autowired
    ChoiceDAO choiceDao;


    @RequestMapping("/write")
    public String write() {
        return "book/write";
    }//write() end

    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
                         , @RequestParam MultipartFile img
                         , HttpServletRequest req) {

        String book_imgname="-";
        long book_imgsize=0;
        if(img != null && !img.isEmpty()) {
            book_imgname=img.getOriginalFilename();
            book_imgsize=img.getSize();
            try{
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");                //실제 경로
                img.transferTo(new File(path + "\\" + book_imgname));  //파일 저장
            }catch (Exception e) {
                e.printStackTrace(); //System.out.println();
            }
        }//if end

        map.put("book_imgname", book_imgname);
        map.put("book_imgsize", book_imgsize);

        bookDao.insert(map);

        return "redirect:/book/list";

    }//insert() end

    @RequestMapping("/bestList")
    public ModelAndView bestList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/bestList");
        mav.addObject("list", bookDao.list());
        mav.addObject("bestList", bookDao.bestList());
        return mav;
    }//list() end

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(defaultValue = "book_price") String sort, @RequestParam(defaultValue = "1") int page, Map<String, Object> map) {
        String s_id="kgukid38@naver.com";
        map.put("member_id", s_id);

        ModelAndView mav=new ModelAndView();

        int totalCount = bookDao.bookCount();
        int pageSize = 10;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        int start = ((page - 1) * pageSize) ;
        int end = page * pageSize;

        int cnt = bookDao.choiceTable(map);
        if (cnt == 1){
            mav.addObject("cnt", cnt);
        }else if (cnt == 0){
            mav.addObject("cnt", cnt);
        }else {
            mav.addObject("cnt", cnt);
        }

        List<Map<String, Object>> list = bookDao.listPaging(start, end, sort);

        mav.setViewName("book/list");
        mav.addObject("bookPrice", sort);
        mav.addObject("totalPage", totalPage);
        mav.addObject("currentPage", page);
        mav.addObject("list", list);
//        mav.addObject("list", bookDao.list());
        mav.addObject("totalList", bookDao.totalList());
        mav.addObject("choiceTable", bookDao.choiceTable(map));

        return mav;
    }//list() end@RequestMapping("/list")


    // @RequestMapping("/list")
//    public ModelAndView list2(@RequestParam(defaultValue = "1") int page, Map<String, Object> map) {
//        String s_id="kgukid38@naver.com";
//        map.put("member_id", s_id);
//
//        ModelAndView mav=new ModelAndView();
//
//        int totalCount = bookDao.bookCount();
//
//
//        int pageSize = 10;
//        int totalPage = (int) Math.ceil((double) totalCount / pageSize);
//
//        int start = ((page - 1) * pageSize) + 1;
//        int end = page * pageSize;
//
//        List<Map<String, Object>> list = bookDao.listPaging(start, end);
//
//        mav.setViewName("book/list");
//
//        mav.addObject("list", list);
//        mav.addObject("totalPage", totalPage);
//        mav.addObject("currentPage", page);
//
////        mav.addObject("list", bookDao.list());
//        mav.addObject("totalList", bookDao.totalList());
//        mav.addObject("choiceTable", bookDao.choiceTable(map));
//
//
//        return mav;
//    }//list() end@RequestMapping("/list")


    @RequestMapping("/comicList")
    public ModelAndView comicList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/comicList");
        mav.addObject("comicList", bookDao.comicList());
        return mav;
    }//list() end

    @RequestMapping("/novelList")
    public ModelAndView novelList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/novelList");
        mav.addObject("novelList", bookDao.novelList());
        return mav;
    }//list() end

    @RequestMapping("/poemList")
    public ModelAndView poemList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/poemList");
        mav.addObject("poemList", bookDao.poemList());
        return mav;
    }//list() end

    @RequestMapping("/humanismList")
    public ModelAndView humanismList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/humanismList");
        mav.addObject("humanismList", bookDao.humanismList());
        return mav;
    }//list() end

    @RequestMapping("/techList")
    public ModelAndView techList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/techList");
        mav.addObject("techList", bookDao.techList());
        return mav;
    }//list() end

    @RequestMapping("/socialList")
    public ModelAndView socialList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/socialList");
        mav.addObject("socialList", bookDao.socialList());
        return mav;
    }//list() end

    @RequestMapping("/selfList")
    public ModelAndView selfList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/selfList");
        mav.addObject("selfList", bookDao.selfList());
        return mav;
    }//list() end

    @RequestMapping("/itList")
    public ModelAndView itList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/itList");
        mav.addObject("itList", bookDao.itList());
        return mav;
    }//list() end

    @RequestMapping("/testList")
    public ModelAndView testList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/testList");
        mav.addObject("testList", bookDao.testList());
        return mav;
    }//list() end

    @RequestMapping("/historyList")
    public ModelAndView historyList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/historyList");
        mav.addObject("historyList", bookDao.historyList());
        return mav;
    }//list() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String book_name) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/searchList");
        mav.addObject("totalList", bookDao.search(book_name));
        mav.addObject("book_name", book_name); //검색어
        return mav;
    }//search() end

    @RequestMapping("/detail/{isbn}")
    public ModelAndView detail(@PathVariable String isbn, @ModelAttribute ReviewDTO dto, Map<String ,Object> map) {
        String s_id="kgukid38@naver.com";
        map.put("isbn", isbn);
        map.put("member_id", s_id);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("book/detail");
        mav.addObject("book", bookDao.detail(isbn));
        bookDao.count(isbn);
        mav.addObject("score", bookDao.reviewScore(isbn));
        mav.addObject("reviewCount", bookDao.reviewCount(dto));

        int cnt = bookDao.choiceTable(map);
        if (cnt == 1){
            mav.addObject("cnt", cnt);
        }else if (cnt == 0){
            mav.addObject("cnt", cnt);
        }else {
            mav.addObject("cnt", cnt);
        }
        return mav;
    }//detail() end

    @RequestMapping("/detail2/{isbn}")
    public ModelAndView detail2(@PathVariable String isbn, @ModelAttribute ReviewDTO dto) {
        ModelAndView mav = new ModelAndView();
        ReviewDTO review=new ReviewDTO();
        mav.setViewName("book/detail2");
        mav.addObject("book", bookDao.detail(isbn));
        bookDao.count(isbn);
        mav.addObject("score",bookDao.reviewScore(isbn));
        mav.addObject("reviewCount", bookDao.reviewCount(dto));
        return mav;
    }//detail() end

    @RequestMapping("/delete")
    public String delete(String isbn, HttpServletRequest req) {
        System.out.println("isbn = " + isbn);
        //삭제하고자 하는 파일명
        String filename=bookDao.filename(isbn);

        //첨부된 파일 삭제하기
        if(filename != null && !filename.equals("-")) {
            ServletContext application=req.getSession().getServletContext();
            String path=application.getRealPath("/storage");
            File file=new File(path + "\\" + filename);
            if(file.exists()) {
                file.delete();
            }//if end
        }//if end

        bookDao.delete(isbn);

        return "redirect:/book/list";

    }//delete() end

    @RequestMapping("/update")
    public String update(@RequestParam Map<String, Object> map
                        ,@RequestParam MultipartFile img
                        ,HttpServletRequest req) {

        String filename="-";
        long filesize=0;
        if(img != null && !img.isEmpty()) {
            filename=img.getOriginalFilename();
            filesize=img.getSize();
            try{
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");
                img.transferTo(new File(path + "\\" + filename));
            }catch (Exception e) {
                e.printStackTrace();
            }//try end
        }else{
            String isbn=map.get("isbn").toString();
            Map<String, Object> book=bookDao.detail(isbn);
            filename=book.get("book_imgname").toString();
            filesize=Long.parseLong(book.get("book_imgsize").toString());
        }//if end

            map.put("book_imgname", filename);
            map.put("book_imgsize", filesize);
            bookDao.update(map);
            return "redirect:/book/list";

        }//update() end


}//BookCont end
