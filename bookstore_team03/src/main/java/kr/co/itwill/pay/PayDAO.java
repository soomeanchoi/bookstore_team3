package kr.co.itwill.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.border.BorderDTO;

import java.util.List;
import java.util.Map;

@Repository
public class PayDAO {

    @Autowired
    SqlSession sqlSession;

    public PayDAO() {
        System.out.println("----PointDAO()객체 생성됨");
    }

    public List<Map<String, Object>> selectData(String border_no){
        return sqlSession.selectList("pay.list", border_no);
    }

    public String getName(String member_id){
        return sqlSession.selectOne("pay.name", member_id);
    }

    public int payFail_border(String border_no){
        return sqlSession.delete("pay.delBorder", border_no);
    }
    public int payFail_orderlist(String border_no){
        return sqlSession.delete("pay.delOrderlist", border_no);
    }

    public int payInsert(Map<String, Object> map) {return sqlSession.insert("pay.insert", map);}

    public int payPointPlus(Map<String, Object> map){ return sqlSession.update("pay.pointPlus", map);}
    public int payPointMinus(Map<String, Object> map){ return sqlSession.update("pay.pointMinus", map);}
}
