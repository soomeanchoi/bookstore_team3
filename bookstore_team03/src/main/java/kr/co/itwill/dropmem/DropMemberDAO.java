package kr.co.itwill.dropmem;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;

@Repository
public class DropMemberDAO {

	public DropMemberDAO() {
		System.out.println("-----DropMemberDAO() 객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
    
    
    
}
