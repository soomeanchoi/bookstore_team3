package kr.co.itwill.research;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ResearchDAO {
    public ResearchDAO() {
        System.out.println("----ResearchDAO()객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<String> qlist(){return sqlSession.selectList("research.question");}
    public List<String> rlist_A(){return sqlSession.selectList("research.answer_A");}
    public List<String> rlist_B(){return sqlSession.selectList("research.answer_B");}
    public List<ResearchDTO> totalList(){return sqlSession.selectList("research.list");}
    public List<ResearchDTO> oneList(int research_no){return sqlSession.selectList("research.one", research_no);}

    public String result_A(String answer){return sqlSession.selectOne("research.result_A", answer);}
    public String result_A1(Map<String, Object> data){return sqlSession.selectOne("research.result_A1", data);}
    public String result_B1(Map<String, Object> data){return sqlSession.selectOne("research.result_B1", data);}
    public String result_B(String answer){return sqlSession.selectOne("research.result_B", answer);}

    public int insert(Map<String, Object> map){return sqlSession.insert("research.insert", map);}

    public int delete(int research_no){return sqlSession.delete("research.delete", research_no);}

    public int update(Map<String, Object> map){return sqlSession.update("research.update", map);}

    public int bbtiUpdate(Map<String, Object> map){return sqlSession.update("research.bbtiUpdate", map);}
}
