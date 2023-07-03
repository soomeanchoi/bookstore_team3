package kr.co.itwill.book;

import kr.co.itwill.review.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookDAO {

    public BookDAO() {
        System.out.println("BookDAO()객체 생성됨");
    }//end


    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> totalList() {
        return sqlSession.selectList("book.totalList");
    }//list() end

    public List<BookDTO> comicList() {
        return sqlSession.selectList("book.comicList");
    }

    public List<BookDTO> novelList() {
        return sqlSession.selectList("book.novelList");
    }

    public List<BookDTO> poemList() {
        return sqlSession.selectList("book.poemList");
    }

    public List<BookDTO> humanismList() {
        return sqlSession.selectList("book.humanismList");
    }

    public List<BookDTO> techList() {
        return sqlSession.selectList("book.techList");
    }

    public List<BookDTO> socialList() {
        return sqlSession.selectList("book.socialList");
    }

    public List<BookDTO> selfList() {
        return sqlSession.selectList("book.selfList");
    }

    public List<BookDTO> itList() {
        return sqlSession.selectList("book.itList");
    }

    public List<BookDTO> testList() {
        return sqlSession.selectList("book.testList");
    }

    public List<BookDTO> historyList() {
        return sqlSession.selectList("book.historyList");
    }

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

    public List<Map<String, Object>> writerSearch(String writer_name) {
        return sqlSession.selectList("book.writerSearch", "%" + writer_name + "%");
    }//search() end

    public Map<String, Object> detail(String isbn) {
        return sqlSession.selectOne("book.detail", isbn);
    }//detail() end

    public Map<String, Object> bookUpdate(String isbn) {
        return sqlSession.selectOne("book.bookUpdate", isbn);
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

    public List<Map<String, Object>> listPaging(int start, int end, String sort, String member_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("member_id", member_id);
        params.put("end", end);
        params.put("sort", sort);
        return sqlSession.selectList("book.listPaging", params);
    }

    public List<Map<String, Object>> bestMain(int start, int end, String main, String member_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        params.put("main", main);
        params.put("member_id", member_id);
        return sqlSession.selectList("book.bestMain", params);
    }

    public List<Map<String, Object>> bestMainPage(int start, int end, String member_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("end", end);
        params.put("member_id", member_id);
        return sqlSession.selectList("book.bestMainPage", params);
    }

    public int bookCount() {
        return sqlSession.selectOne("book.listCount");
    }

    public int bookCount2(String main) {
        return sqlSession.selectOne("book.listCount2", main);
    }

    public int choiceTable(Map<String, Object> map) {
        return sqlSession.selectOne("book.choiceTable", map);
    }

    public int reviewTable(Map<String, Object> map) {
        return sqlSession.selectOne("book.reviewTable", map);
    }

}//class end
