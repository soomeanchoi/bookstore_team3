package kr.co.itwill.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;

@Repository
public class MemberDAO {

	public MemberDAO() {
		System.out.println("-----MemberDAO() 객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
   
    
    
    public int insert(MemberDTO dto) {
    	return sqlSession.insert("member.insert", dto);
    }
    
    public HashMap<String, String> loginMember(HashMap<String, String> loginInfo) {
        return sqlSession.selectOne("member.logindo", loginInfo);
    }
    
    public String update(MemberDTO dto) {
    	return sqlSession.selectOne("member.update" , dto);
    }
    
    public int delete(MemberDTO dto) {
    	return sqlSession.delete("member.delete", dto);
    }
    
    public int checkId(String member_id) {
    	return sqlSession.selectOne("member.checkId" , member_id);
    }
    public List<String> profilelist(String member_id) {return sqlSession.selectList("member.profilelist", member_id);}
}
