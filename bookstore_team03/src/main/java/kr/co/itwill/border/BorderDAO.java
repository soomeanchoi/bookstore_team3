package kr.co.itwill.border;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//카트수량 업데이트
	public int cartUpdate(List<HashMap<String, Object>> cartlist) {
		return sqlSession.update("border.cartUpdate", cartlist);
	}//cartUpdate() end
	
	//기본배송지 가져오기
	public HashMap<String, Object> deliveryAdd(String s_id){	
		return sqlSession.selectOne("border.deliveryAdd", s_id);
	}//deliveryAdd() end
	
	//장바구니 가져오기
	public List<HashMap<String, Object>> cart(String s_id){
		return sqlSession.selectList("border.cart", s_id);
	}//deliveryAdd() end
	
	//직접구매시 책정보 가져오기
	public HashMap<String, Object> directborder(String isbn){
		return sqlSession.selectOne("border.directborder", isbn);
	}//directborder() end
		
	//보유포인트 가져오기
	public int havepoint(String s_id){
		return sqlSession.selectOne("border.havepoint", s_id);
	}//deliveryAdd() end	
	
	//border_price(상품총가격)
	public int border_price(String s_id) {
		return sqlSession.selectOne("border.border_price", s_id);
	}//border_price() end
	
	//주문번호생성위한중복개수조회
	public String dateno(String border_date) {
		return sqlSession.selectOne("border.dateno", border_date);
	}//dateno() end
	
	//직접구매: 주문서테이블행추가
	public int directinsert(BorderDTO dto) {
		return sqlSession.insert("border.insert" , dto);
	}//insert() end
	
	//장바구니구매: 주문서테이블행추가
	public int insert(BorderDTO dto) {
		//System.out.println(sqlSession.insert("border.insert" , dto));
		return sqlSession.insert("border.insert" , dto);
	}//insert() end
	
	//직접구매: 주문상세테이블행추가
	public int directorderlistInsert(HashMap<String, Object> map) {
		return sqlSession.insert("border.directorderlistInsert", map);
	}//directorderlistInsert() end
	
	//장바구니구매: 주문상세테이블행추가
	public int orderlistInsert(List<HashMap<String, Object>> list) {
		return sqlSession.insert("border.orderlistinsert", list);
	}//orderlistInsert() end
	
	//카트내용 삭제
	public void cartdelete(String s_id) {
		sqlSession.delete("border.cartdelete", s_id);
	}//cartdelete() end
	
}//class end
