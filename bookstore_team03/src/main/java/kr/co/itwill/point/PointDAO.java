package kr.co.itwill.point;

import kr.co.itwill.member.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointDAO {
    public PointDAO() {
        System.out.println("----PointDAO()객체 생성됨");
    }
    //스프링 빈으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;

    public List<PointDTO> pointList(String s_id){
        return sqlSession.selectList("point.list", s_id);
    }//list() end

    public int totalPoint(String s_id){
        return sqlSession.selectOne("point.totalPoint", s_id);
    }

    public List<PointDTO> plusList(String s_id){
        return sqlSession.selectList("point.plusPoint", s_id);
    }//list() end

    public List<PointDTO> minusList(String s_id){
        return sqlSession.selectList("point.minusPoint", s_id);
    }//list() end



}
