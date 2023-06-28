package kr.co.itwill.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.dropmem.DropMemberDTO;
import kr.co.itwill.member.MemberDTO;

@Repository
public class AdminDAO {

	public AdminDAO() {
		System.out.println("-----AdminDAO() 객체 생성됨");
	}
	
	//스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;
   
	
	public List<MemberDTO> List(String id){
        return sqlSession.selectList("admin.list", id);
    }//list() end
	
	public List<MemberDTO> dropList(String id){
        return sqlSession.selectList("admin.droplist", id);
    }//list() end
	
}
