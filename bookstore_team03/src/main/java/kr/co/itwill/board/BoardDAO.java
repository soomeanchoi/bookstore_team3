package kr.co.itwill.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class BoardDAO {
	
	public BoardDAO() {
		System.out.println("----BoardDAO() 객체생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<HashMap<String, Object>> list(){
		return sqlSession.selectList("board.list");
	}//list end
	
	//댓글개수 가져오기
	public int replylist(int board_no){
		return sqlSession.selectOne("board.replylist", board_no);
	}//replylist() end
	
	//게시글 상세보기
	public HashMap<String, Object> detail(int board_no) {
		//System.out.println(board_no);
		return sqlSession.selectOne("board.detail", board_no);
	}//detail() end
	
	//글쓰기폼에 유저아이디, 닉네임, bbti불러오기
	public HashMap<String, Object> userinfo(String s_id){
		return sqlSession.selectOne("board.userinfo", s_id);
	}//userinfo() end
	
	public int write(BoardDTO dto) {
		return sqlSession.insert("board.write", dto);
	}//write() end
	
	public int delete(int board_no) {
		return sqlSession.delete("board.delete", board_no);
	}
	
}//class end
