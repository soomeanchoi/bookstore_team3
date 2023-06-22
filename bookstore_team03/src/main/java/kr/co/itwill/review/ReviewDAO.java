package kr.co.itwill.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAO {

    public ReviewDAO() {
        System.out.println("ReviewDAO()객체 생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    public int reviewInsert(ReviewDTO review){
        return sqlSession.insert("review.insert", review);
    }//insert() end


    public List<ReviewDTO> reviewlist(String isbn){
        return sqlSession.selectList("review.list", isbn);
    }//list() end


    public int reviewDelete(int review_no) throws Exception{
        return sqlSession.delete("review.delete", review_no);
    }//delete() end


    public int reviewUpdate(ReviewDTO review){
        return sqlSession.update("review.update", review);
    }//update() end

    public List<ReviewDTO> myreviewlist(String member_id){
        return sqlSession.selectList("review.mylist", member_id);
    }//list() end

}//ReviewDAO() end
