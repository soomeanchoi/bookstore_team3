package kr.co.itwill.book;

import kr.co.itwill.review.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookDAO {

    public BookDAO() {
        System.out.println("BookDAO()객체 생성됨");
    }//end


    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> list() {
        return sqlSession.selectList("book.list");
    }//list() end

    public List<Map<String, Object>> bestList() {
        return sqlSession.selectList("book.bestList");
    }//bestList() end

    public void insert(Map<String, Object> map) {
        sqlSession.insert("book.insert", map);
    }//insert() end

    public List<Map<String, Object>> search(String book_name) {
        return sqlSession.selectList("book.search", "%" + book_name + "%");
    }//search() end

    public Map<String, Object> detail(String isbn) {
        return sqlSession.selectOne("book.detail", isbn);
    }//detail() end

    public int reviewCount(ReviewDTO dto) {
        return sqlSession.selectOne("book.reviewCount", dto);
    }

    public String filename(String isbn) {
        return sqlSession.selectOne("book.filename", isbn);
    }//filename() end

    public void delete(String isbn) {
        sqlSession.delete("book.delete", isbn);
    }//delete() end

    public void update(Map<String, Object> map) {
        sqlSession.update("book.update", map);
    }//update() end

    public void count(String isbn) {
        sqlSession.update("book.count", isbn);
    }//count() end

    public double reviewScore(String isbn){
        return sqlSession.selectOne("book.score", isbn);
    }//reviewScore() end


}//class end
