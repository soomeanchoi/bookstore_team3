package kr.co.itwill.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardCont {
	public static int pageSize=5;
	public static int totalRecord=0;
	public static int totalPage=1;
	
	public BoardCont() {
		System.out.println("----BoardCont()객체생성");
	}//end
	
	@Autowired
	BoardDAO boardDao;
	
	
	//페이징 있음
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="pageNum", defaultValue="1") int pageNum) {
	
	//총 게시글개수
	int totalRecord = boardDao.totalRecord();
	int totalPage = totalRecord / pageSize;
	if(totalRecord%pageSize!=0) {
		totalPage++;
	}//if end
	
	System.out.println("pageNum" + pageNum);
	
	int start = (pageNum -1) * pageSize + 1;
	int end = start +pageSize - 1;
	System.out.println("시작레코드" + start);
	System.out.println("end" + end);
	
	List<HashMap<String, Object>> list = new ArrayList<>();
	list = boardDao.list();
	ModelAndView mav = new ModelAndView();
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
	
	mav.addObject("list", boardDao.paginglist(start, end));
	mav.addObject("totalPage", totalPage);
	
	return mav;
	}//list2 end
	/*
	//페이징 없음
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
	*/
	
	@RequestMapping("/detail/{board_no}")
	public ModelAndView detail(@PathVariable int board_no) {
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/detail");
        mav.addObject("detail", boardDao.detail(board_no));
        
        //유저가 선택한 책정보 추가
        String isbn = (String)boardDao.detail(board_no).get("isbn");
        mav.addObject("bookinfo", boardDao.bookinfo(isbn));
        
        //조회수증가
        boardDao.board_read(board_no);
        return mav;
	}//detail() end
	
	@RequestMapping("/good/{board_no}")
	public String good(@PathVariable int board_no) {
		boardDao.board_good(board_no);
		return "redirect:/board/detail/"+ board_no;
	}//good() end
	
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
	
	///////////책검색////////////////////////////////////////////
		
	
	 @RequestMapping("/booksend")
	@ResponseBody
	public String bookSend(HttpServletRequest req) {
		//요청한 정보 가져오기
		int bookIndex=Integer.parseInt(req.getParameter("book"));
		
	    String img[]= {"spring.jpg","android.jpg","jquery.jpg","jsmasterbook.jpg"};
	    
	    return img[bookIndex]; //응답메세지
	}//bookSend() end
	///////////////////////////////////////////////////////////////////////////////
		/*
		@RequestMapping("/searchform")
		public String bookSearch() {
		    return "board/boardForm";
		}//bookSearch() end
		
		
		@RequestMapping("/boardForm/searchproc")
		@ResponseBody
		public ModelAndView searchProc(HttpServletRequest req) {
			System.out.println("searchproc");
			ModelAndView mav = new ModelAndView();
			String keyword=req.getParameter("keyword").trim();
			
			mav.setViewName("/board/boardForm");
			if(keyword.length()>0) { //검색어가 존재하는지? 
				//검색한 키워드가 들어간 자료를 list에 넣음
				List<String> list=search(keyword);
				mav.addObject("search", list);
			}//if end   
			//검색결과반환
			return mav;
		}//searchProc() end
		
		@RequestMapping("/boardForm/search")
		@ResponseBody
		public List<String> search(String keyword) {
			//검색기능
			//검색어 키워드가 들어간 자료 디비에서 조회해 옴
			List<String> list=new ArrayList<>();
			list = boardDao.search(keyword);
			System.out.println(list);
			return list;
		}//search() end
			*/
	///////////////////////////////////////////
	
	
	//게시글삭제
	@RequestMapping("/delete/{board_no}")
	public String delete(@PathVariable int board_no) {
	    boardDao.delete(board_no);
	    return "redirect:/board/list";
	}//delete() end
	
	
	//게시글수정폼
	@RequestMapping("/boardUpForm/{board_no}")
	public ModelAndView boardUpForm(@PathVariable int board_no
							, @ModelAttribute BoardDTO dto) {
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/boardUpForm");
		
        //수정폼에 기존내용 불러오기
        mav.addObject("detail", boardDao.detail(board_no));
        
	    return mav;
	    }//boardUpForm() end
	
	@RequestMapping("/boardUpForm/update")
	public String update(@ModelAttribute BoardDTO dto) {
        
		//System.out.println(dto.getBoard_no());
		
		int cnt = boardDao.update(dto);
		if(cnt!=0) {
			System.out.println("글수정성공");
			return "redirect:/board/detail/" + dto.getBoard_no();
		}else{
			System.out.println("글수정실패");
			return "redirect:/board/boardUpForm/" + dto.getBoard_no();
		}//if end
		
	}//update() end
	
	
		
}//class end
