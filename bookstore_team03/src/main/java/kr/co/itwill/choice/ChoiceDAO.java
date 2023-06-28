package kr.co.itwill.choice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ChoiceDAO {

    public ChoiceDAO() {
        System.out.println("ChoiceDAO()객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    public int choiceInsert(ChoiceDTO dto) {
        return sqlSession.insert("choice.insert", dto);
    }//insert() end

    public List<Map<String ,Object>> choicelist(String member_id) {
        return sqlSession.selectList("choice.list", member_id);
    }//list() end

    public int choiceDelete(HashMap<String, Object> map) {
        return sqlSession.delete("choice.delete", map);
    }//delete() end

    public int choiceDel(ChoiceDTO dto) {
        return sqlSession.insert("choice.del", dto);
    }//insert() end

}//class end
