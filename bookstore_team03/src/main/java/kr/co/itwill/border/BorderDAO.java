package kr.co.itwill.border;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BorderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public BorderDAO() {
		System.out.println("----BorderDAO()객체생성");
	}//end
	
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
	
	
	///////페이징관련
	//페이징관련 총 글개수 가져오기
	public int totalRecord(String s_id) {
		return sqlSession.selectOne("border.totalRecord", s_id);
	}//totalRecord() end
	
	//페이징관련 시작/끝레코드 가져오기
	public List<HashMap<String, Object>> paginglist(HashMap<String, Object> map){	
		return sqlSession.selectList("border.paginglist", map);
	}//listBoard() end
	/*
	//주문내역 조회
	public List<BorderDTO> borderlist(String s_id) {
		return sqlSession.selectList("border.borderlist", s_id);
	}//borderlist() end
	*/	
	
	//주문상세조회
	public List<HashMap<String, Object>> orderlistDetail(String border_no) {
		return sqlSession.selectList("border.orderlistDetail", border_no);
	}//orderlistDetail() end

	public int orderCancel(Map<String, Object> map){
		return sqlSession.update("border.cancel", map);
	}

	public int cancelPirce(String border_no){
		return sqlSession.selectOne("border.cancelPrice", border_no);
	}
	
}//class end
