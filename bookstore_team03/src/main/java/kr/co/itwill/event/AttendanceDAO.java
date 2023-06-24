package kr.co.itwill.event;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendanceDAO {
	public AttendanceDAO() {
		System.out.println("----AttendanceDAO()객체생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<HashMap<String, Object>> attendDate(String s_id){
		return sqlSession.selectList("attendance.attendance", s_id);
	}//attendDate() end
	
	public int attend(String s_id) {
		return sqlSession.insert("attendance.attend", s_id);
	}//makeAttend() end
	
	public int attendCnt(String s_id) {
		return sqlSession.selectOne("attendance.attendCnt", s_id);
	}//attendCnt() end
	
	//매주 월요일 테이블 전체행삭제
	public int resetAttend() {
		return sqlSession.delete("attendance.resetAttend");
	}//resetAttend()
}//class end
