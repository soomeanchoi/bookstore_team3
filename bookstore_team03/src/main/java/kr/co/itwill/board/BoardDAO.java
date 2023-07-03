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
	
	//로그인한 유저의 bbti_name 가져오기
	public String bbti_name(String s_id) {
		return sqlSession.selectOne("board.bbti_name", s_id);
	}//bbti_name()end
	
	//페이징 없는 리스트
	public List<HashMap<String, Object>> list(){
		return sqlSession.selectList("board.list");
	}//list end
	
	//페이징 : 총 글개수
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
	
	//bbti 페이징 : 총 글개수
	public int btotalRecord(String bbti_name) {
		return sqlSession.selectOne("board.btotalRecord", bbti_name);
	}//totalRecord() end
	
	//bbti 페이징 : 총 게시글
	public List<HashMap<String, Object>> bpaginglist(int start, int end, String bbti_name){
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("bbti_name", bbti_name);
		
		return sqlSession.selectList("board.bpaginglist", map);
	}//listBoard() end
	
	//페이징 : 검색된 총글개수
	public int stotalRecord(HashMap<String, Object> map) {
		return sqlSession.selectOne("board.stotalRecord", map);
	}//totalRecord() end
	
	//탭-페이징 : 검색된 총글개수
	public int bstotalRecord(HashMap<String, Object> map) {
		return sqlSession.selectOne("board.bstotalRecord", map);
	}//totalRecord() end
	
	//게시글 검색
	public List<HashMap<String, Object>> search(HashMap<String, Object> map){
		System.out.println("dao map: " + map);
		return sqlSession.selectList("board.search", map);
	}//search() end
	
	//탭-게시글 검색
	public List<HashMap<String, Object>> bsearch(HashMap<String, Object> map){
		return sqlSession.selectList("board.bsearch", map);
	}//search() end
	
	//게시글 상세보기
	public HashMap<String, Object> detail(int board_no) {
		//System.out.println(board_no);
		return sqlSession.selectOne("board.detail", board_no);
	}//detail() end
	
	//게시글에 유저가 선택한 책정보 불러오기
	public HashMap<String, Object> bookinfo(String isbn){
		return sqlSession.selectOne("board.bookinfo", isbn);
	}//bookinfo() end
	
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
	
	//게시글작성
	public int write(BoardDTO dto) {
		return sqlSession.insert("board.write", dto);
	}//write() end
	
	//글작성 도서검색 결과수
	public int wtotalRecord(HashMap<String, Object> map) {
		return sqlSession.selectOne("board.wtotalRecord", map);
	}//totalRecord() end
	
	//글작성 도서검색 결과
	public List<HashMap<String, Object>> wsearch(HashMap<String, Object> map){
		return sqlSession.selectList("board.wsearch", map);
	}//wsearch() end
	
	//게시글삭제
	public int delete(int board_no) {
		return sqlSession.delete("board.delete", board_no);
	}//delete() end
	
	public int update(BoardDTO dto) {
		return sqlSession.update("board.update", dto);
	}//update() end
	
}//class end
