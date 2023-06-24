package kr.co.itwill.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	public BoardDAO() {
		System.out.println("----BoardDAO() 객체생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	//페이징 없는 리스트
	public List<HashMap<String, Object>> list(){
		return sqlSession.selectList("board.list");
	}//list end
	
	//페이징관련 총 글개수 가져오기
	public int totalRecord() {
		return sqlSession.selectOne("board.totalRecord");
	}//totalRecord() end
	
	//페이징관련 시작/끝레코드 가져오기
	public List<HashMap<String, Object>> paginglist(int start, int end){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.paginglist", map);
	}//listBoard() end
	
	//댓글개수 가져오기
	public int replylist(int board_no){
		return sqlSession.selectOne("board.replylist", board_no);
	}//replylist() end
	
	//게시글 상세보기
	public HashMap<String, Object> detail(int board_no) {
		//System.out.println(board_no);
		return sqlSession.selectOne("board.detail", board_no);
	}//detail() end
	
	//게시글에 유저가 선택한 책정보 불러오기
	public HashMap<String, Object> bookinfo(String isbn){
		return sqlSession.selectOne("board.bookinfo", isbn);
	}//bookinfo() end
	
	
	//책검색
	/*public List<String> search(String keyword){
		return sqlSession.selectList(keyword);
	}//search() end
	*/	
	//게시글 조회수
	public void board_read(int board_no) {
		sqlSession.update("board.board_read", board_no);
	}//board_read() end
	
	//좋아요
	public void board_good(int board_no) {
		sqlSession.update("board.board_good", board_no);
	}//board_good() end
	
	//글쓰기폼에 유저아이디, 닉네임, bbti불러오기
	public HashMap<String, Object> userinfo(String s_id){
		return sqlSession.selectOne("board.userinfo", s_id);
	}//userinfo() end
	
	public int write(BoardDTO dto) {
		return sqlSession.insert("board.write", dto);
	}//write() end
	
	public int delete(int board_no) {
		return sqlSession.delete("board.delete", board_no);
	}//delete() end
	
	public int update(BoardDTO dto) {
		return sqlSession.update("board.update", dto);
	}//update() end
	
}//class end
