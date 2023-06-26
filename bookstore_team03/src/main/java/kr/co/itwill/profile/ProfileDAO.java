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
    
    public List<Map<String, Object>> detail(int profile_no) {
        return sqlSession.selectList("profile.detail", profile_no);
    }//detail() end
    
    /* Map을 dto로 받아도 안됨*/
    
    public List<Map<String, Object>> search(String profile_no) {
        return sqlSession.selectList("profile.search", "%" + profile_no + "%");
    }//search() end
    
    public String filename(String member_id) {
        return sqlSession.selectOne("profile.filename", member_id);
    }//filename() end

    public void delete(String member_id) {
        sqlSession.delete("profile.delete", member_id);
    }//delete() end

    public void update(Map<String, Object> map) {
        sqlSession.update("profile.update", map);
    }//update() end
    
}
