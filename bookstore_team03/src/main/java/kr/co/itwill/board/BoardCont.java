package kr.co.itwill.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
//메인병합확인용
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

	//페이징
	//총 주문내역개수
	int pageSize=5;
	int totalRecord=0;
	int totalPage=1;
		
	//총 게시글개수
	totalRecord = boardDao.totalRecord();
	
	if((double)totalRecord % (double)totalPage == 0 ) {
		totalPage = totalRecord / pageSize;
	}else {
		totalPage = totalRecord / pageSize +1;
	}//if end
	
	int start = (pageNum -1) * pageSize;
	int end = pageSize;
	
	ModelAndView mav = new ModelAndView();
	mav.setViewName("board/list");
	
    //총 게시글
    mav.addObject("totalRecord",  totalRecord);
    
    //1~5개의 게시글 불러오기
	mav.addObject("list", boardDao.paginglist(start, end));
	
	//총 페이지수
	mav.addObject("totalPage", totalPage);
	
	return mav;
	}//list end
	
	//게시글 상세보기
	@RequestMapping("/detail/{board_no}")
	public ModelAndView detail(@PathVariable int board_no, HttpSession session) {
		String s_id = (String)session.getAttribute("member_id"); 
		//String s_id = "kgukid38@naver.com";
		
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/detail");
        mav.addObject("detail", boardDao.detail(board_no));
        mav.addObject("s_id", s_id);
        //유저가 선택한 책정보 추가
        String isbn = (String)boardDao.detail(board_no).get("isbn");
        mav.addObject("bookinfo", boardDao.bookinfo(isbn));
        
        //조회수증가
        boardDao.board_read(board_no);
        return mav;
	}//detail() end
	
	//좋아요
	@RequestMapping("/good/{board_no}")
	public String good(@PathVariable int board_no) {
		boardDao.board_good(board_no);
		return "redirect:/board/detail/"+ board_no;
	}//good() end
	
	//글쓰기창에 유저정보 불러오기
	@RequestMapping("/boardForm")
	public ModelAndView boardForm(HttpSession session){
		String s_id = (String)session.getAttribute("member_id"); 
		//String s_id = "kgukid38@naver.com";
		ModelAndView mav=new ModelAndView();
        mav.setViewName("board/boardForm");
        mav.addObject("userinfo", boardDao.userinfo(s_id));
		return mav;
	}//boardForm end
	
	//게시글작성
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
	
	//게시글검색
	@RequestMapping("/search")    //defaultValue : 후행하는 매개변수의 기본값 설정(여기서는 빈값)
	 public ModelAndView search(@RequestParam(value="pageNum", defaultValue="1") int pageNum
			 				   ,@RequestParam(value="keyWord", defaultValue = "") String keyWord
			 				   ,@RequestParam(value="category") String category) {
		System.out.println(category);
		//페이징관련
		int pageSize=5;
		int totalRecord=0;
		int totalPage=1;
		
		//페이지개수
		if((double)totalRecord % (double)totalPage == 0 ) {
			totalPage = totalRecord / pageSize;
		}else {
			totalPage = totalRecord / pageSize +1;
		}//if end
		
		//최상단글순서
		int start = (pageNum -1) * pageSize;
		
		//보여줄 글개수
		int end = pageSize;
		
		//검색정보 map에 넣기
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
	    map.put("keyWord", keyWord);
	    map.put("start", start);
		map.put("end", end);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		
		//총 검색 게시글개수
		totalRecord = boardDao.stotalRecord(map);
		
	    //검색된 모든 게시글 수 보내기
	    mav.addObject("totalRecord",  totalRecord);
	    
		//총 페이지수
		mav.addObject("totalPage", totalPage);
				
		//검색결과리스트
		mav.addObject("list", boardDao.search(map));
		
		//검색된 단어 보내기
		mav.addObject("keyWord", keyWord);
		return mav;
	}//search() end
		 	
	
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
