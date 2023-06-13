package kr.co.itwill.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;

@Repository
public class MemberDAO {

	public MemberDAO() {
		System.out.println("------MemberDAO() 객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
    

    //public List<Map<String, Object>> list(){
    ///	return sqlSession.selectList("member.list");
    //}//list() end
	
    public List<MemberDTO> cartList(String id){
        return sqlSession.selectList("member.list", id);
    }//list() end
    
    public int insert(MemberDTO dto) {
    	return sqlSession.insert("member.insert", dto);
    }

}
