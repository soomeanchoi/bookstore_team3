package kr.co.itwill.intro;

import kr.co.itwill.review.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class IntroDAO {

    public IntroDAO() {
        System.out.println("IntroDAO()객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> bestList() {
        return sqlSession.selectList("intro.bestList");
    }//bestList() end

    public List<Map<String, Object>> todayList() {
        return sqlSession.selectList("intro.todayList");
    }//todayList() end

    public List<Map<String, Object>> randList() {
        return sqlSession.selectList("intro.randList");
    }//todayList() end

    public List<Map<String, Object>> todayWriter() {
        return sqlSession.selectList("intro.todayWriter");
    }//todayWriter() end

    public List<Map<String, Object>> reviewList(){
        return sqlSession.selectList("intro.reviewList");
    }//reviewList() end

    public List<Map<String, Object>> recentReview() {
        return sqlSession.selectList("intro.recentReview");
    }//todayWriter() end

    public List<Map<String, Object>> recentList() {
        return sqlSession.selectList("intro.recentList");
    }//todayWriter() end

    public List<Map<String, Object>> profile() {
        return sqlSession.selectList("intro.profile");
    }

    public List<Map<String, Object>> bbti(String member_id) {
        return sqlSession.selectList("intro.bbti", member_id);
    }



}
