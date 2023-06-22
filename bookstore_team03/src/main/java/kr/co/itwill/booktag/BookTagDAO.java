package kr.co.itwill.booktag;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookTagDAO {

    public BookTagDAO() {
        System.out.println("BookTagDAO()객체 생성됨");
    }//class end

    @Autowired
    SqlSession sqlSession;


    public List<Map<String, Object>> list() {

        return sqlSession.selectList("booktag.list");

    }//list() end

    public void insert(Map<String, Object> map) {

        sqlSession.insert("booktag.insert", map);

    }//insert() end

    public List<Map<String, Object>> search(String tag_name) {

        return sqlSession.selectList("booktag.search", "%" + tag_name + "%");

    }//search() end

    public Map<String, Object> detail(int tag_no) {

        return sqlSession.selectOne("booktag.detail", tag_no);

    }//detail() end

    public void delete(int tag_no) {

        sqlSession.delete("booktag.delete", tag_no);

    }//delete() end

    public void update(Map<String, Object> map) {

        sqlSession.update("booktag.update", map);

    }//update() end

    public List<Map<String, Object>> mylist(String member_id) {
        return sqlSession.selectList("booktag.mytag");
    }//list() end
    
}
