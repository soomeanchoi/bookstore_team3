package kr.co.itwill.writer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class WriterDAO {

    public WriterDAO() {
        System.out.println("WriterDAO()객체 생성됨");
    }//class end

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> list() {

        return sqlSession.selectList("writer.list");

    }//list() end

    public List<Map<String, Object>> totalList() {

        return sqlSession.selectList("writer.totalList");

    }//list() end

    public void insert(Map<String, Object> map) {

        sqlSession.insert("writer.insert", map);

    }//insert() end

    public List<Map<String, Object>> search(String writer_name) {

        return sqlSession.selectList("writer.search", "%" + writer_name + "%");

    }//search() end

    public Map<String, Object> detail(int writer_no) {

        return sqlSession.selectOne("writer.detail", writer_no);

    }//detail() end

    public String filename(int writer_no) {
    	
        return sqlSession.selectOne("writer.filename", writer_no);
        
    }//filename() end

    public void delete(int writer_no) {

        sqlSession.delete("writer.delete", writer_no);

    }//delete() end

    public void update(Map<String, Object> map) {

        sqlSession.update("writer.update", map);

    }//update() end

}//Writer() end
