/*package kr.co.itwill.board;

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
	
	public List<BoardDTO> list(){
		return sqlSession.selectList("board.list");
	}//list end
	
	
}//class end
*/