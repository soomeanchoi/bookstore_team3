package kr.co.itwill.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	public CartDAO() {
		System.out.println("----CartDAO() 객체생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int cartInsert(CartDTO dto) {
		return sqlSession.insert("cart.insert", dto);
	}//cartInsert() end
	
	public int cartupdate(CartDTO dto) {
		return sqlSession.update("cart.update", dto);
	}//cartupdate() end
	
	public List<Map<String, Object>> cartList(String s_id){
		return sqlSession.selectList("cart.list", s_id);
	}//cartList() end
	
	public int cartDelete(HashMap<String, Object> map) {
		return sqlSession.delete("cart.delete", map);
	}//cartDelete() end
	
}//class end
