package kr.co.itwill.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;

@Repository
public class MemberDAO {

	public MemberDAO() {
		System.out.println("-----MemberDAO() 객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
   
    public List<MemberDTO> List(String member_id){
        return sqlSession.selectList("member.list", member_id);
    }//list() end
    
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
    
    public int deleteProfile(MemberDTO dto) {
    	return sqlSession.delete("profile.delete", dto);
    }
    
    public int idCheck(String member_id) {
    	return sqlSession.selectOne("member.idCheck" , member_id);
    }
    
    public int dropinsert(MemberDTO dto) {
    	return sqlSession.insert("member.dropinsert", dto);
    }
    
    public List<String> profilelist(String member_id) {
    	return sqlSession.selectList("member.profilelist", member_id);
    }

    public String findId(@Param("member_name") String member_name, @Param("member_phone") String member_phone) {
    	Map<String, String> params = new HashMap<>();
        params.put("member_name", member_name);
        params.put("member_phone", member_phone);
        return sqlSession.selectOne("member.findId", params);
    }

    public String findPw(@Param("member_name") String member_name, @Param("member_id") String member_id) {
    	Map<String, String> params = new HashMap<>();
        params.put("member_name", member_name);
        params.put("member_id", member_id);
        return sqlSession.selectOne("member.findPw", params);
    }
    
	public int updatePw(MemberDTO dto) {
		return sqlSession.update("member.updatePw", dto);
	}
	
	//dto가 없어서 map으로 가져와야함 여기에 review랑 tag를 가져온다 
	public List<Map<String, Object>> taglist(String member_id) {
		return sqlSession.selectList("member.mytag", member_id);
	}
	
	public List<Map<String, Object>> reviewlist(String member_id) {
		return sqlSession.selectList("member.myreview", member_id);
	}
	
	public List<Map<String, Object>> orderlist(String member_id) {
		return sqlSession.selectList("member.myorder", member_id);
	}
	
	public List<MemberDTO> bookname(String member_id) {
		return sqlSession.selectList("member.book" , member_id);
	}
	
	public List<MemberDTO> myboard(String member_id) {
		return sqlSession.selectList("member.myboard" , member_id);
	}
	public int profileinsert(String member_id) {
		return sqlSession.insert("member.profileinsert", member_id);
	}
	
	public List<MemberDTO> mybbti(String member_id) {
		return sqlSession.selectList("member.mybbti" , member_id);
	}
	
	
	
	
}
