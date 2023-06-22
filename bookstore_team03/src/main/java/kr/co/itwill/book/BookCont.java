package kr.co.itwill.book;

import kr.co.itwill.choice.ChoiceDAO;
import kr.co.itwill.review.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
    public ModelAndView list() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/list");
        mav.addObject("list", bookDao.list());
        mav.addObject("bestList", bookDao.bestList());
        return mav;
    }//list() end

    @RequestMapping("/list2")
    public ModelAndView list2() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/list2");
        mav.addObject("list", bookDao.list());
        mav.addObject("bestList", bookDao.bestList());
        return mav;
    }//list() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String book_name) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/list");
        mav.addObject("list", bookDao.search(book_name));
        mav.addObject("book_name", book_name); //검색어
        return mav;
    }//search() end

    @RequestMapping("/detail/{isbn}")
    public ModelAndView detail(@PathVariable String isbn) {
        ModelAndView mav = new ModelAndView();
        ReviewDTO review=new ReviewDTO();
        mav.setViewName("book/detail");
        mav.addObject("book", bookDao.detail(isbn));
        bookDao.count(isbn);
        mav.addObject("score",bookDao.reviewScore(isbn));
        mav.addObject("reviewCount", bookDao.reviewCount(isbn));
        System.out.println(mav);
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
