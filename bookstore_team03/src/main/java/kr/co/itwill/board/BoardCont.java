package kr.co.itwill.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardCont {
	
	public BoardCont() {
		System.out.println("----BoardCont()객체생성");
	}//end
	
	@Autowired
	BoardDAO boardDao;
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		
		List<HashMap<String, Object>> list = new ArrayList<>();
		list = boardDao.list();
        mav.setViewName("board/list");
        
        //댓개수
        for (int i=0 ; i < list.size() ; i++) {
        	HashMap<String, Object> hashMap = new HashMap<>();
        	hashMap = list.get(i);
        	Object replycnt=null;
        	
        	for (Map.Entry<String, Object> entry : hashMap.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
               
                if(key.equals("board_no")) {
                	 replycnt = boardDao.replylist((int)value);
                }//if end
            }//for end	
        	hashMap.put("replycnt", replycnt);
        }//for end
        mav.addObject("list", list);
        return mav;
	}//list() end
	
	@RequestMapping("/detail/{board_no}")
	public ModelAndView detail(@PathVariable int board_no) {
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/detail");
        mav.addObject("detail", boardDao.detail(board_no));
        return mav;
	}//detail() end
	
	//글쓰기창에 유저정보 불러오기
	@RequestMapping("/boardForm")
	public ModelAndView boardForm(HttpSession session){
		//String s_id = session.getAttribute("s_id"); 
		String s_id = "kgukid38@naver.com";
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/boardForm");
        
        mav.addObject("userinfo", boardDao.userinfo(s_id));
		return mav;
	}//boardForm end
	
	
	@RequestMapping("/write")
    public String write(@ModelAttribute BoardDTO dto) {
		int cnt = boardDao.write(dto);
		if(cnt==1) {
			System.out.println("글추가성공");
			return "redirect:/board/list";
		}//if end
		System.out.println("글추가실패");
		return "redirect:/board/boardForm";
    }//write() end
	
	/*//게시글삭제
	@RequestMapping("/delete/{board_no}")
	public String delete(@PathVariable int board_no) {
	    boardDao.delete(board_no);
	    return "redirect:/board/list";
	}//delete() end
	
	//게시글수정
	@RequestMapping("/update/{board_no}")
	public String update(@PathVariable int board_no
						,@RequestParam Map<String, Object> map) {
	
	        boardDao.update(map);
	        return "redirect:/board/list";
	
	    }//update() end
	*/	
}//class end
