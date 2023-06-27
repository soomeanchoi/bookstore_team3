package kr.co.itwill.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PayDAO {

    @Autowired
    SqlSession sqlSession;

    public PayDAO() {
        System.out.println("----PointDAO()객체 생성됨");
    }

    public List<Map<String,Object>> selectData(String border_no){
        return sqlSession.selectList("pay.list", border_no);
    }


}
