package kr.co.itwill.border;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.border.BorderDTO;

@Repository
public class BorderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public BorderDAO() {
		System.out.println("----BorderDAO()객체생성");
	}//end
	
	//주문번호생성위한중복개수조회
	public String dateno(String border_date) {
		return sqlSession.selectOne("border.border_date", border_date);
	}//dateno() end
	
	//totalamount(총가격)
	public int totalamount(String s_id) {
		return sqlSession.selectOne("order.totalamount", s_id);
	}//totalamount() end
	
	public int orderlistInsert(BorderDTO dto) {
		return sqlSession.insert("border.insert" , dto);
	}//orderUpdate() end
	
	public int orderdetailInsert(HashMap<String, String> map) {
		return sqlSession.insert("border.insertdetail", map);
	}//orderdetialInsert() end
	
	public void cartdelete(String s_id) {
		sqlSession.delete("border.cartdelete", s_id);
	}//cartdelete() end
	
}//class end
