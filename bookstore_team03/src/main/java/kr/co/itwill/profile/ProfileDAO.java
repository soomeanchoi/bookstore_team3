package kr.co.itwill.profile;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;

@Repository
public class ProfileDAO {

	public ProfileDAO() {
		System.out.println("-----ProfileDAO()객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
    
    public int insert(Map<String, Object> map) {
    	return sqlSession.insert("profile.insert", map);
    }
    
    public Map<String, Object> list(String member_id){
    	return sqlSession.selectOne("profile.list", member_id);
    }//list() end
     
    /*
    public List<ProfileDTO> List(String member_id){
        return sqlSession.selectList("profile.list", member_id);
    }//list() end
    */
    
    public Map<String, Object> detail(String member_id) {
        return sqlSession.selectOne("profile.detail", member_id);
    }//detail() end
}
