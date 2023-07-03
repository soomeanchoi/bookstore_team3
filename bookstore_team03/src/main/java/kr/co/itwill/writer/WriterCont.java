package kr.co.itwill.writer;

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
@RequestMapping("/writer")
public class WriterCont {

    public WriterCont() {
        System.out.println("WriterCont()객체 생성됨");
    }//class end

    @Autowired
    WriterDAO writerDao;

    @RequestMapping("/write")
    public String write() {
        return "writer/write";
    }//write() end

    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
                        ,@RequestParam MultipartFile img
                        ,HttpServletRequest req) {

        String writer_imgname="-";
        long writer_imgsize=0;
        if(img != null && !img.isEmpty()) {
            writer_imgname=img.getOriginalFilename();
            writer_imgsize=img.getSize();
            try{
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");                //실제 경로
                img.transferTo(new File(path + "/" + writer_imgname));  //파일 저장
            }catch (Exception e) {
                e.printStackTrace(); //System.out.println();
            }
        }//if end

        map.put("writer_imgname", writer_imgname);
        map.put("writer_imgsize", writer_imgsize);

        writerDao.insert(map);

        return "redirect:/writer/writerList";

    }//insert() end


    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("writer/list");
        mav.addObject("list", writerDao.list());
        return mav;
    }//list() end

    @RequestMapping("/writerList")
    public ModelAndView totalList() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("writer/writerList");
        mav.addObject("writerList", writerDao.totalList());
        return mav;
    }//list() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String writer_name) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("writer/list");
        mav.addObject("list", writerDao.search(writer_name));
        mav.addObject("writer_name", writer_name); //검색어
        return mav;
    }//search() end

    @RequestMapping("/detail/{writer_no}")
    public ModelAndView detail(@PathVariable int writer_no) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("writer/detail");
        mav.addObject("writer", writerDao.detail(writer_no));
        return mav;
    }//detail() end

    @RequestMapping("/delete")
    public String delete(int writer_no, HttpServletRequest req) {

        //삭제하고자 하는 파일명
        String filename=writerDao.filename(writer_no);

        //첨부된 파일 삭제하기
        if(filename != null && !filename.equals("-")) {
        	ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage");  //실제 물리적인 경로
			File file=new File(path + "/" + filename);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end

        writerDao.delete(writer_no);

        return "redirect:/writer/writerList";

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
                img.transferTo(new File(path + "/" + filename));
            }catch (Exception e) {
                e.printStackTrace();
            }//try end
        }else{
            int writer_no=Integer.parseInt(map.get("writer_no").toString());
            Map<String, Object> writer=writerDao.detail(writer_no);
            filename=writer.get("writer_imgname").toString();
            filesize=Long.parseLong(writer.get("writer_imgsize").toString());
        }//if end

        map.put("writer_imgname", filename);
        map.put("writer_imgsize", filesize);
        writerDao.update(map);
        return "redirect:/writer/writerList";

    }//update() end

}//WriterCont end
