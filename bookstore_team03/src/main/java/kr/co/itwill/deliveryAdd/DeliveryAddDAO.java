package kr.co.itwill.deliveryAdd;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DeliveryAddDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<DeliveryAddDTO> list(String s_id) { 
		return sqlSession.selectList("deliveryAdd.list", s_id); 
	}//list() end
	 	
	public int insert(DeliveryAddDTO dto) {
		return sqlSession.insert("deliveryAdd.insert", dto);
	}//insert() end
	
	public void delete(DeliveryAddDTO dto) {
		sqlSession.delete("deliveryAdd.delete", dto.getDeliv_no());
	}//delete() end
	
	public DeliveryAddDTO detail(int deliv_no) {
		return sqlSession.selectOne("deliveryAdd.detail", deliv_no);
	}//detail() end
	
	public void update(DeliveryAddDTO dto) {
		System.out.println(sqlSession.update("deliveryAdd.update", dto));
		sqlSession.update("deliveryAdd.update", dto);
	}//update() end
	
	public int defupdate(DeliveryAddDTO dto) {
		return sqlSession.update("deliveryAdd.defupdate", dto);
	}//defupdate() end
	
}//class end
